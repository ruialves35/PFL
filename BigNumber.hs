module BigNumber where

import Data.Char

-- definition of type BigNumber
-- if bool = true, then its positive, otherwise is negative
-- [Int] represents the number
type BigNumber = (Bool, [Int])

-- checks if a BigNumber is positive
isPositive :: BigNumber -> Bool
isPositive bn = fst bn

-- checks if bn1 > bn2
-- if signal of bn1 and bn2 is the same then checks module
-- otherwise checks the signal of bn1 (if its positive it means bn2 its negative so bn1 > bn2)
isBigger :: BigNumber -> BigNumber -> Bool
isBigger b1 b2
  | isPositive b1 == isPositive b2 = if (isPositive b1) then isBiggerModule b1 b2 else not (isBiggerModule b1 b2)
  | otherwise = isPositive b1

-- returns a bool saying if the first big number is bigger or equal to the second in module
isBiggerModule :: BigNumber -> BigNumber -> Bool
isBiggerModule (signal1, []) (signal2, []) = True
isBiggerModule (signal1, (x : xs)) (signal2, []) = True
isBiggerModule (signal1, []) (signal2, (y : ys)) = False
isBiggerModule (signal1, (x : xs)) (signal2, (y : ys))
  | (length xs > length ys) = True
  | (length ys > length xs) = False
  | (x > y) = True
  | (y > x) = False
  | otherwise = isBiggerModule (signal1, xs) (signal2, ys)

-- removes trailing zeros from BigNumber
stripZeros :: BigNumber -> BigNumber
stripZeros (sign, l) = if (list /= []) then (sign, list) else (sign, [0])
  where
    list = dropWhile (== 0) l

-- REQUIRED FUNCTIONS

-- scanner function computes a string in the format of a BigNumber
scanner :: String -> BigNumber
scanner str = (isPos, map (\x -> digitToInt x) strippedString)
  where
    isPos = head str /= '-'
    strippedString = if isPos then str else tail str

-- output function computes a BigNumber into a string
output :: BigNumber -> String
output bn =
  if (isPositive bn == True)
    then map (\x -> intToDigit x) (snd bn)
    else '-' : map (\x -> intToDigit x) (snd bn)

-- somaBN function computes the sum of 2 BigNumbers
-------------------------------------------------------------------------------------
somaBN :: BigNumber -> BigNumber -> BigNumber
somaBN bn1 bn2
  | isPositive bn1 == isPositive bn2 = (isPositive bn1, reverse (arraySum 0 (reverse (snd bn1)) (reverse (snd bn2))))
  | otherwise = stripZeros (isPositive bigger, reverse (arrayDiff 0 (reverse (snd bigger)) (reverse (snd smaller))))
  where
    biggerBn1 = isBiggerModule bn1 bn2
    bigger = if biggerBn1 then bn1 else bn2
    smaller = if biggerBn1 then bn2 else bn1

-- subBN function computes the subtraction of 2 BigNumbers
-------------------------------------------------------------------------------------
subBN :: BigNumber -> BigNumber -> BigNumber
subBN bn1 bn2
  | isPositive bn1 /= isPositive bn2 = somaBN bn1 (fst bn1, snd bn2)
  | otherwise = somaBN bn1 (not (fst bn2), snd bn2) -- signal bn1 = signal bn2

-- Function that sums 2 arrays representing integers
arraySum :: Int -> [Int] -> [Int] -> [Int]
arraySum 0 [] [] = []
arraySum carry [] [] = [carry]
arraySum carry [] (y : ys) = (mod currDigit 10) : arraySum crr [] ys
  where
    currDigit = (y + carry)
    crr = if (currDigit >= 10) then 1 else 0
arraySum carry (x : xs) [] = (mod currDigit 10) : arraySum crr xs []
  where
    currDigit = (x + carry)
    crr = if (currDigit >= 10) then 1 else 0
arraySum carry (x : xs) (y : ys) = (mod currDigit 10) : arraySum crr xs ys
  where
    currDigit = x + y + carry
    crr = if (currDigit >= 10) then 1 else 0

-- Function that subtract 2 arrays representing integers
arrayDiff :: Int -> [Int] -> [Int] -> [Int]
arrayDiff 0 [] [] = []
arrayDiff carry (x : xs) [] = currDigit : arrayDiff 0 xs []
  where
    currDigit = x - carry
arrayDiff carry (x : xs) (y : ys) = currDigit : arrayDiff crr xs ys
  where
    currY = carry + y
    crr = if (x < currY) then 1 else 0
    currDigit = x + crr * 10 - currY

mulBN :: BigNumber -> BigNumber -> BigNumber
mulBN bn1 bn2 = (isPositive bn1 == isPositive bn2, reverse (arrayMul (reverse (snd bn1)) (snd bn2)))

arrayMul :: [Int] -> [Int] -> [Int]
arrayMul l1 l2 = foldl (\x y -> arraySum 0 y (0 : x)) [] (map (\digit -> rowMul digit 0 l1) l2)

rowMul :: Int -> Int -> [Int] -> [Int]
rowMul _ carry [] = if carry /= 0 then [carry] else []
rowMul val carry (x : xs) = currDigit : rowMul val newCarry xs
  where
    currVal = val * x + carry
    currDigit = mod currVal 10
    newCarry = div currVal 10
