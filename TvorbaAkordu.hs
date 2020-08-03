module TvorbaAkordu where


import Ton
import TvorbaTonu
import Akord


-- vytvorAkord sh d a0 t a1 ... sh je posun podle toniny, d predchazejici ton druheho hlasu, a0 predchozi akord, t aktualni ton prvniho hlasu, a1 aktualni akord, na vystupu je aktualni ton druheho hlasu
vytvorAkord :: Int -> Maybe Ton -> Maybe Akord -> Ton -> Akord -> Ton

vytvorAkord sh (Just d) a0 t a1 = dejTonSh sh $ vytvorTon (dejIndexSh sh d) a0 (dejIndexSh sh t) a1
vytvorAkord sh Nothing  a0 t a1 = dejTonSh sh $ vytvorTon (dejIndexSh sh $ dejTercii t) a0 (dejIndexSh sh t) a1 -- pokud neni znam predchozi ton, utvor tercii.


-- dejAkord sh t .. sh posud podle toniny, t aktualni ton, vraci seznam pouzitelnych akordu
dejAkordyTonu :: Int -> Ton -> [Akord]

dejAkordyTonu sh t = dejAkordy $ dejIndexSh sh t
