module Load where


{-
 - Format vstupniho souboru:
 -   Predznamenani (Napr. C pro C dur, Es pro Es Dur, Gm pro G Mol ...)
 -   Format souboru - 0 pokud je vstup s akordy, 1 pro vstup bez akordu (v tom pripade program "hada" spravny akord pro dany ton)
 -   Dalsi radky skladba - (akord) ton ton ton ...
 -     Pokud jsou zname akordy, na kazdou radku musi byt jeden akord. Jinak je radkovani libovone (doporucuji podle taktu)
 -
 -   Napr.
 -     F           (F Dur)
 -     0           (s akordy)
 -     F F G A C   (akord F Dur, tony F, G, A, C)
 -     Am C A E    (akord A Mol, tony C, A, E)
 -     ...
 -
 -
 - Vystupni format:
 -   Predznamenani
 -   Radky skladby - akord ton1,ton2 ton1,ton2  ...
 -
 -   Napr.
 -     F
 -     F F,C G,C A,F C,A
 -     Am C,A A,E E,C
 -    ...
 -}


loadText :: IO [String] -> String

loadText = loadFile "ahoj"


-- Fukce se pokusi precist soubor na vstupu a pote ho rozkouskuje na radky
loadFile :: String -> IO [String]

loadFile file = fmap lines (readFile file)
