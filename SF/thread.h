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

#ifndef THREAD_H_INCLUDED
#define THREAD_H_INCLUDED

//#include <atomic>
//#include <bitset>
//#include <condition_variable>
//#include <mutex>
//#include <thread>
#include <vector>

#include "material.h"
#include "movepick.h"
#include "pawns.h"
#include "position.h"
#include "search.h"
//#include "thread_win32.h"


struct Mutex {
  Mutex() { lock_init(l); }
 ~Mutex() { lock_destroy(l); }

  void lock() { lock_grab(l); }
  void unlock() { lock_release(l); }

private:
  friend struct ConditionVariable;

  Lock l;
};

struct ConditionVariable {
  ConditionVariable() { cond_init(c); }
 ~ConditionVariable() { cond_destroy(c); }

  void wait(Mutex& m) { cond_wait(c, m.l); }
  void wait_for(Mutex& m, int ms) {cond_timedwait(c, m.l, ms);} //{ timed_wait(c, m.l, ms); }
  void notify_one() { cond_signal(c); }

private:
  WaitCondition c;
};


/// Thread struct keeps together all the thread-related stuff. We also use
/// per-thread pawn and material hash tables so that once we get a pointer to an
/// entry its life time is unlimited and we don't have to care about someone
/// changing the entry under our feet.


class Thread {

  NativeHandle nativeThread;
  Mutex mutex;
  ConditionVariable sleepCondition;
  bool exit, searching;

public:
  Thread();
  virtual ~Thread();
  virtual void search();
  void idle_loop();
//  long unsigned int idle_loop(void*);
  void start_searching(bool resume = false);
  void wait_for_search_finished();
  void wait(volatile const bool& b);

  Pawns::Table pawnsTable;
  Material::Table materialTable;
  Endgames endgames;
  size_t idx, PVIdx;
  int maxPly, callsCnt;

  Position rootPos;
  Search::RootMoveVector rootMoves;
  Depth rootDepth;
  HistoryStats history;
  MoveStats counterMoves;
  Depth completedDepth;
  volatile bool resetCalls;
};


/// MainThread is a derived class with a specific overload for the main thread

struct MainThread : public Thread {
  virtual void search();

  bool easyMovePlayed, failedLow;
  double bestMoveChanges;
  Value previousScore;
};


/// ThreadPool struct handles all the threads-related stuff like init, starting,
/// parking and, most importantly, launching a thread. All the access to threads
/// data is done through this class.

struct ThreadPool : public std::vector<Thread*> {

  void init(); // No constructor and destructor, threads rely on globals that should
  void exit(); // be initialized and valid during the whole thread lifetime.

  MainThread* main() { return static_cast<MainThread*>(at(0)); }
  void start_thinking(const Position&, const Search::LimitsType&, Search::StateStackPtr&);
  void read_uci_options();
  int64_t nodes_searched();
};

extern ThreadPool Threads;

#endif // #ifndef THREAD_H_INCLUDED
