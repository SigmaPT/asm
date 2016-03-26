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

//#include <fstream>
//#include <iomanip>
//#include <iostream>
//#include <sstream>

#include "misc.h"
#include "thread.h"

using namespace std;

namespace {



} // namespace



HANDLE hStdIn;
HANDLE hStdOut;
HANDLE hStdError;
uint64_t Frequency;
uint64_t Period;


void MiscInit () {
  hStdIn    = GetStdHandle(STD_INPUT_HANDLE);
  hStdOut   = GetStdHandle(STD_OUTPUT_HANDLE);
  hStdError = GetStdHandle(STD_ERROR_HANDLE);
  QueryPerformanceFrequency((LARGE_INTEGER *)&Frequency);
  Period = math_2p64d(Frequency);
}


TimePoint now() { 
  int64_t ct;//int64_t ct;
  QueryPerformanceCounter((LARGE_INTEGER *)&ct);
int64_t ms;
    __asm__("mulq %2             \n\t"
            "xchgq %%rdx, %%rax      "
            : "=a" (ms)
            : "a" (Period), "rm" (ct)
            : "%rdx");
return ms;
}



void* v_alloc(size_t n) {
  return VirtualAlloc(NULL, n, MEM_COMMIT, PAGE_READWRITE);
}

void v_free(void* p) {
  VirtualFree(p,0,MEM_RELEASE);
}


bool write_out(char* s,char* t) {
  long unsigned byteswritten;
  return WriteFile(hStdOut,s,t-s,&byteswritten,NULL);
}

bool write_error(char* s,char* t) {
  long unsigned byteswritten;
  return WriteFile(hStdError,s,t-s,&byteswritten,NULL);
}

bool read_in(char* s) {
  long unsigned bytesread;
  bool rd;
  char ch;
  do {
    rd = ReadFile(hStdIn,s,1,&bytesread,NULL);
    ch = *s;
    if (rd && bytesread == 0)
      return true;
    if(ch>=' ') {*s++=ch;}
  } while (ch>= ' ');
  *s = '\0';
  return false;
}




// compute 1000*2^64/x
__attribute__ ((noinline)) uint64_t math_2p64d(uint64_t x) {
  uint64_t result;
  uint32_t pow = 64;
  uint32_t ms = 1000;
  short t1,t2;
  __asm__ (
          "fstcw %2\n\t"
          "fstcw %3\n\t"
          "orw $0xC00,%3\n\t"
          "fldcw %3\n\t"
          "fildl %4     \n\t"
          "fildl %5      \n\t"
          "fscale       \n\t"
          "fstp %%st(1) \n\t"
          "fildq %1       \n\t"
          "fdivrp   %%st(1)       \n\t"   // should be   fdivp st1    assembler is broken
          "fistpq %0    \n\t"
          "fldcw %2"
                  : "=m" (result)
                  : "m" (x), "m" (t1), "m" (t2), "m" (pow), "m" (ms)
                  : "st(5)", "st(6)", "st(7)", "%2", "%3");
  return(result);
}

__attribute__ ((noinline)) double math_exp(double x) {
    double result;
    short t1,t2;
    __asm__ (
             "fstcw %2\n\t"
             "fstcw %3\n\t"
             "orw $0xC00,%3\n\t"
             "fldcw %3\n\t"
             "fldl2e\n\t"
             "fmulp\n\t"
             "fld %%st(0)\n\t"
             "frndint\n\t"
             "fxch\n\t"
             "fsub %%st(1),%%st(0)\n\t"
             "f2xm1\n\t"
             "fld1\n\t"
             "faddp\n\t"
             "fxch\n\t"
             "fld1\n\t"
             "fscale\n\t"
             "fstp %%st(1)\n\t"
             "fmulp\n\t"
             "fldcw %2"
                     : "=t" (result)
                     : "0" (x), "m" (t1), "m" (t2)
                     : "st(6)", "st(7)", "%2", "%3");
    return(result);
    }



__attribute__ ((noinline)) double math_log(double x) {
    double result;
    short t1,t2;
    __asm__ (
             "fstcw %2\n\t"
             "fstcw %3\n\t"
             "orw $0xC00,%3\n\t"
             "fldcw %3\n\t"
             "fldln2\n\t"
             "fxch\n\t"
             "fyl2x\n\t"
             "fldcw %2"
                     : "=t" (result)
                     : "0" (x), "m" (t1), "m" (t2)
                     : "st(7)", "%2", "%3");
    return(result);
    }



__attribute__ ((noinline)) double math_pow(double x, double y) {
    double result;
    short t1,t2;
    __asm__ (
             "fxch\n\t"
             "ftst\n\t"
             "fstsw\n\t"
             "and $0x40,%%ah\n\t"
             "jz 1f\n\t"
             "fstp %%st(0)\n\t"
             "ftst\n\t"
             "fstsw\n\t"
             "fstp %%st(0)\n\t"
             "and $0x40,%%ah\n\t"
             "jnz 0f\n\t"
             "fldz\n\t"
             "jmp 2f\n\t"
             "0:\n\t"
             "fld1\n\t"
             "jmp 2f\n\t"
             "1:\n\t"
             "fstcw %3\n\t"
             "fstcw %4\n\t"
             "orw $0xC00,%4\n\t"
             "fldcw %4\n\t"
             "fld1\n\t"
             "fxch\n\t"
             "fyl2x\n\t"
             "fmulp\n\t"
             "fld %%st(0)\n\t"
             "frndint\n\t"
             "fxch\n\t"
             "fsub %%st(1),%%st(0)\n\t"
             "f2xm1\n\t"
             "fld1\n\t"
             "faddp\n\t"
             "fxch\n\t"
             "fld1\n\t"
             "fscale\n\t"
             "fstp %%st(1)\n\t"
             "fmulp\n\t"
             "fldcw %3\n\t"
             "2:"
                     : "=t" (result)
                     : "0" (y), "u" (x), "m" (t1), "m" (t2)
                     : "st(1)", "st(7)", "%3", "%4", "ax" );
    return(result);
    }



char* print_engine_info(char* s) {
  s = print_string(s,"Stockfish - lean and mean");
  return s;
}

char* print_vstring(char* s, char* t) {
  while ((*s++ = *t++)){;}
  s--;
  return s;
}

char* print_string(char* s, const char* t) {
  while ((*s++ = *t++)){;}
  s--;
  return s;
}

char* print_hex64(char* s, unsigned long long x) {
 *s++ = '0'; *s++ = 'x';
 for (int i = 15; i>=0; i--){
 unsigned int y = (x>>(4*i))&15;
 *s++ = (y < 10 ? '0'+y : 'A'+y-10);
 }
  return s;
}

char* print_int(char* s, int x) {
 if (x<0) {*s++='-';x=-x;}
 return print_int(s,(unsigned long long)x);
}
char* print_int(char* s, signed long long x) {
 if (x<0) {*s++='-';x=-x;}
 return print_int(s,(unsigned long long)x);
}

char* print_int(char* s, unsigned long long x) {
 unsigned long long r = x%10;
 unsigned long long q = x/10;
 if (q>0 && x!=0) {s=print_int(s,q);}
 *s++=r+'0'; return s; 
}

char* print_double(char* s, double x) {
  signed long long y = 100.0*x;
  if (y<0) {*s++='-';y=-y;}
  unsigned long long z = y;
  s = print_int(s, (z/100)); z = z % 100;
  *s++ = '.';
  *s++ = '0'+(z/10); z = z % 10;
  *s++ = '0'+(z);
  return s;
}

const char* parse_gettoken(const char* s, char* t) {
  while (*s == ' ') s++;
  while (*s > ' ') *t++ = *s++;
  *t = '\0';
  return s;
}

const char* parse_token_lower(const char* s, char* t) {
  while (*s == ' ') s++;
  while (*s > ' ') {
    if (*s >='A' && *s <= 'Z') {*t++ = (*s++)+'a'-'A';}
    else {*t++ = *s++;}
  }
  *t = '\0';
  return s;
}


const char* parse_int(const char* s, size_t& z) {
  size_t x=0;
  while (*s == ' ') {s++;}
  while ('0' <= *s && *s <= '9') {x=10*x+(*s-'0');s++;}
  z = x;
  return s;
}

const char* parse_int(const char* s, int& z) {
  int x=0;
  int y=1;
  while (*s == ' ') {s++;}
  if (*s == '-') {y=-1;s++;}
  else if (*s == '+') {y=1;s++;}
  while (*s == ' ') {s++;}
  while ('0' <= *s && *s <= '9') {x=10*x+(*s-'0');s++;}
  z = x*y;
  return s;
}

const char* parse_int(const char* s, signed long long& z) {
  signed long long x=0;
  signed long long y=1;
  while (*s == ' ') {s++;}
  if (*s == '-') {y=-1;s++;}
  else if (*s == '+') {y=1;s++;}
  while (*s == ' ') {s++;}
  while ('0' <= *s && *s <= '9') {x=10*x+(*s-'0');s++;}
  z = x*y;
  return s;
}









