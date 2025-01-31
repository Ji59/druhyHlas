module Akord where


import Ton


{- Akord je posloupnost tonu 1 - 12, zakladni stupnice je 1-3-5-6-8-10-12.
 -
 - Hlavni akordy:
 -   Tonika (T): 1-5-8
 -   Subdominanta (S): 6-10-1
 -   Dominanta (D): 8-12-3
 -
 - Vsechny durove akordy:
 -   T     1-5-8
 -   II    3-6-10
 -   III   5-8-12
 -   S     6-10-1
 -   D     8-12-3
 -   VI    10-1-5
 -   VII   12-3-6
 -
 - Molove akordy maji snizenou tercii v tonice:
 -   Tm    1-4-8
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


-- dejAkord sh a ... sh je posun dle toniny, a je text akordu, vraci prislusny akord zabaleny v Just, nebo Nothing, pokud zadny akord nesedi
dejAkord :: Int -> String -> Maybe Akord

dejAkord sh a | last a == '7' = let t = dejTon $ init a
                                  in if t == Nothing then Nothing else case dejIndexSh sh $ maybe tc id t of 
                                    1  -> Just at7
                                    3  -> Just aii7
                                    5  -> Just aiii7
                                    6  -> Just as7
                                    8  -> Just ad7
                                    10 -> Just avi7
                                    12 -> Just avii7
                                    otherwise -> Nothing
              | last a == 'm' = Just atm
              | otherwise = let t = dejTon a
                                  in if t == Nothing then Nothing else case dejIndexSh sh $ maybe tc id t of
                                    1  -> Just at
                                    3  -> Just aii
                                    5  -> Just aiii
                                    6  -> Just as
                                    8  -> Just ad
                                    10 -> Just avi
                                    12 -> Just avii
                                    otherwise -> Nothing


-- dejAkordy t ... t index tonu, na vystupu akord obsahujici index tonu
dejAkordy :: Int -> [Akord]

dejAkordy t = dejAkordy' t 0


dejAkordy' :: Int -> Int -> [Akord]

dejAkordy' t i | i >= length akordy = []
               | elem t a = a : z
               | otherwise = z
                 where a = akordy !! i
                       z = dejAkordy' t (i + 1)


-- dejAkordStr sh a ... sh posun dle toniny, a akord, vraci text akordu daneho vstupem
dejAkordStr :: Int -> Akord -> String

dejAkordStr sh a | a == atm = (dejTonIndexu $ sh + 1) ++ "m"  -- molovy akord
                 | length a == 4 = t ++ "7"                   -- jedna se o septakord
                 | otherwise = t                              -- durovy akord
                   where t = dejTonIndexu $ 1 + (mod (-1 + sh + head a) $ length tony)



type Akord = [Int]


akordy :: [Akord]

akordy = [at, as, ad, at7, as7, ad7, atm, aii, avi, aii7, avi7, aiii, avii, aiii7, avii7]


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



atm :: Akord

atm = [1, 4, 8]



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
