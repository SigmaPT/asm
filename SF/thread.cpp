/*
  Stockfish, a UCI chess playing engine derived from Glaurung 2.1
  Copyright (C) 2004-2008 Tord Romstad (Glaurung author)
  Copyright (C) 2008-2015 Marco Costalba, Joona Kiiski, Tord Romstad

  Stockfish is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  Stockfish is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#include <algorithm> // For std::count
#include <cassert>
//#include <iostream>
//#include <sstream>

#include "movegen.h"
#include "search.h"
#include "thread.h"
#include "uci.h"


using namespace Search;

ThreadPool Threads; // Global object



 // start_routine() is the C function which is called when a new thread
 // is launched. It is a wrapper to the virtual function idle_loop().

 extern "C" { long start_routine(Thread* th) { th->idle_loop(); return 0; } }

/*
 // Helpers to launch a thread after creation and joining before delete. Must be
 // outside Thread c'tor and d'tor because the object will be fully initialized
 // when start_routine (and hence virtual idle_loop) is called and when joining.

 template<typename T> T* new_thread() {
   T* th = new T();
   thread_create(th->handle, start_routine, th); // Will go to sleep
   return th;
 }
*/

/// Thread constructor launches the thread and then waits until it goes to sleep
/// in idle_loop().

Thread::Thread() {

  resetCalls = exit = false;
  maxPly = callsCnt = 0;
  history.clear();
  counterMoves.clear();
  idx = Threads.size(); // Start from 0

  mutex.lock();
  searching = true;

  nativeThread = CreateThread(NULL,0,
    (LPTHREAD_START_ROUTINE)(&start_routine),this,0,NULL);


 // thread_create(&Thread::idle_loop, start_routine, this);
  //sleepCondition.wait(lk, [&]{ return !searching; });
  while (searching) sleepCondition.wait(mutex);
  mutex.unlock();
}


Thread::~Thread() {

  mutex.lock();
  exit = true;
  sleepCondition.notify_one();
  mutex.unlock();
  thread_join(nativeThread); // Wait for thread termination
}

/*
 void delete_thread(ThreadBase* th) {

   th->mutex.lock();
   th->exit = true; // Search must be already finished
   th->mutex.unlock();

   th->notify_one();
   thread_join(th->handle); // Wait for thread termination
   delete th;
 }
*/

/*
// ThreadBase::notify_one() wakes up the thread when there is some work to do

void ThreadBase::notify_one() {
  mutex.lock();
  sleepCondition.notify_one();
  mutex.unlock();
}
*/

void Thread::wait_for_search_finished() {

  mutex.lock();
  while (searching) sleepCondition.wait(mutex);
  mutex.unlock();
}

// ThreadBase::wait() set the thread to sleep until 'condition' turns true

void Thread::wait(volatile const bool& condition) {

  mutex.lock();
  while (!condition) sleepCondition.wait(mutex);
  mutex.unlock();

//  std::unique_lock<Mutex> lk(mutex);
//  sleepCondition.wait(lk, [&]{ return bool(condition); });

}


/// Thread::start_searching() wakes up the thread that will start the search

void Thread::start_searching(bool resume) {

  mutex.lock();

  if (!resume)
      searching = true;

  sleepCondition.notify_one();
  mutex.unlock();
}

/*
// ThreadBase::wait_while() set the thread to sleep until 'condition' turns false
void ThreadBase::wait_while(volatile const bool& b) {

  mutex.lock();
  while (b) sleepCondition.wait(mutex);
  mutex.unlock();

//  std::unique_lock<Mutex> lk(mutex);
//  sleepCondition.wait(lk, [&]{ return !condition; });

}
*/

/*
// Thread constructor makes some init but does not launch any execution thread,
// which will be started only when the constructor returns.

Thread::Thread() {

  searching = resetTimeCounter = false;
  maxPly = timeCounter = 0;
  history.clear();
  counterMoves.clear();
  idx = Threads.size(); // Starts from 0
}
*/



/// Thread::idle_loop() is where the thread is parked when it has no work to do

void Thread::idle_loop() {
  while (!exit)
  {
      mutex.lock();
      searching = false;
      while (!searching && !exit)
      {
          sleepCondition.notify_one(); // Wake up the UI thread if needed
          sleepCondition.wait(mutex);
      }
      mutex.unlock();
      if (!exit)
          search();
  }
}


/*
// MainThread::join() waits for main thread to finish thinking

void MainThread::join() {

  mutex.lock();
  while (thinking) {
    sleepCondition.wait(mutex);
  }
  mutex.unlock();

//  std::unique_lock<Mutex> lk(mutex);
//  sleepCondition.wait(lk, [&]{ return !thinking; });
}

*/


/// ThreadPool::init() creates and launches requested threads that will go
/// immediately to sleep. We cannot use a constructor because Threads is a
/// static object and we need a fully initialized engine at this point due to
/// allocation of Endgames in the Thread constructor.

void ThreadPool::init() {

  push_back(new MainThread);
  read_uci_options();
}


/// ThreadPool::exit() terminates threads before the program exits. Cannot be
/// done in destructor because threads must be terminated before deleting any
/// static objects while still in main().

void ThreadPool::exit() {

  while (size())
      delete back(), pop_back();
}


// ThreadPool::read_uci_options() updates internal threads parameters from the
// corresponding UCI options and creates/destroys threads to match the requested
// number. Thread objects are dynamically allocated to avoid creating all possible
// threads in advance (which include pawns and material tables), even if only a
// few are to be used.

void ThreadPool::read_uci_options() {
  size_t requested = Opt.Threads();
  assert(requested > 0);
  while (size() < requested)
      push_back(new Thread);
  while (size() > requested)
      delete back(), pop_back();
}


// ThreadPool::nodes_searched() returns the number of nodes searched

int64_t ThreadPool::nodes_searched() {

  int64_t nodes = 0;
  for (Thread *th : *this)
      nodes += th->rootPos.nodes_searched();
  return nodes;
}


// ThreadPool::start_thinking() wakes up the main thread sleeping in
// MainThread::idle_loop() and starts a new search, then returns immediately.

void ThreadPool::start_thinking(const Position& pos, const LimitsType& limits,
                                StateStackPtr& states) {

  main()->wait_for_search_finished();

  Signals.stopOnPonderhit = Signals.stop = false;

  main()->rootMoves.clear();
  main()->rootPos = pos;
  Limits = limits;

  if (states.get()) // If we don't set a new position, preserve current state
  {
      SetupStates = std::move(states); // Ownership transfer here
      assert(!states.get());
  }

  for (const auto& m : MoveList<LEGAL>(pos))
      if (   limits.searchmoves.empty()
          || std::count(limits.searchmoves.begin(), limits.searchmoves.end(), m))
          main()->rootMoves.push_back(RootMove(m));

  main()->start_searching();
}
