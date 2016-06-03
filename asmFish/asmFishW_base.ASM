; this is the source for windows  see asmFish.asm for unix
OS_IS_WINDOWS	 fix 1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; compile options 0 or 1
CPU_HAS_POPCNT	 equ 0	;  popcnt			very nice function
CPU_HAS_AVX1	 equ 0	;  256 bit floating point	probably only used for memory copy if used at all
CPU_HAS_AVX2	 equ 0	;  256 bit integer + fmadd	probably not used
CPU_HAS_BMI1	 equ 0	;  andn 			why not use it if we can
CPU_HAS_BMI2	 equ 0	;  pext + pdep			nice for move generation, but not much faster than magics
DEBUG		 equ 0	;  turns on the asserts 	use this for detecting bugs, should be no functional change
VERBOSE 	 equ 0	;  LOTS of print + eval trace	use this for hunting down bugs
PROFILE 	 equ 0	;  counts in the code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

include 'asmFishW.asm'