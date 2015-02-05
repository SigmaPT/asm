0. the gui:
- basic making moves and taking back
- supports uci engines for playing and kibitzing
- should use minimal resources while maintaining nice appearance
- F1, F2, F3 - toggle game status, thinking lines, and kibitzing windows
- right click on main background for menu

1. about another chess engine ace:
- it is a rewrite of stockfish into x86-64
- assemble with fasm (www.flatassembler.net)
- all of the nonsense that results from c++ coders wrestling with a compiler is avoided here
- hopefully it gather interest from other asm coders or prospective asm coders
- if ever completed, it should have the same functionality as stockfish
  - see 3. below for why this possibility has been abnegated in favour of removing piece lists
- name ace was chosen so that ace.asm appears first in alphabetical lists

2. assembling:
- main source is ace.asm
  - source is divided up into many files becuase ordering of these files in ace.asm can effect performance
- ace is written for haswell with macros used to simulate instructions on lower cpu's
  - even without popcnt, performance only drops a few %
- CPU_HAS_... (most important) indicates available instructions
  - program does a runtime check to see if these really are avaiable
- DEBUG turns on some printing and asserts
- DISPLAY_CURRMOVE displays the current move while searching the root

3. about the code so far:
- in a baby state
- if you see popcnt with three operands, don't panic, it just a macro that needs a temp for non-popcnt cpu's (BasicMacros.asm)
- the thread code from stockfish has been preserved for the most part
  - the global variable Threads has been renamed threadPool
  - the vector of threads in threadPool have been given static allocation
  - the silly function start_routine has been eliminated
- the global variable rootMoves has been given static allocation
  - this is ok because everthing has a maxsize
- the move generation and picking function have been rewritten
  - no piece lists!
    - move ordering in movegen is different
	- the piece lists are maintain in Pos structure simply by bitboards
  - the CheckInfo structure has been merged into the State structure
  - the sequence of State structures has been reworked as a simple array instead of a linked list
    - this will incur a copy cost at split points when this is written
    - but 50 move rule checking is easier
  - there are two version of do_move, for setting ci or not
- the search function is not fully written yet
- the qsearch function is fully written :)
- the evaluation function is not written yet
  - just the middle game psq
  - most changes to stockfish occur in evaluation, so not motivated to write this

4. non-uci commands:
- moves x..	makes the moves x.. from the current pos. if illegal move appears in list, parsing stops there
- undo n:1	undoes n moves
- show		displays the current board
- eval		displays the output of Evaluate on current position
- perft n	usual depth n node count. tests Gen_Legal. with DEBUG = 1, TestPosition is called on each node 
- perftp n	same as perft but tests Pick structure
- test		tests IsMovePseudoLegal, IsMoveLegal, and Gen_Legal. calls TestPosition
- verify	verifies that incrementally updated State information is correct. calls VerifyPositionState
- isok		makes sure the pos information is legal. calls IsPositionOk

5. register conventions:
- follows MS x64 calling convention for the most part
- uses rdi/rsi for strings were appropriate
- rbp is generally used to hold the Pos structure
- rbx is generally used to hold the current State structure
- rsi is generally used in the search function to hold the Stack or the Pick structures

6. os:
- windows
- uses only window kernel functions for now
- linux port should be easy, as it should involve only a rewrite of Windows.asm and minimal changes to ace.asm

7. notes about fasm:
- mov x, y	is a definition that actually executes in your program (zeroth)
- cmp x, y	is a condition that actually executes in your program (zeroth)
- x = y 	is a definition/condition that is handled by the assembler (first)
- x eq y	is a condition that is handled by the parser (second)
- match =x,y	is a condition that is handled by the preprocessor (third)
- x equ y	is a definition of x that is handled by the preprocessor (third)
- x fix y	is a definition of x that is handled by prepreprocessor (fourth)


