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

//#include <iostream>
//#include <sstream>
#include <cstring>

#include "evaluate.h"
#include "movegen.h"
#include "position.h"
#include "search.h"
#include "thread.h"
#include "timeman.h"
#include "tt.h"
#include "syzygy/tbprobe.h"

#include "uci.h"


UCI::Options Opt;

//int    Options_Contempt;
//int    Options_MinSplitDepth;
//size_t Options_Threads;
//size_t Options_Hash;
//bool   Options_Ponder;
//size_t Options_MultiPV;
//int    Options_SkillLevel;
//int    Options_MoveOverhead;
//int    Options_MinThinkTime;
//int    Options_SlowMover;
//int    Options_NodesTime;
//bool   Options_UCI_Chess960;
//char*  Options_SyzygyPath;
//int    Options_SyzygyProbeDepth;
//int    Options_Syzygy50MoveRule;
//int    Options_SyzygyProbeLimit;


using namespace std;

//extern void benchmark(const Position& pos, istream& is);

extern void benchmark(const char*, Position&, int,  size_t, size_t);


namespace {

  // FEN string of the initial position, normal chess
  const char* StartFEN = "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1";

  // Stack to keep track of the position states along the setup moves (from the
  // start position to the position just before the search starts). Needed by
  // 'draw by repetition' detection.
  Search::StateStackPtr SetupStates;


  // position() is called when engine receives the "position" UCI command.
  // The function sets up the position described in the given FEN string ("fen")
  // or the starting position ("startpos") and then makes the moves given in the
  // following move list ("moves").

void position(Position& pos, const char* is) {
  Move m;
  char token[128]; 
//  const char* startfen = "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1";
  is = parse_token_lower(is,token);    
  if(strcmp(token,"startpos")==0) {
    pos.parse_set(StartFEN, Opt.UCI_Chess960(), Threads.main());
  }
  else if (strcmp(token,"fen")==0) {
    is = pos.parse_set(is, Opt.UCI_Chess960(), Threads.main());
  }
  else {
    return;
  }
  is = parse_gettoken(is,token); // Consume "moves" token if any
  SetupStates = Search::StateStackPtr(new std::stack<StateInfo>());
  // Parse move list (if any)
  while (true) {
    is = parse_token_lower(is,token);
    m = UCI::parse_move(pos, token);
    if (m == MOVE_NONE) break;
    SetupStates->push(StateInfo());
    pos.do_move(m, SetupStates->top(), pos.gives_check(m, CheckInfo(pos)));
  }
}


  // setoption() is called when engine receives the "setoption" UCI command. The
  // function updates the UCI option ("name") to the given value ("value").


void setoption(const char* is) {
  char token[256], blah[16];
  int x;
  is = parse_gettoken(is,blah); // Consume "name" token
  is = parse_token_lower(is,token); // get name CANNOT CONTAIN SPACES
  is = parse_token_lower(is,blah); // Consume "value" token
  while (*is==' ') is++;
  if (*token == '\0') return;
  else if (strcmp(token,"hash")==0) {
    is = parse_int(is,x); Opt.Hash(x);
    TT.resize(Opt.Hash());
  }
  else if (strcmp(token,"threads")==0) {
    is = parse_int(is,x); Opt.Threads(x);
    Threads.read_uci_options();
  }
  else if (strcmp(token,"clearhash")==0) {
    TT.clear();
  }
  else if (strcmp(token,"contempt")==0) {
    is = parse_int(is,x); Opt.Contempt(x);
  }
  else if (strcmp(token,"multipv")==0) {
    is = parse_int(is,x); Opt.MultiPV(x);
  }
  else if (strcmp(token,"minthinktime")==0) {
    is = parse_int(is,x); Opt.MinThinkTime(x);
  }
  else if (strcmp(token,"moveoverhead")==0) {
    is = parse_int(is,x); Opt.MoveOverhead(x);
  }
  else if (strcmp(token,"skilllevel")==0) {
    is = parse_int(is,x); Opt.SkillLevel(x);
  }
  else if (strcmp(token,"slowmover")==0) {
    is = parse_int(is,x); Opt.SlowMover(x);
  }
  else if (strcmp(token,"syzygypath")==0) {
    Opt.SyzygyPath(is);
    Tablebases::init(Opt.SyzygyPath());
  }
}



  // go() is called when engine receives the "go" UCI command. The function sets
  // the thinking time and other parameters from the input string, then starts
  // the search.

void go(const Position& pos, const char* is) {
  char token[32];
  Search::LimitsType limits;
  limits.startTime = now(); // As early as possible!
  while (is = parse_gettoken(is,token), *token != '\0') {
    if (strcmp(token,"searchmoves")==0) {
      while (is = parse_gettoken(is,token), *token != '\0') {
        limits.searchmoves.push_back(UCI::parse_move(pos, token));
      }
    }
    else if (strcmp(token,"wtime")==0) {is = parse_int(is,limits.time[WHITE]);}
    else if (strcmp(token,"btime")==0) {is = parse_int(is,limits.time[BLACK]);}
    else if (strcmp(token,"winc")==0) {is = parse_int(is,limits.inc[WHITE]);}
    else if (strcmp(token,"binc")==0) {is = parse_int(is,limits.inc[BLACK]);}
    else if (strcmp(token,"movestogo")==0) {is = parse_int(is,limits.movestogo);}
    else if (strcmp(token,"depth")==0) {is = parse_int(is,limits.depth);}
    else if (strcmp(token,"nodes")==0) {is = parse_int(is,limits.nodes);}
    else if (strcmp(token,"movetime")==0) {is = parse_int(is,limits.movetime);}
    else if (strcmp(token,"mate")==0) {is = parse_int(is,limits.mate);}
    else if (strcmp(token,"infinite")==0) {limits.infinite = true;}
    else if (strcmp(token,"ponder")==0) {limits.ponder = true;}
  }
  Threads.start_thinking(pos, limits, SetupStates);
}



} // namespace





/// UCI::loop() waits for a command from stdin, parses it and calls the appropriate
/// function. Also intercepts EOF from stdin to ensure gracefully exiting if the
/// GUI dies unexpectedly. When called with some command line arguments, e.g. to
/// run 'bench', once the command is executed the function returns immediately.
/// In addition to the UCI ones, also some additional debug commands are supported.

void UCI::loop(int argc, char* argv[]) {

  Position pos(StartFEN, false, Threads.main()); // The root position

  char InputString[4096], OutputString[1024], token[128], *os;
  const char *is;

      os = OutputString;
      os = print_string(os,"id name Stockfish lean\n");
      os = print_string(os,"id author Tord Romstad, Marco Costalba and Joona Kiiski\n");
      os = Opt.print_options(os);
      os = print_string(os,"uciok\n");
      write_out(OutputString,os);

  os = OutputString;
  os = print_engine_info(os); *os++ = '\n';
  write_out(OutputString,os);
  os = InputString;
  for (int i = 1; i < argc; ++i) {
    os = print_string(os,argv[i]); *os++ = ' ';
  }
  do {
    if (argc<=1 && read_in(InputString)) break;
    is = parse_gettoken(InputString,token);
    os = OutputString;   
    if (*token<' ') continue;
    if (strcmp(token,"quit")==0) {
      Search::Signals.stop = true;
      Threads.main()->start_searching(true); // Could be sleeping
      break;
    }
    else if (    strcmp(token,"stop")==0
             || (strcmp(token,"ponderhit")==0 && Search::Signals.stopOnPonderhit)) {
      Search::Signals.stop = true;
      Threads.main()->start_searching(true); // Could be sleeping
    }
    else if (strcmp(token,"isready")==0) {
      os = print_string(os,"readyok\n");
      write_out(OutputString,os);
    }
    else if (strcmp(token,"go")==0) {
      go(pos, is);
    }
    else if (strcmp(token,"position")==0) {
      position(pos, is);
    }
    else if (strcmp(token,"ponderhit")==0) {
      Search::Limits.ponder = 0; // Switch to normal search
    }
    else if (strcmp(token,"uci")==0) {
      os = print_string(os,"id name Stockfish lean\n");
      os = print_string(os,"id author Tord Romstad, Marco Costalba and Joona Kiiski\n");
      os = Opt.print_options(os);
      os = print_string(os,"uciok\n");
      write_out(OutputString,os);
    }
    else if (strcmp(token,"ucinewgame")==0) {
      Search::clear();
      Time.availableNodes = 0;
    }
    else if (strcmp(token,"setoption")==0) {
      setoption(is);
    }
    else if (strcmp(token,"perft")==0) {
      int n;
      is = parse_int(is, n);
      benchmark("perft", pos, n, 16, 1);
    }
    else if (strcmp(token,"bench")==0) {
      benchmark("depth", pos, 16, 32, 1);
    }
    else {
      os = print_string(os,"Unknown command: ");
      os = print_vstring(os,token); *os++ = '\n';
      write_out(OutputString,os);
    }
  } while (argc <= 1); // Passed args have one-shot behaviour
  Threads.main()->wait_for_search_finished();
}


char* UCI::print_value(char* s, Value v) {

  if (abs(v) < VALUE_MATE - MAX_PLY) {
    s = print_string(s,"cp ");
    s = print_int(s, (v * 100) / PawnValueEg);
  }
  else {
    s = print_string(s,"mate ");
    s = print_int(s, (v > 0 ? VALUE_MATE - v + 1 : -VALUE_MATE - v) / 2);    
  }

  return s;
}



char* UCI::print_square(char* s, Square sq) {
  *s++ = 'a' + file_of(sq);
  *s++ = '1' + rank_of(sq);
   return s;
}


char* UCI::print_move(char* s, Move m, bool chess960) {
  Square from = from_sq(m);
  Square to = to_sq(m);

  if (m == MOVE_NONE)
    return print_string(s,"(none)");

  if (m == MOVE_NULL)
    return print_string(s,"0000");

  if (type_of(m) == CASTLING && !chess960)
      to = make_square(to > from ? FILE_G : FILE_C, rank_of(from));

  s = print_square(s,from);
  s = print_square(s,to);
 
  if (type_of(m) == PROMOTION)
      *s++ = " pnbrqk"[promotion_type(m)];
  
  return s;
}


Move UCI::parse_move(const Position& pos, char* str) {  // str should already be converted to lower case
    char move[16], *s;
    for (const auto& m : MoveList<LEGAL>(pos)) {
        s = print_move(move,m, pos.is_chess960()); *s = '\0';
        if (strcmp(move,str)==0)
            return m;
    }
    return MOVE_NONE;
}




/*
void xboard_loop() {
  Search::LimitsType limits;
  Position pos(StartFEN, false, Threads.main()); // The root position
  SetupStates = Search::StateStackPtr(new std::stack<StateInfo>());


  char InputString[256], OutputString[1024], token[64], *os;

	printf("feature ping=1 setboard=1 colors=0 usermove=1 memory=1\n");
	printf("feature done=1\n");

  os = OutputString;
  os = print_engine_info(os, "feature ping=1 setboard=1 colors=0 usermove=1 memory=1\n");
  write_out(OutputString,os);
  os = OutputString;
  os = print_engine_info(os, "feature done=1\n");
  write_out(OutputString,os);

  int engineSide = BLACK;


  while (true) {

    if (read_in(InputString)) break;
    is = parse_gettoken(InputString,token);
    os = OutputString; 

    if () {


    }


    else if (strcmp(token, "new")==0) {
      Search::clear();
      engineSide = BLACK;
      Time.availableNodes = 0;
    }
    else if (strcmp(token, "quit")==0) {
      Search::Signals.stop = true;
      Threads.main()->notify_one();
      break;
    }
		else if (strcmp(token, "force")==0) {
			engineSide = WHITE+BLACK;
			continue;
		}
		else if (strcmp(token, "protover")==0) {
      os = OutputString;
      os = print_engine_info(os, "feature ping=1 setboard=1 colors=0 usermove=1 memory=1\n");
      write_out(OutputString,os);
      os = OutputString;
      os = print_engine_info(os, "feature done=1\n");
      write_out(OutputString,os);
			continue;
		}
    else if (strcmp(token,"memory")==0) {
      is = parse_int(is,x); Opt.Hash(x);
      TT.resize(Opt.Hash());
      continue;
    }

		else if (strcmp(token, "go")==0) {
			engineSide = pos.side_to_move();
			continue;
		}

    else if (strcmp(token,"usermove")==0) {
      is = parse_token_lower(is,token);
    }
    m = UCI::parse_move(pos, token);
    if (m == MOVE_NONE) continue;
    SetupStates->push(StateInfo());
    pos.do_move(m, SetupStates->top(), pos.gives_check(m, CheckInfo(pos)));    
  }

  Threads.main()->join(); // Cannot quit whilst the search is running
}

*/


