module Akord where


{- Akord je posloupnost tonu 1 - 12 (C, Cis, D, Dis, E, F, Fis, G, Gis, A, Ais, H), hlavni stupnice je 1-3-5-6-8-10-12.
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


t :: Akord

t = [1,5,8]


ii :: Akord

ii = [3, 6, 10]


iii :: Akord

iii = [5, 8, 12]


s :: Akord

s = [6, 10, 1]


d :: Akord

d = [8, 12, 3]


vi :: Akord

vi = [10, 1, 5]


vii :: Akord

vii = [12, 3, 6]


t7 :: Akord

t7 = [1, 5, 8, 12]


ii7 :: Akord

ii7 = [3, 6, 10, 1]


iii7 :: Akord

iii7 = [5, 8, 12, 3]


s7 :: Akord

s7 = [6, 10, 1, 5]


d7 :: Akord

d7 = [8, 12, 3, 6]


vi7 :: Akord

vi7 = [10, 1, 5, 8]


vii7 :: Akord

vii7 = [12, 3, 6, 10]
