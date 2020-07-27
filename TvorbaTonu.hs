module TvorbaTonu where


import Akord


-- vytvor p a0 t1 a1 ... p posledni pouzity ton druheho hlasu, a0 predchazejici akord, t1 aktualni ton prvniho hlasu, a1 aktualni akord. Funkce vraci ton vyhovujici aktualnimu akordu s ohledem na predchozi tony.
vytvor :: Int -> Akord -> Int -> Akord -> Int

vytvor p a0 t1 a1 | a0 == a1 && t1 /= p = p                -- pokud jsou tony (t0, t1) i akordy (a0, a1) stejne, pouzij i stejny ton p
                  | t1 /= p && elem p a1 = p               -- pokud jsou tony t1 a p ruzne a akordy se lisi, ale p lze pouzit, pouzij ho
                  | otherwise =  maybe p id (vytvor1 t1 a1) -- jinak vyber ton bez zavislosti na predchozim akordu a tonu


-- vytvor1 t a ... t ton, a akord, vraci Maybe n, n ton, ktery sedi k tonu t v akordu a. Funkce vraci nejblizsi nizsi ton z akordu. Pokud zadany ton t neni v akordu a, vraci Nothing.
vytvor1 :: Int -> Akord -> Maybe Int

vytvor1 t (x : a) = if t == x then Just (last a) else vytvor1' t (x : a)                -- pokud je ton t jako prvni v akordu a, vem posledni ton z akordu. Jinak rekurzi pokracuj
        where vytvor1' t (x : (y : a)) = if t == y then Just x else vytvor1' t (y : a)  -- pokud je ton t v akordu a, vrat predchudce
              vytvor1' t _ = Nothing                                                    -- jinak vrat nic
