module Ton where


{- Je 12 tonu.
 - Zakladni stupnice je 7 tonu: C, D. E. F, G, A, H.
 - Pote je jeste 5 pultonu: Cis/Des, Dis/Es, Fis/Ges, Gis/As, Ais/B.
 -}


type Ton = String


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
