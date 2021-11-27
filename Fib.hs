module Fib where

import BigNumber

------------------------------------------------------------------------
-------------------------- Int -----------------------------------------
------------------------------------------------------------------------

-- fibRec calculates the fibonacci value of the element n using recursion
-- If given an invalid value, it returns -1
-------------------------------------------------------------------------------------
fibRec :: Int -> Int
fibRec 0 = 0
fibRec 1 = 1
fibRec n = if n < 0 then -1 else fibRec (n -1) + fibRec (n -2)

-- fibLista calculates the fibonacci value of the element n using dynamic programming
-- If given an invalid value, it returns -1
-------------------------------------------------------------------------------------
fibLista :: Int -> Int
fibLista n = if n < 0 then -1 else lista !! n
  where
    lista = 0 : 1 : map (\n -> (lista !! (n -1)) + (lista !! (n -2))) [2 .. n]

-- fibListaInfinita calculates the fibonacci value of the element n using an infinite list
-- If given an invalid value, it returns -1
-------------------------------------------------------------------------------------
fibListaInfinita :: Int -> Int
fibListaInfinita n = if n < 0 then -1 else lista !! n
  where
    lista = 0 : 1 : [a + b | (a, b) <- zip lista (tail lista)]

------------------------------------------------------------------------
-------------------------- Integers ------------------------------------
------------------------------------------------------------------------

-- fibRec2 calculates the fibonacci value of the element n using recursion
-- If given an invalid value, it returns -1
-------------------------------------------------------------------------------------
fibRec2 :: Integer -> Integer
fibRec2 0 = 0
fibRec2 1 = 1
fibRec2 n = if n < 0 then -1 else fibRec2 (n -1) + fibRec2 (n -2)

-- fibLista2 calculates the fibonacci value of the element n using dynamic programming
-- If given an invalid value, it returns -1
-------------------------------------------------------------------------------------
fibLista2 :: Integer -> Integer
fibLista2 n = if n < 0 then -1 else lista !! fromInteger n
  where
    lista = 0 : 1 : map (\n -> (lista !! (n -1)) + (lista !! (n -2))) [2 .. (fromInteger n)]

-- fibListaInfinita2 calculates the fibonacci value of the element n using an infinite list
-- If given an invalid value, it returns -1
-------------------------------------------------------------------------------------
fibListaInfinita2 :: Integer -> Integer
fibListaInfinita2 n = if n < 0 then -1 else lista !! fromInteger n
  where
    lista = 0 : 1 : [a + b | (a, b) <- zip lista (tail lista)]

------------------------------------------------------------------------
-------------------------- BIG NUMBERS --------------------------------
------------------------------------------------------------------------

-- fibRecBN calculates the fibonnaci of the n element by using recursion and BigNumbers
-- If given an invalid value, it returns -1
-------------------------------------------------------------------------------------
fibRecBN :: BigNumber -> BigNumber
fibRecBN (False, _) = (False, [-1])
fibRecBN (True, [0]) = (True, [0])
fibRecBN (True, [1]) = (True, [1])
fibRecBN bn = somaBN (fibRecBN bnRec1) (fibRecBN bnRec2)
  where
    bnRec1 = subBN bn (True, [1])
    bnRec2 = subBN bn (True, [2])

-- fibListaBN uses dynamic programming to calculate the bn-fibonacci element
-- to do so, an auxiliar function was used in order to store the current values
-- of the list with the elements and to create the breaking condition of the
-- list calculation.
-- If given an invalid value, it returns -1
-------------------------------------------------------------------------------------
fibListaBN :: BigNumber -> BigNumber
fibListaBN bn = getIndex bn lista
  where
    first = (True, [0]) : [(True, [1])]
    lista = helpFibListBN bn (True, [1]) first

-- function that calculates the fibonacci list from currBn to bn
-- list must have the initial values from 0 to currBn
-- it returns a list with all the values until the moment
helpFibListBN :: BigNumber -> BigNumber -> [BigNumber] -> [BigNumber]
helpFibListBN targetIdx lastIdx currList =
  if isBiggerModule lastIdx targetIdx
    then currList
    else helpFibListBN targetIdx nextBn nextList
  where
    -- idx1 = subBN lastIdx (True, [1])
    nextBn = somaBN lastIdx (True, [1])
    nextList = currList ++ [somaBN (currList !! (length currList - 1)) (currList !! (length currList - 2))]

-- nextList = currList ++ [somaBN (getIndex lastIdx currList) (getIndex idx1 currList)]

-- fibListaInfinitaBN calculates the fibonnaci of the n element by using infinite lists
-- applied to BigNumbers
-- If given an invalid value, it returns -1
-------------------------------------------------------------------------------------
fibListaInfinitaBN :: BigNumber -> BigNumber
fibListaInfinitaBN bn = getIndex bn lista
  where
    lista = (True, [0]) : (True, [1]) : [somaBN a b | (a, b) <- zip lista (tail lista)]
