module BigNumber where

import Data.Char

-- definition of type BigNumber
-- if bool = true, then its positive, otherwise is negative
-- [Int] represents the number
type BigNumber = (Bool, [Int])

-- checks if a BigNumber is positive
-------------------------------------------------------------------------------------
isPositive :: BigNumber -> Bool
isPositive bn = fst bn

-- returns the bn element of a list of BigNumbers
-------------------------------------------------------------------------------------
getIndex :: BigNumber -> [BigNumber] -> BigNumber
getIndex _ [] = (False, [-1])
getIndex (_, [0]) list = head list
getIndex (False, _) _ = (False, [-1])
getIndex bn (x : xs) = getIndex (subBN bn (True, [1])) xs

-- returns the length of a BigNumber
-- This should be use in case we work with values outside the scope of 64 bit Int, which is extremly unlikely
-------------------------------------------------------------------------------------
lengthBN :: BigNumber -> BigNumber
lengthBN (_, []) = (True, [0])
lengthBN (_, l) = somaBN (True, [1]) (lengthBN (True, tail l))

-- checks if bn1 > bn2
-- if signal of bn1 and bn2 is the same then checks module
-- otherwise checks the signal of bn1 (if its positive it means bn2 its negative so bn1 > bn2)
-------------------------------------------------------------------------------------
isBigger :: BigNumber -> BigNumber -> Bool
isBigger b1 b2
  | isPositive b1 == isPositive b2 = if (isPositive b1) then isBiggerModule b1 b2 else not (isBiggerModule b1 b2)
  | otherwise = isPositive b1

-- returns a bool saying if the first big number is bigger than the second in module
-- compares recursively the last digit of bigNumbers if the length of them is the same
-- if it's not, then it means that the one with biggest length is bigger in module
-------------------------------------------------------------------------------------
isBiggerModule :: BigNumber -> BigNumber -> Bool
isBiggerModule (signal1, []) (signal2, []) = False
isBiggerModule (signal1, (x : xs)) (signal2, []) = True
isBiggerModule (signal1, []) (signal2, (y : ys)) = False
isBiggerModule (signal1, (x : xs)) (signal2, (y : ys))
  | (length xs > length ys) = True
  | (length ys > length xs) = False
  | (x > y) = True
  | (y > x) = False
  | otherwise = isBiggerModule (signal1, xs) (signal2, ys)

-- returns a bool saying if the first big number is bigger or equal to the second in module
-- compares recursively the last digit of bigNumbers if the length of them is the same
-- if it's not, then it means that the one with biggest length is bigger in module
-------------------------------------------------------------------------------------
isBiggerOrEqualModule :: BigNumber -> BigNumber -> Bool
isBiggerOrEqualModule (_, []) (_, []) = True
isBiggerOrEqualModule (_, (x : xs)) (signal2, []) = True
isBiggerOrEqualModule (_, []) (signal2, (y : ys)) = False
isBiggerOrEqualModule (signal1, (x : xs)) (signal2, (y : ys))
  | (length xs > length ys) = True
  | (length ys > length xs) = False
  | (x > y) = True
  | (y > x) = False
  | otherwise = isBiggerOrEqualModule (signal1, xs) (signal2, ys)

-- removes trailing zeros from BigNumber
-- ex: [0, 1, 2, 3] -> [1, 2, 3]
-------------------------------------------------------------------------------------
stripZeros :: BigNumber -> BigNumber
stripZeros (sign, l) = if (list /= []) then (sign, list) else (sign, [0])
  where
    list = dropWhile (== 0) l

-- scanner function computes a string in the format of a BigNumber
-- to do so, it first checks the signal of the string (+ or -)
-- and then maps each digit of the string
-------------------------------------------------------------------------------------
scanner :: String -> BigNumber
scanner str = (isPos, map (\x -> digitToInt x) strippedString)
  where
    isPos = head str /= '-'
    strippedString = if isPos then str else tail str

-- output function computes a BigNumber into a string
-- to do so, it checks if the big number is positive and then
-- converts each number of the bigNumber to digit and concatenates
-- into a string
-------------------------------------------------------------------------------------
output :: BigNumber -> String
output bn =
  if (isPositive bn == True)
    then map (\x -> intToDigit x) (snd bn)
    else '-' : map (\x -> intToDigit x) (snd bn)

-- somaBN function computes the sum of 2 BigNumbers
-- to do so, it first checks the signal of them and if they are the same
-- it remains the same signal, otherwise it changes the signal to the biggest
-- bignumber in module. To add, it calls arraySum or arrayDiff, according, respectively,
-- to having the same signal or not, that is, if bn2 has negative signal then its the same
-- as doing bn1 - (+ bn2), callign, this way, arrayDiff instead of normal sum
-------------------------------------------------------------------------------------
somaBN :: BigNumber -> BigNumber -> BigNumber
somaBN bn1 bn2
  | isPositive bn1 == isPositive bn2 = (isPositive bn1, reverse (arraySum 0 (reverse (snd bn1)) (reverse (snd bn2))))
  | otherwise = stripZeros (isPositive bigger, reverse (arrayDiff 0 (reverse (snd bigger)) (reverse (snd smaller))))
  where
    biggerBn1 = isBiggerOrEqualModule bn1 bn2
    bigger = if biggerBn1 then bn1 else bn2
    smaller = if biggerBn1 then bn2 else bn1

-- subBN function computes the subtraction of 2 BigNumbers.
-- To do so, it shifts the sign of the 2nd operand and executes somaBN with this new operands
-- since somaBN already takes care of subtracting elements in the case that bn2 is negative
-------------------------------------------------------------------------------------
subBN :: BigNumber -> BigNumber -> BigNumber
subBN bn1 bn2 = somaBN bn1 (not (fst bn2), snd bn2) -- signal bn1 = signal bn2

-- arraySum function sums 2 arrays representing integers by doing a recursive sum of each element and keeping the carry of that sum.
-------------------------------------------------------------------------------------
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

-- arrayDiff Function that subtract 2 arrays representing integers
-- to do so, it subtracts recursively the head number of each array and keeps the carry of
-- that subtraction
-------------------------------------------------------------------------------------
arrayDiff :: Int -> [Int] -> [Int] -> [Int]
arrayDiff 0 [] [] = []
arrayDiff carry (x : xs) [] = currDigit : arrayDiff crr xs []
  where
    crr = if (x < carry) then 1 else 0
    currDigit = x + crr * 10 - carry
arrayDiff carry (x : xs) (y : ys) = currDigit : arrayDiff crr xs ys
  where
    currY = carry + y
    crr = if (x < currY) then 1 else 0
    currDigit = x + crr * 10 - currY

--  mulBN Function multiplies two bigNumbers.
-- To do so, it checks the signal of the result (+ if the 2 bigNumbers have the same signal, - if they dont)
-- and uses the arrayMul function to multiply the array representing the number of the two bigNumbers
-------------------------------------------------------------------------------------
mulBN :: BigNumber -> BigNumber -> BigNumber
mulBN bn1 bn2 = (isPositive bn1 == isPositive bn2, reverse (arrayMul (reverse (snd bn1)) (snd bn2)))

-- arrayMul function multiplies two arrays of Int.
--To do so, it receives the first array in reverse order and it returns the result in reverse order as well.
--This mean that to do 123*45 you must call [3,2,1] * [4,5] and it returns [5,3,5,5] instead of  [5,5,3,5].
--To multiply it calls foldl applied to a map representing the multiplication of each element of bn2 to the array of bn1
-------------------------------------------------------------------------------------
arrayMul :: [Int] -> [Int] -> [Int]
arrayMul l1 l2 = foldl (\x y -> arraySum 0 y (0 : x)) [] (map (\digit -> rowMul digit 0 l1) l2)

-- rowMul function multiplies an integer with an array of integers (representing a number)
-- To do so, it keeps a carry representing the carry of each multiplication ((4*5) has a carry of 2)
-- and does that sum recursively
-------------------------------------------------------------------------------------
rowMul :: Int -> Int -> [Int] -> [Int]
rowMul _ carry [] = if carry /= 0 then [carry] else []
rowMul val carry (x : xs) = currDigit : rowMul val newCarry xs
  where
    currVal = val * x + carry
    currDigit = mod currVal 10
    newCarry = div currVal 10

-- divBN divides 2 positive BigNumbers
-------------------------------------------------------------------------------------
divBN :: BigNumber -> BigNumber -> (BigNumber, BigNumber)
divBN bn1 bn2
  | bn2 == (True, [1]) = (bn1, (True, [0]))
  | isBiggerModule bn2 bn1 = ((True, [0]), bn1)
  | otherwise = divBNCalc (fst bn1, tail (snd bn1)) bn2 (True, []) (fst bn1, [head (snd bn1)])

-- Prepends the array of integers of bn1 into bn2, taking into account the sign of bn1
prependBN :: BigNumber -> BigNumber -> BigNumber
prependBN bn1 bn2 = (fst bn1, (snd bn1) ++ (snd bn2))

-- divBNCalc is an auxiliary function to divide 2 BNs more efficiently
divBNCalc :: BigNumber -> BigNumber -> BigNumber -> BigNumber -> (BigNumber, BigNumber)
divBNCalc (_, []) d2 quot currD1 =
  -- If there's no more digits in the dividend
  let (divDigit, divRemainder) = divBNSimple currD1 d2
   in (prependBN quot divDigit, divRemainder)
divBNCalc d1 d2 quot currD1
  | isBiggerOrEqualModule currD1 d2 =
    let (divDigit, divRemainder) = divBNSimple currD1 d2
        newD1 = stripZeros (prependBN divRemainder d1)
     in divBNCalc (fst newD1, tail (snd newD1)) d2 (prependBN quot divDigit) (fst newD1, [head (snd newD1)])
  | otherwise = divBNCalc (fst d1, tail (snd d1)) d2 quot (prependBN currD1 (fst d1, [head (snd d1)]))

-- divBNSimple divides 2 positive BigNumbers using a naive algorithm
-------------------------------------------------------------------------------------
divBNSimple :: BigNumber -> BigNumber -> (BigNumber, BigNumber)
divBNSimple bn1 bn2
  | bn2 == (True, [1]) = (bn1, (True, [0]))
  | isBiggerModule bn2 bn1 = ((True, [0]), bn1)
  | otherwise = auxDivBN (True, [0]) bn1 bn2

-- auxDivBN is an auxiliar function to the division which stores the current quocient
-- of the division calculation and applies the subtraction of bn2 to bn1.
-------------------------------------------------------------------------------------
auxDivBN :: BigNumber -> BigNumber -> BigNumber -> (BigNumber, BigNumber)
auxDivBN quoc bn1 bn2 = if (isBiggerModule bn2 bn1) then (quoc, bn1) else auxDivBN currQuoc currBn1 bn2
  where
    currQuoc = somaBN quoc (True, [1]) -- subtracted 1 more time, so adds 1 to quocient
    currBn1 = subBN bn1 bn2 -- take of the value of bn2

-- safeDivBN prevents the user to divide a number bn1 for a second number bn2 that
-- represents the value 0 (bn2 = (True, [0]))
-------------------------------------------------------------------------------------
safeDivBN :: BigNumber -> BigNumber -> Maybe (BigNumber, BigNumber)
safeDivBN bn1 bn2
  | bn2 == (True, [0]) = Nothing
  | bn2 == (True, [1]) = Just (bn1, (True, [0]))
  | isBiggerModule bn2 bn1 = Just ((True, [0]), bn1)
  | otherwise = Just (divBNCalc (fst bn1, tail (snd bn1)) bn2 (True, []) (fst bn1, [head (snd bn1)]))
