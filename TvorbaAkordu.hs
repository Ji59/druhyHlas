module TvorbaAkordu where


import Ton
import TvorbaTonu
import Akord


-- vytvorAkord sh d a0 t a1 ... sh je posun podle toniny, d predchazejici ton druheho hlasu, a0 predchozi akord, t aktualni ton prvniho hlasu, a1 aktualni akord, na vystupu je aktualni ton druheho hlasu
vytvorAkord :: Int -> Maybe Ton -> Maybe Akord -> Ton -> Akord -> Ton

vytvorAkord sh (Just d) a0 t a1 = dejTonIndexu $ vytvorTon (dejIndexSh sh d) a0 (dejIndexSh sh t) a1
vytvorAkord sh Nothing  a0 t a1 = dejTonIndexu $ vytvorTon st a0 st a1 where st = dejIndexSh sh t


-- dejAkord sh t .. sh posud podle toniny, t aktualni ton, vraci jeden z pouzitelnych akordu
dejAkordyTonu :: Int -> Ton -> [Akord]

dejAkordyTonu sh t = dejAkordy $ dejIndexSh sh t


-- dejIndex sh t ... vrati index tonu t s ohledem na posunuti sh dane toninou
dejIndexSh :: Int -> Ton -> Int

dejIndexSh sh t = 1 + mod (-1 - sh + dejIndexTonu t) (length tony)
