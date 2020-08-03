# druhyHlas

Program pridava k prvnimu zpevu druhy hlas. Program cte vstup ze souboru a vypisuje na standardni vystup. 
Pro spusteni je mozne nacist DruhyHlas.hs do ghci a spustit funkci "nacist", nebo je mozne tentyz soubor zkompilovat a pote ho spustit samostatny. Po kompilaci je mozne uvest vsupni soubor jako parametr.

Format vstupu a vystupu:
  1] Vstup se zadanymi akordy: 
       Pokud jsou znamy akordy prvniho hlasu, je format nasledujici.
       Vstup: 
         Tonina (C pro C Dur, Es pro Es Dur, atd.)
         0
         akord ton ton ton ... (napr. akord je D Dur a tony prvniho hlasu D E G -> D D E G)
         akord ton ...
         ...

       Vystup:
         Tonina
         akord ton1,ton2 ton1,ton2 ... (napr. D D,A E,H G,E)
         akord ton1,ton2 ...
         ...
     
       Ukazkove soubory: test_a, kocka_a

  2] Vstup bez akordu:
       Pouzitelny, pokud jsou znamy jenom noty prvniho hlasu bez akordu.
       Vstup: 
         Tonina
         1
         ton ton ton ton ... (napr. C D G)
         ton ton ...
         ...

       Vystup:
         Tonina
         akord,ton1,ton2 akord,ton1,ton2 ... (C,C,G D,D,A C,G,E)
         akord,ton1,ton2 akord,ton1,ton2 ...
         ...

       Ukazkove soubory: test_n, kocka_n
   

Slozka obsahuje i ukazku vytvorenych druhyh hlasu "test_kocka.mp3". V tomto souboru jsou za sebou prvni a druhe hlasy ze souboru test_n, kocka_n, kocka_a.
