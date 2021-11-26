module Fib where

import BigNumber

-- fibRec calculates the fibonacci value of the element n using recursion
-------------------------------------------------------------------------------------
fibRec :: (Integral a) => a -> a
fibRec 0 = 0
fibRec 1 = 1
fibRec n = fibRec(n-1) + fibRec(n-2)


-- fibLista calculates the fibonacci value of the element n using dynamic programming
-------------------------------------------------------------------------------------
fibLista :: (Integral a) => a -> a
fibLista n = lista !! fromIntegral n
  where lista = 0 : 1 : map(\n -> (lista !! (n-1)) + (lista !! (n-2)) ) [2.. fromIntegral n]



-- fibListaInfinita calculates the fibonacci value of the element n using an infinite list
-------------------------------------------------------------------------------------
fibListaInfinita :: (Integral a) => a -> a
fibListaInfinita n = lista !! (fromIntegral n)
  where lista = 0 : 1 :  [a + b | (a,b) <- zip lista (tail lista)]


-- fibRecBN calculates the fibonnaci of the n element by using recursion and BigNumbers
-------------------------------------------------------------------------------------
fibRecBN :: BigNumber -> BigNumber
fibRecBN (True, [0]) = (True, [0])
fibRecBN (True, [1]) = (True, [1])
fibRecBN bn = somaBN (fibRecBN bnRec1)  (fibRecBN bnRec2)
  where
    bnRec1 = subBN bn (True, [1])
    bnRec2 = subBN bn (True, [2])


-- fibListaBN uses dynamic programming to calculate the bn-fibonacci element
-- to do so, an auxiliar function was used in order to store the current values
-- of the list with the elements and to create the breaking condition of the
-- list calculation
-------------------------------------------------------------------------------------
fibListaBN :: BigNumber -> BigNumber
fibListaBN bn = getIndex bn lista
  where
    first = (True, [0]) : [(True, [1])]
    lista = helpFibListBN bn (True, [1]) first

-- function that calculates the fibonacci list from currBn to bn
-- list must have the initial values from 0 to currBn
-- returns a list with all the values until the moment
helpFibListBN :: BigNumber -> BigNumber -> [BigNumber] -> [BigNumber]
helpFibListBN targetIdx lastIdx currList =
  if (isBiggerModule lastIdx targetIdx) then currList
  else helpFibListBN targetIdx nextBn nextList
  where
    idx1 = subBN lastIdx (True, [1])
    nextBn = somaBN lastIdx (True, [1])
    nextList = currList ++ [somaBN (getIndex lastIdx currList) (getIndex idx1 currList)]



-- fibListaInfinitaBN calculates the fibonnaci of the n element by using infinite lists
-- applied to BigNumbers
-------------------------------------------------------------------------------------
fibListaInfinitaBN :: BigNumber -> BigNumber
fibListaInfinitaBN bn = getIndex bn lista
  where
    lista = (True, [0]) : (True, [1]) : [somaBN a b | (a, b) <- zip lista (tail lista)]
