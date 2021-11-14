module Fib where

-- fibRec calculates the fibonacci value of the element n using recursion
fibRec :: (Integral a) => a -> a
fibRec 0 = 0
fibRec 1 = 1
fibRec n = fibRec(n-1) + fibRec(n-2)


-- fibLista calculates the fibonacci value of the element n using dynamic programming
fibLista :: (Integral a) => a -> a
fibLista n = lista !! fromIntegral n
  where lista = 0 : 1 : map(\n -> (lista !! (n-1)) + (lista !! (n-2)) ) [2.. fromIntegral n]


-- fibListaInfinita calculates the fibonacci value of the element n using an infinite list
fibListaInfinita :: (Integral a) => a -> a
fibListaInfinita n = lista !! (fromIntegral n)
  where lista = 0 : 1 :  [a + b | (a,b) <- zip lista (tail lista)]
