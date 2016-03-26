Version 4:
    - added Search_<ROOT,PV,CUT,ALL,QUIET> functions
    - added MultiPV option
    - added timer thread
    - qsearch touches hash now

Version 3:
    - removed slow memory bit operations in function MakeMove ( bt [mem],reg , btr [mem],reg , ect)
    - fixed two bugs in function HashStore
    - added move ordering including killers and StaticExchangeEvaluation function
    - added endgame knowledge for KQvK, KRvK, KBBvK, KBNvK, and KPvK
    - added incremental PST calculations in MakeMove
    - fixed bug that didn't subtract PAWN_MSCORE on ep captures

Version 2:
    - intermediate version in case Verson 3 blows up
    - lots of mess here

Version 1:
    - alpha beta searcher
    - principal variation search
    - null move
    - check extensions
    - hash table
    - magic bitboards for move generation, uses pext when HAVE_BMI2

