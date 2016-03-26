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

#ifndef UCI_H_INCLUDED
#define UCI_H_INCLUDED

#include <map>
#include <cstring>

#include "types.h"

/*
extern int    Options_Contempt;
extern int    Options_MinSplitDepth;
//extern size_t Options_Threads;
extern size_t Options_Hash;
extern bool   Options_Ponder;
extern size_t Options_MultiPV;
extern int    Options_SkillLevel;
extern int    Options_MoveOverhead;
extern int    Options_MinThinkTime;
extern int    Options_SlowMover;
extern int    Options_NodesTime;
extern bool   Options_UCI_Chess960;
extern char*  Options_SyzygyPath;
extern int    Options_SyzygyProbeDepth;
extern int    Options_Syzygy50MoveRule;
extern int    Options_SyzygyProbeLimit;
*/

class Position;

namespace UCI {

//class Option;

///// Custom comparator because UCI options should be case insensitive
//struct CaseInsensitiveLess {
//  bool operator() (const std::string&, const std::string&) const;
//};

///// Our options container is actually a std::map
//typedef std::map<std::string, Option, CaseInsensitiveLess> OptionsMap;

/// Option class implements an option as defined by UCI protocol
class Options {

public:
  Options() {
    _Contempt         = 0;
    _Threads          = 1;
    _Hash             = 16;
    _Ponder           = false;
    _MultiPV          = 1;
    _SkillLevel       = 20;
    _MoveOverhead     = 30;
    _MinThinkTime     = 20;  
    _SlowMover        = 80;  
    _UCI_Chess960     = false;
    _NodesTime        = 0;
    strcpy(_SyzygyPath = new char [8],"<empty>");
    _SyzygyProbeDepth = 1;
    _Syzygy50MoveRule = true;
    _SyzygyProbeLimit = 6;
  }
  ~Options() {
    delete[] _SyzygyPath;
  }
  char*print_options(char*os) {
    os = print_string(os,"option name Threads type spin default 1 min 1 max 50\n");
    os = print_string(os,"option name Hash type spin default 16 min 1 max 1048576\n");
    os = print_string(os,"option name MultiPV type spin default 1 min 1 max 250\n");
    os = print_string(os,"option name Contempt type spin default 0 min -100 max 100\n");
    os = print_string(os,"option name SkillLevel type spin default 20 min 0 max 20\n");
    os = print_string(os,"option name MoveOverhead type spin default 30 min 0 max 5000\n");
    os = print_string(os,"option name MinThinkTime type spin default 20 min 0 max 5000\n");
    os = print_string(os,"option name SlowMover type spin default 80 min 10 max 1000\n");
    os = print_string(os,"option name NodesTime type spin default 0 min 0 max 10000\n");
    os = print_string(os,"option name ClearHash type button\n");
    os = print_string(os,"option name Ponder type check default false\n");
    os = print_string(os,"option name UCI_Chess960 type check default false\n");
    return os;
  }
  size_t  Threads() {return _Threads;};
  void    Threads(size_t x) {_Threads = x<1 ? 1 : x>50 ? 50 : x;};
  size_t  Hash() {return _Hash;};
  void    Hash(size_t x) {_Hash = x<1 ? 1 : x>1048576 ? 1048576 : x;};
  size_t  MultiPV() {return _MultiPV;};
  void    MultiPV(size_t x) {_MultiPV = x<1 ? 1 : x>250 ? 250 : x;};
  int     Contempt() {return _Contempt;};
  void    Contempt(int x) {_Contempt = x<-100 ? -100 : x>100 ? 100 : x;};
  int     SkillLevel() {return _SkillLevel;};
  void    SkillLevel(int x) {_SkillLevel = x<0 ? 0 : x>20 ? 20 : x;};
  int     MoveOverhead() {return _MoveOverhead;};
  void    MoveOverhead(int x) {_MoveOverhead = x<0 ? 0 : x>5000 ? 5000 : x;};
  int     MinThinkTime() {return _MinThinkTime;};
  void    MinThinkTime(int x) {_MinThinkTime = x<0 ? 0 : x>5000 ? 5000 : x;};
  int     SlowMover() {return _SlowMover;};
  void    SlowMover(int x) {_SlowMover = x<0 ? 0 : x>5000 ? 5000 : x;};
  int     NodesTime() {return _NodesTime;};
  void    NodesTime(int x) {_NodesTime = x<0 ? 0 : x>10000 ? 10000 : x;};
  char*   SyzygyPath() {return _SyzygyPath;};
  void    SyzygyPath(const char*ptr) {
            size_t n = strlen(ptr);
            delete[] _SyzygyPath;
            _SyzygyPath = new char [n+1];
            memcpy(_SyzygyPath,ptr,n+1);
          }
  int     SyzygyProbeDepth() {return _SyzygyProbeDepth;};
  void    SyzygyProbeDepth(int x) {_SyzygyProbeDepth = x<1 ? 0 : x>100 ? 100 : x;};
  int     SyzygyProbeLimit() {return _SyzygyProbeLimit;};
  void    SyzygyProbeLimit(int x) {_SyzygyProbeLimit = x<1 ? 0 : x>6 ? 6 : x;};
  bool    Syzygy50MoveRule() {return _Syzygy50MoveRule;};
  void    Syzygy50MoveRule(bool x) {_Syzygy50MoveRule = x;};
  bool    UCI_Chess960() {return _UCI_Chess960;};
  void    UCI_Chess960(bool x) {_UCI_Chess960 = x;};
  bool    Ponder() {return _Ponder;};
  void    Ponder(bool x) {_Ponder = x;};



private:
  size_t _Threads;
  size_t _Hash;
  size_t _MultiPV;
  int    _Contempt;
  int    _SkillLevel;
  int    _MoveOverhead;
  int    _MinThinkTime;
  int    _SlowMover;
  int    _NodesTime;
  char*  _SyzygyPath;
  int    _SyzygyProbeDepth;
  int    _SyzygyProbeLimit;
  bool   _Syzygy50MoveRule;
  bool   _UCI_Chess960;
  bool   _Ponder;
};


//void init(OptionsMap&);
void init();
void loop(int argc, char* argv[]);
//std::string value(Value v);
//std::string square(Square s);
//std::string move(Move m, bool chess960);
//std::string pv(const Position& pos, Depth depth, Value alpha, Value beta);
//Move to_move(const Position& pos, std::string& str);

char* print_value(char* s, Value);
char* print_square(char* s, Square);
char* print_move(char* s, Move, bool);
char* print_pv(char*, const Position&, Depth, Value, Value);
Move  parse_move(const Position&, char*);


} // namespace UCI

extern UCI::Options Opt;

#endif // #ifndef UCI_H_INCLUDED
