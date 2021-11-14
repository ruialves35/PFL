module BigNumber where
import Data.Char

-- definition of type BigNumber
-- if bool = true, then its positive, otherwise is negative
-- [Int] represents the number
type BigNumber = (Bool, [Int])

-- checks if a BigNumber is positive or negative
isPositive :: BigNumber -> Bool
isPositive bn = fst bn

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
somaBN :: BigNumber -> BigNumber -> BigNumber
somaBN bn1 bn2 =
  if (isPositive bn1 && isPositive bn2) then (True, zipWith (+) (snd bn1) (snd bn2))
  else if (not (isPositive bn1) && not (isPositive bn2)) then (False, zipWith (+) (snd bn1) (snd bn2))
      else (True, [0]) -- just to test


-- subBN function computes the subtraction of 2 BigNumbers
subBN :: BigNumber -> BigNumber -> BigNumber
subBN bn1 bn2 =
  if (isPositive bn1 && not (isPositive bn2)) then somaBN bn1 (True, snd bn2)
    else (True, [0]) -- just to test
