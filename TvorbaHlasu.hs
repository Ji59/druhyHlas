module TvorbaHlasu where


import TvorbaAkordu
import Akord
import Ton


-- tvorbaHlasu sh (Maybe (p, a0)) (t1, a1) ... sh posun dle toniny, (p predchozi ton druheho hlasu, a0 predchozi akord), (t1 aktualni ton prvniho hlasu, a1 aktualni akord), vraci Just ton druheho hlasu, pokud se podarilo uspesne nacist vstupni string, jinak Nothing
tvorbaHlasu :: Int -> Maybe (Ton, String) -> (String, String) -> Maybe String

tvorbaHlasu sh (Just (p, a0)) (t1, a1) = let t = dejTon t1; a = dejAkord sh a1
                                          in if t == Nothing || a == Nothing 
                                               then Nothing 
                                               else Just ( vytvorAkord sh (Just p) (dejAkord sh a0)  (maybe tc id t) (maybe at id a))
tvorbaHlasu sh Nothing (t1, a1) =  let t = dejTon t1; a = dejAkord sh a1
                                     in if t == Nothing || a == Nothing
                                          then Nothing
                                          else Just (vytvorAkord sh Nothing Nothing (maybe tc id t) (maybe at id a))


-- tvorbaHlasu sh (Maybe (p, a)) t1 ... sh posun dle toniny, (p posledni ton druheho hlasu, a posledni akord), t1 ton prvniho hlasu. Vraci odhad na druhy hlas
tvorbaHlasu' :: Int -> Maybe (Ton, String) -> String -> Maybe (String, String, String)

tvorbaHlasu' sh Nothing t1 = if t == Nothing 
                               then Nothing 
                               else do 
                                 let tt = maybe tc id t; a = head $ dejAkordyTonu sh tt
                                 Just (dejAkordStr sh a, t1, vytvorAkord sh Nothing Nothing tt a)
                             where t = dejTon t1
tvorbaHlasu' sh (Just (t0, a0)) t1 = if t == Nothing
                                      then Nothing
                                      else do
                                        let tt = maybe tc id t; a = dejAkordyTonu sh tt; aa0 = dejAkord sh a0
                                        if aa0 /= Nothing && elem (maybe at id aa0) a
                                          then let aa = maybe at id aa0 in Just (dejAkordStr sh aa, t1, vytvorAkord sh (Just t0) aa0 tt aa)
                                          else Just (dejAkordStr sh $ head a, t1, vytvorAkord sh (Just t0) aa0 tt $ head a)
                                     where t = dejTon t1
