module Fib where

--1.1
fibRec :: (Integral a) => a -> a
fibRec 0 = 0
fibRec 1 = 1
fibRec n = fibRec(n-1) + fibRec(n-2)

--1.2
--fibLista :: (Integral a) => a -> a
--fibLista n =

--1.3
fibListaInfinita :: (Integral a) => a -> a
fibListaInfinita n = fromIntegral (lista !! (fromIntegral n))
  where lista = 0 : 1 :  [a+b | (a,b) <- zip lista (tail lista)]
