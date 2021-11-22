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
isBigger :: BigNumber -> BigNumber -> Bool
isBigger bn1 bn2 = bnToInt bn1 >= bnToInt bn2

-- gets Bigger BigNumber in module
isBiggerModule :: BigNumber -> BigNumber -> Bool
isBiggerModule bn1 bn2 = dec2int (snd bn1) >= dec2int (snd bn2)

-- converts list of integer to integers
dec2int :: [Int] -> Int
dec2int l = foldl (\x y -> 10 * x + y) 0 l

-- converts BigNumber to Int
bnToInt :: BigNumber -> Int
bnToInt (sign, l) = dec2int l * multiplier
  where multiplier = if sign then 1 else -1

-- removes trailing zeros from BigNumber
stripZeros :: BigNumber -> BigNumber
stripZeros (sign, l) = if (list /= []) then (sign, list) else (sign, [0])
  where list = dropWhile (== 0) l


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
  if (isPositive bn == True) then map(\x -> intToDigit x) (snd bn)
  else '-' : map(\x -> intToDigit x) (snd bn)


-- somaBN function computes the sum of 2 BigNumbers
-------------------------------------------------------------------------------------
somaBN :: BigNumber -> BigNumber -> BigNumber
somaBN bn1 bn2
  | isPositive bn1 == isPositive bn2 = (isPositive bn1, reverse (arraySum 0 (reverse (snd bn1)) (reverse (snd bn2))))
  | otherwise = stripZeros (isPositive bigger, reverse (arrayDiff 0 (reverse (snd bigger)) (reverse (snd smaller))))
    where
      biggerBn1 = isBiggerModule bn1 bn2
      bigger =  if biggerBn1 then bn1 else bn2
      smaller = if biggerBn1 then bn2 else bn1


-- subBN function computes the subtraction of 2 BigNumbers
-------------------------------------------------------------------------------------
subBN :: BigNumber -> BigNumber -> BigNumber
subBN bn1 bn2
  | isPositive bn1 /= isPositive bn2 = somaBN bn1 (fst bn1, snd bn2)
  | otherwise = somaBN bn1 (not (fst bn2), snd bn2)   -- signal bn1 = signal bn2


-- Function that sums 2 arrays representing integers
arraySum :: Int -> [Int] -> [Int] -> [Int]
arraySum 0 [] [] =  []
arraySum carry [] [] = [carry]
arraySum carry [] (y:ys) = (mod currDigit 10) : arraySum crr [] ys
  where
    currDigit = (y + carry)
    crr = if (currDigit >= 10) then 1 else 0
arraySum carry (x:xs) [] = (mod currDigit 10) : arraySum crr xs []
  where
    currDigit = (x + carry)
    crr = if (currDigit >= 10) then 1 else 0
arraySum carry (x:xs) (y:ys) = (mod currDigit 10) : arraySum crr xs ys
  where
    currDigit = x + y + carry
    crr = if (currDigit >= 10) then 1 else 0


-- Function that subtract 2 arrays representing integers
arrayDiff :: Int -> [Int] -> [Int] -> [Int]
arrayDiff 0 [] [] =  []
arrayDiff carry (x:xs) [] = currDigit : arrayDiff 0 xs []
  where currDigit = x - carry
arrayDiff carry (x:xs) (y:ys) = currDigit : arrayDiff crr xs ys
  where
    currY = carry + y
    crr = if (x < currY) then 1 else 0
    currDigit = x + crr*10 - currY
