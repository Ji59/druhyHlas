module Main where


import System.Environment
import TvorbaHlasu
import LoadFile
import Ton


-- pokusi se nacist soubor zadany v argumentu, pokud zadny argument nebyl zadan, povoli nacteni ze standardniho vstupu
main :: IO ()

main = do
         args <- getArgs
         case length args of
           0 -> nacti
           1 -> loadFile (head args) >>= zpracuj
           otherwise -> putStrLn "Spusteno na mnoho argumentu. Spustte jen s nazvem souboru, nebo bez argumentu."


-- fukce nacte soubor a posle ho na zpracovani
nacti :: IO ()

nacti = putStrLn "Prosim napiste nazev souboru, ktery chcete prevest:" >>
        getLine >>=
        loadFile >>=  -- nacti zadany soubor
        zpracuj


-- zpracuj text ... text je text ze souboru spravneho formatu, funkce rozdeli vstup na casti a pote vyhodnoti soubor
zpracuj :: [String] -> IO ()

zpracuj text = do
         let (h : f : t) = text -- rozdel nacteny soubor
         putStrLn (h)
         if dejTon h == Nothing 
           then putStrLn "Spatny format toniny." 
           else do
             let sh = -1 + (dejIndexTonu (maybe tc id (dejTon h))) -- zjisti posun toniny
--             putStrLn $ show sh
             if f == "0"  -- proved akci dle typu souboru
                then putStrLn h >> (sequence_ $ vypis $ vyhodnot sh t)
                else if f == "1" 
                       then putStrLn h >> (sequence_ $ vypis' $ vyhodnot' sh t)
                       else putStrLn "Spatny typ souboru."


-- vyhodnot sh text ... sh posun dle toniny, text noty akordu a prvniho hlasu. Vraci doplneny druhy hlas _radka_[(akord, _tony_[(prvniHlas, DruhyHlas)]]
vyhodnot :: Int -> [String] -> [(String, [(String, String)])]

vyhodnot sh text = map (\(a : n) -> (a, map (\t1 -> (t1, maybe t1 id $ tvorbaHlasu sh Nothing (t1, a))) n)) $ map words text


-- vyhodnot' sh text ... sh posun dle toniny, text noty prvniho hlasu bez danych akordu. Vraci doplneny druhy hlas
vyhodnot' :: Int -> [String] -> [[(String, String, String)]]

vyhodnot' sh text = map (map (\t1 -> maybe ("_", t1, "_") id $ tvorbaHlasu' sh Nothing t1)) $ map words text


-- vypis n ... n noty _radky_[(akord, _tony_[(prvniHlas, druhyHlas)])], vypise text v prijatelnym formatu
vypis :: [(String, [(String, String)])] -> [IO ()]

vypis n = map (\(a , t) -> putStr $ a ++ (foldr (++) "\n" [" " ++ t1 ++ "," ++ t2 | (t1, t2) <- t])) n


-- vypis' n ... n noty _radky_[_tony_[(akord, prvniHlas, druhyHlas)]], vypise text v prijatelnem formatu
vypis' :: [[(String, String, String)]] -> [IO ()]

vypis' n = map (\r -> putStr $ foldr (++) "\n" [a ++ "," ++ t1 ++ "," ++ t2 ++ " " | (a, t1, t2) <- r]) n
