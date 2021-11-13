module Fib where

--1.1
fibRec :: (Integral a) => a -> a
fibRec 0 = 0
fibRec 1 = 1
fibRec n = fibRec(n-1) + fibRec(n-2)

--1.2

--1.3
fibListaInfinita :: [Integer]
fibListaInfinita = 0 : 1 :  [a+b | (a,b)<-zip fibListaInfinita (tail fibListaInfinita)]
