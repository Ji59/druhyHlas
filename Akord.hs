module Akord where


{- Akord je posloupnost tonu 1 - 12, zakladni stupnice je 1-3-5-6-8-10-12.
 -
 - Hlavni akordy:
 -   Tonika (T): 1-5-8
 -   Subdominanta (S): 6-10-1
 -   Dominanta (D): 8-12-3
 -
 - Vsechny akordy:
 -   T     1-5-8
 -   II    3-6-10
 -   III   5-8-12
 -   S     6-10-1
 -   D     8-12-3
 -   VI    10-1-5
 -   VII   12-3-6
 -
 - Septakordy:
 -   T7    1-5-8-12
 -   II7   3-6-10-1
 -   III7  5-8-12-3
 -   S7    6-10-1-5
 -   D7    8-12-3-6
 -   VI7   10-1-5-8
 -   VII7  12-3-6-10
 -}

type Akord = [Int]


at :: Akord

at = [1,5,8]


aii :: Akord

aii = [3, 6, 10]


aiii :: Akord

aiii = [5, 8, 12]


as :: Akord

as = [6, 10, 1]


ad :: Akord

ad = [8, 12, 3]


avi :: Akord

avi = [10, 1, 5]


avii :: Akord

avii = [12, 3, 6]


at7 :: Akord

at7 = [1, 5, 8, 12]


aii7 :: Akord

aii7 = [3, 6, 10, 1]


aiii7 :: Akord

aiii7 = [5, 8, 12, 3]


as7 :: Akord

as7 = [6, 10, 1, 5]


ad7 :: Akord

ad7 = [8, 12, 3, 6]


avi7 :: Akord

avi7 = [10, 1, 5, 8]


avii7 :: Akord

avii7 = [12, 3, 6, 10]
