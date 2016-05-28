1. about asmsf:
- it is a rewrite of stockfish into x86-64
- assemble with fasm (www.flatassembler.net)
- all of the nonsense that results from c++ coders wrestling with a compiler is avoided here
- hopefully it gather interest from other asm coders or prospective asm coders
- barring any bugs, any functional difference with the real sf should be inconsequential  see 3.

2. assembling:
- main source is asmsfw.asm for windows asmsf.asm for unix
  - source is divided up into many files becuase ordering of these files in asmsf.asm can effect performance
- asmsf is written for haswell with macros used to simulate instructions on lower cpu's
  - even without popcnt, performance only drops a few %
- CPU_HAS_... (most important) indicates available instructions
  - program does a runtime check to see if these really are avaiable
- DEBUG turns on some printing and asserts
- VERBOSE turns on lots of printing. should only be used when searching for bugs

3. about the code so far:
- unix is no even close to being done
- parsing of chess960 positions is not done yet
- weakness or skill levels is not done yet
- syzygy code is complete but completely untested so it will surely crash if you set the syzygypath :)
- similarly, code as not be tested on a cpu without avx, so it might crash on older cpus due to a bug in the macros
- not tested on more than one core
- if you see popcnt with three operands, don't panic, its just a macro that needs a temp for non-popcnt cpu's BasicMacros.asm
- there are three kinds of threads
  - the gui thread reads from stdin and uses the pos1 and pos2 structures
  - the main search thread
  - n-1 worker threads
- the move generation and picking function have been rewritten
- no piece lists!
  - move ordering in movegen is different
    - the piece lists are maintain in Pos structure simply by bitboards
- the CheckInfo structure has been merged into the State structure
- the SearchStack structure has been merged into the State structure
- the sequence of states is stored as a vector as opposed to a linked list
  - the size of this container should expand and shrink automatically in the gui thread
  - the size of vector of states used in search threads is fixed on thread creation
    - we only need 100+MAX_PLY entries for a search thread
- Move_Do does no prefetching
- the movepick function is fully written and not optimized
- the qsearch function is fully written and slghtly optimied
- the search function is fully written and not optimized
- the evaluation function is fully written and not optimized
- the endgame functions are written are slightly tested
- sysygy is incorporated but not tested

4. non-uci commands:
- moves x..	makes the moves x.. from the current pos. if illegal move appears in list, parsing stops there
- undo n:1	undoes n moves
- show		displays the current board
- eval		displays the output of Evaluate on current position

5. register conventions:
- follows MS x64 calling convention for the most part
- uses rdi/rsi for strings were appropriate, rdi for writing to, rsi for reading from
- rbp is very much used to hold the Pos structure
  - above rbp is the position structure
  - below rbp is the thread struct
  - so this register doesn't need to change while a thread is thinking
- rbx is used to hold the current State structure
- rsi is generally used in the search function to hold the Stack or the Pick structures

6. os:
- windows uses only window kernel functions for now
- linux port should be easy, as it should involve only a rewrite of OsWindows.asm and minimal changes to asmsf.asm

7. notes about fasm:
- mov x, y	is a definition that actually executes in your program (zeroth)
- cmp x, y	is a condition that actually executes in your program (zeroth)
- x = y 	is a definition/condition that is handled by the assembler (first)
- x eq y	is a condition that is handled by the parser (second)
- match =x,y	is a condition that is handled by the preprocessor (third)
- x equ y	is a definition of x that is handled by the preprocessor (third)
- x fix y	is a definition of x that is handled by prepreprocessor (fourth)


