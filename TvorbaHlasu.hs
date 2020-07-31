module TvorbaHlasu where


import TvorbaAkordu
import Akord
import Ton


-- tvorbaHlasu sh (Just (p, a0)) (t1, a1) ... sh posun dle toniny, (p predchozi ton druheho hlasu, a0 predchozi akord), (t1 aktualni ton prvniho hlasu, a1 aktualni akord), vraci Just ton druheho hlasu, pokud se podarilo uspesne nacist vstupni string, jinak Nothing
tvorbaHlasu :: Int -> Maybe (Ton, String) -> (String, String) -> Maybe String

tvorbaHlasu sh (Just (p, a0)) (t1, a1) = let t = dejTon t1; a = dejAkord sh a1
                                          in if t == Nothing || a == Nothing 
                                               then Nothing 
                                               else Just ( vytvorAkord sh (Just p) (dejAkord sh a0)  (maybe tc id t) (maybe at id a))
tvorbaHlasu sh Nothing (t1, a1) =  let t = dejTon t1; a = dejAkord sh a1
                                     in if t == Nothing || a == Nothing
                                          then Nothing
                                          else Just (vytvorAkord sh Nothing Nothing (maybe tc id t) (maybe at id a))
