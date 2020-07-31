module Ton where


import Data.Char
import Data.List


{- Je 12 tonu.
 - Zakladni stupnice je 7 tonu: C, D. E. F, G, A, H.
 - Pote je jeste 5 pultonu: Cis/Des, Dis/Es, Fis/Ges, Gis/As, Ais/B.
 -}


dejTon :: String -> Maybe Ton

dejTon t = case map toLower t of
             "c"   -> Just tc
             "his" -> Just tc
             "c#"  -> Just tcis
             "cis" -> Just tcis
             "des" -> Just tcis
             "d"   -> Just td
             "d#"  -> Just tdis
             "dis" -> Just tdis
             "es"  -> Just tdis
             "e"   -> Just te
             "fes" -> Just te
             "e#"  -> Just tf
             "eis" -> Just tf
             "f"   -> Just tf
             "f#"  -> Just tfis
             "fis" -> Just tfis
             "ges" -> Just tfis
             "g"   -> Just tg
             "g#"  -> Just tgis
             "gis" -> Just tgis
             "as"  -> Just tgis
             "a"   -> Just ta
             "a#"  -> Just tais
             "ais" -> Just tais
             "b"   -> Just tais
             "h"   -> Just th
             "ces" -> Just th
             otherwise -> Nothing



-- vraci index zadaneho tonu, indexovano od 1
dejIndexTonu :: Ton -> Int

dejIndexTonu t = 1 + (maybe 0 id $ elemIndex t tony)


-- vraci ton na danem indexu, indexovano od 1
dejTonIndexu :: Int -> Ton

dejTonIndexu i = tony !! (i - 1)


-- dejIndex sh t ... vrati index tonu t s ohledem na posunuti sh dane toninou
dejIndexSh :: Int -> Ton -> Int

dejIndexSh sh t = 1 + mod (-1 - sh + dejIndexTonu t) (length tony)


-- dejTonSh sh t ... sh posun dle toniny, t index tonu, vraci ton na danem indexu s ohledem na posun
dejTonSh :: Int -> Int -> Ton

dejTonSh sh t = dejTonIndexu (1 + mod (-1 + sh + t) (length tony))


-- dejTercii t .. t ton prvniho hlasu, vraci ton druheho hlasu o tercii nize
dejTercii :: Ton -> Ton

dejTercii t = dejTonIndexu $ 1 + mod (dejIndexTonu t - 4) (length tony)



type Ton = String


-- indexovany od 1, viz Akord.hs
tony :: [Ton]

tony = [tc, tcis, td, tdis, te, tf, tfis, tg, tgis, ta, tais, th]


tc :: Ton

tc = "C"


tcis :: Ton

tcis = "C#"


td :: Ton

td = "D"


tdis :: Ton

tdis = "D#"


te :: Ton

te = "E"


tf :: Ton

tf = "F"


tfis :: Ton

tfis = "F#"


tg :: Ton

tg = "G"


tgis :: Ton

tgis = "G#"


ta :: Ton

ta = "A"


tais :: Ton

tais = "B"



th :: Ton

th = "H"
