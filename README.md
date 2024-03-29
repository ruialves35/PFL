# PFL Project

This projects consists of implementing a library of big-numbers (BN) in haskell, including its basic arithmetic operations, in order to calculate the Fibonacci sequence.

## Test Cases

### Fibonnaci with `Int` data type

#### `fibRec`
| Test Case # | Description | Data | Expected Result | Actual Result | Pass/Fail |
|---|---|---|---|---|---|
| T01 | Check base case of fibRec function (n=0) | fibRec 0 | 0 | 0 | Pass |
| T02 | Check base case of fibRec function (n=1) | fibRec 1 | 1 | 1 | Pass |
| T03 | Check value for a small sequence number | fibRec 10 | 55 | 55 | Pass |
| T04 | Check value for a medium sized sequence number | fibRec 30 | 832040 | 832040 | Pass |
| T05 | Check return value for invalid input | fibRec (-1) | -1 | -1 | Pass |

#### `fibLista`
| Test Case # | Description | Data | Expected Result | Actual Result | Pass/Fail |
|---|---|---|---|---|---|
| T11 | Check base case of fibLista function (n=0) | fibLista 0 | 0 | 0 | Pass |
| T12 | Check base case of fibLista function (n=1) | fibLista 1 | 1 | 1 | Pass |
| T13 | Check value for a small sequence number | fibLista 10 | 55 | 55 | Pass |
| T14 | Check value for a medium sized sequence number | fibLista 30 | 832040 | 832040 | Pass |
| T15 | Check value for a sequence number out of range for  `Int` | fibLista 95 | Overflow | Overflow | Pass |
| T16 | Check return value for invalid input | fibLista (-1) | -1 | -1 | Pass |

#### `fibListaInfinita`
| Test Case # | Description | Data | Expected Result | Actual Result | Pass/Fail |
|---|---|---|---|---|---|
| T21 | Check base case of fibListaInfinita function (n=0) | fibListaInfinita 0 | 0 | 0 | Pass |
| T22 | Check base case of fibListaInfinita function (n=1) | fibListaInfinita 1 | 1 | 1 | Pass |
| T23 | Check value for a small sequence number | fibListaInfinita 10 | 55 | 55 | Pass |
| T24 | Check value for a medium sized sequence number | fibListaInfinita 30 | 832040 | 832040 | Pass |
| T25 | Check value for a sequence number out of range for  `Int` | fibListaInfinita 95 | Overflow | Overflow | Pass |
| T26 | Check return value for invalid input | fibListaInfinita (-1) | -1 | -1 | Pass |

---
### Fibonnaci with `Integer` data type

#### `fibRec2`
| Test Case # | Description | Data | Expected Result | Actual Result | Pass/Fail |
|---|---|---|---|---|---|
| T01 | Check base case of fibRec2 function (n=0) | fibRec2 0 | 0 | 0 | Pass |
| T02 | Check base case of fibRec2 function (n=1) | fibRec2 1 | 1 | 1 | Pass |
| T03 | Check value for a small sequence number | fibRec2 10 | 55 | 55 | Pass |
| T04 | Check value for a medium sized sequence number | fibRec2 30 | 832040 | 832040 | Pass |
| T05 | Check return value for invalid input | fibRec2 (-1) | -1 | -1 | Pass |

#### `fibLista2`
| Test Case # | Description | Data | Expected Result | Actual Result | Pass/Fail |
|---|---|---|---|---|---|
| T11 | Check base case of fibLista2 function (n=0) | fibLista2 0 | 0 | 0 | Pass |
| T12 | Check base case of fibLista2 function (n=1) | fibLista2 1 | 1 | 1 | Pass |
| T13 | Check value for a small sequence number | fibLista2 10 | 55 | 55 | Pass |
| T14 | Check value for a medium sized sequence number | fibLista2 30 | 832040 | 832040 | Pass |
| T15 | Check value for a large sequence number (out of `Int` range) | fibLista2 95 | 31940434634990099905 | 31940434634990099905 | Pass |
| T16 | Check return value for invalid input | fibLista2 (-1) | -1 | -1 | Pass |

#### `fibListaInfinita2`
| Test Case # | Description | Data | Expected Result | Actual Result | Pass/Fail |
|---|---|---|---|---|---|
| T21 | Check base case of fibListaInfinita2 function (n=0) | fibListaInfinita2 0 | 0 | 0 | Pass |
| T22 | Check base case of fibListaInfinita2 function (n=1) | fibListaInfinita2 1 | 1 | 1 | Pass |
| T23 | Check value for a small sequence number | fibListaInfinita2 10 | 55 | 55 | Pass |
| T24 | Check value for a medium sized sequence number | fibListaInfinita2 30 | 832040 | 832040 | Pass |
| T25 | Check value for a large sequence number (out of `Int` range) | fibListaInfinita2 95 | 31940434634990099905 | 31940434634990099905 | Pass |
| T26 | Check return value for invalid input | fibListaInfinita2 (-1) | -1 | -1 | Pass |

---
### Fibonnaci with `BigNumber` data type

#### `fibRecBN`
| Test Case # | Description | Data | Expected Result | Actual Result | Pass/Fail |
|---|---|---|---|---|---|
| T01 | Check base case of fibRecBN function (bn=(True, [0])) | fibRecBN (True, [0]) | (True, [0]) | (True, [0]) | Pass |
| T02 | Check base case of fibRecBN function (bn=(True, [1])) | fibRecBN (True, [1]) | (True, [1]) | (True, [1]) | Pass |
| T03 | Check value for a small sequence number | fibRecBN (True, [1,0]) | (True, [5,5]) | (True, [5,5]) | Pass |
| T04 | Check value for a medium sized sequence number | fibRecBN (True, [3,0]) | (True, [8,3,2,0,4,0]) | (True, [8,3,2,0,4,0]) | Pass |
| T05 | Check return value for invalid input | fibRecBN (False, [1]) | (False, [1]) | (False, [1]) | Pass |
| T06 | Check return value for invalid input | fibRecBN (False, [1,0]) | (False, [1]) | (False, [1]) | Pass |

#### `fibListaBN`
| Test Case # | Description | Data | Expected Result | Actual Result | Pass/Fail |
|---|---|---|---|---|---|
| T11 | Check base case of fibListaBN function (bn=(True, [0])) | fibListaBN (True, [0]) | (True, [0]) | (True, [0]) | Pass |
| T12 | Check base case of fibListaBN function (bn=(True, [1])) | fibListaBN (True, [1]) | (True, [1]) | (True, [1]) | Pass |
| T13 | Check value for a small sequence number | fibListaBN (True, [1,0]) | (True, [5,5]) | (True, [5,5]) | Pass |
| T14 | Check value for a medium sized sequence number | fibListaBN (True, [3,0]) | (True, [8,3,2,0,4,0]) | (True, [8,3,2,0,4,0]) | Pass |
| T15 | Check value for a large sequence number (out of `Int` range) | fibListaBN (True, [9,5]) | (True, [3,1,9,4,0,4,3,4,6,3,4,9,9,0,0,9,9,9,0,5]) | (True, [3,1,9,4,0,4,3,4,6,3,4,9,9,0,0,9,9,9,0,5]) | Pass |
| T16 | Check value for a large sequence number (out of `Int` range) | fibListaBN (True, [9,0,5]) | (True,[6,0,8,5,9,6,4,6,3,0,5,1,4,6,9,6,8,7,8,1,6,8,2,8,6,0,6,3,9,8,3,3,9,3,7,8,5,5,7,5,9,7,0,0,8,1,0,9,1,9,9,6,1,2,5,9,5,8,1,7,4,8,8,2,2,6,9,1,1,2,3,4,9,0,2,0,4,3,0,5,8,1,6,3,7,2,6,7,2,2,4,4,9,1,7,8,9,6,8,2,4,8,4,2,8,8,8,6,1,2,8,5,3,5,0,1,1,0,1,2,5,4,0,3,4,4,8,9,9,7,9,4,7,6,2,2,7,9,0,4,7,9,3,0,3,5,6,9,3,2,7,2,1,2,9,5,3,9,1,8,6,0,3,8,9,2,2,4,9,5,4,5,7,6,9,1,5,1,9,5,7,9,5,6,6,3,4,0,5]) | (True,[6,0,8,5,9,6,4,6,3,0,5,1,4,6,9,6,8,7,8,1,6,8,2,8,6,0,6,3,9,8,3,3,9,3,7,8,5,5,7,5,9,7,0,0,8,1,0,9,1,9,9,6,1,2,5,9,5,8,1,7,4,8,8,2,2,6,9,1,1,2,3,4,9,0,2,0,4,3,0,5,8,1,6,3,7,2,6,7,2,2,4,4,9,1,7,8,9,6,8,2,4,8,4,2,8,8,8,6,1,2,8,5,3,5,0,1,1,0,1,2,5,4,0,3,4,4,8,9,9,7,9,4,7,6,2,2,7,9,0,4,7,9,3,0,3,5,6,9,3,2,7,2,1,2,9,5,3,9,1,8,6,0,3,8,9,2,2,4,9,5,4,5,7,6,9,1,5,1,9,5,7,9,5,6,6,3,4,0,5]) | Pass |
| T17 | Check return value for invalid input | fibListaBN (False, [1]) | (False, [1]) | (False, [1]) | Pass |
| T18 | Check return value for invalid input | fibListaBN (False, [1,0]) | (False, [1]) | (False, [1]) | Pass |

#### `fibListaInfinitaBN`
| Test Case # | Description | Data | Expected Result | Actual Result | Pass/Fail |
|---|---|---|---|---|---|
| T21 | Check base case of fibListaInfinitaBN function (bn=(True, [0])) | fibListaInfinitaBN (True, [0])| (True, [0])| (True, [0])| Pass |
| T22 | Check base case of fibListaInfinitaBN function (bn=(True, [1])) | fibListaInfinitaBN (True, [1])| (True, [1])| (True, [1])| Pass |
| T23 | Check value for a small sequence number | fibListaInfinitaBN (True, [1,0]) | (True, [5,5]) | (True, [5,5]) | Pass |
| T24 | Check value for a medium sized sequence number | fibListaInfinitaBN (True, [3,0]) | (True, [8,3,2,0,4,0]) | (True, [8,3,2,0,4,0]) | Pass |
| T25 | Check value for a large sequence number (out of `Int` range) | fibListaInfinitaBN (True, [9,5]) | (True, [3,1,9,4,0,4,3,4,6,3,4,9,9,0,0,9,9,9,0,5]) | (True, [3,1,9,4,0,4,3,4,6,3,4,9,9,0,0,9,9,9,0,5]) | Pass |
| T26 | Check value for a large sequence number (out of `Int` range) | fibListaInfinitaBN (True, [9,0,5]) | (True,[6,0,8,5,9,6,4,6,3,0,5,1,4,6,9,6,8,7,8,1,6,8,2,8,6,0,6,3,9,8,3,3,9,3,7,8,5,5,7,5,9,7,0,0,8,1,0,9,1,9,9,6,1,2,5,9,5,8,1,7,4,8,8,2,2,6,9,1,1,2,3,4,9,0,2,0,4,3,0,5,8,1,6,3,7,2,6,7,2,2,4,4,9,1,7,8,9,6,8,2,4,8,4,2,8,8,8,6,1,2,8,5,3,5,0,1,1,0,1,2,5,4,0,3,4,4,8,9,9,7,9,4,7,6,2,2,7,9,0,4,7,9,3,0,3,5,6,9,3,2,7,2,1,2,9,5,3,9,1,8,6,0,3,8,9,2,2,4,9,5,4,5,7,6,9,1,5,1,9,5,7,9,5,6,6,3,4,0,5]) | (True,[6,0,8,5,9,6,4,6,3,0,5,1,4,6,9,6,8,7,8,1,6,8,2,8,6,0,6,3,9,8,3,3,9,3,7,8,5,5,7,5,9,7,0,0,8,1,0,9,1,9,9,6,1,2,5,9,5,8,1,7,4,8,8,2,2,6,9,1,1,2,3,4,9,0,2,0,4,3,0,5,8,1,6,3,7,2,6,7,2,2,4,4,9,1,7,8,9,6,8,2,4,8,4,2,8,8,8,6,1,2,8,5,3,5,0,1,1,0,1,2,5,4,0,3,4,4,8,9,9,7,9,4,7,6,2,2,7,9,0,4,7,9,3,0,3,5,6,9,3,2,7,2,1,2,9,5,3,9,1,8,6,0,3,8,9,2,2,4,9,5,4,5,7,6,9,1,5,1,9,5,7,9,5,6,6,3,4,0,5]) | Pass |
| T27 | Check return value for invalid input | fibListaInfinitaBN (False, [1]) | (False, [1]) | (False, [1]) | Pass |
| T28 | Check return value for invalid input | fibListaInfinitaBN (False, [1,0]) | (False, [1]) | (False, [1]) | Pass |

---
### Big Numbers

#### `scanner`
| Test Case # | Description | Data | Expected Result | Actual Result | Pass/Fail |
|---|---|---|---|---|---|
| T01 | Check if scanner converts a zero string | scanner "0" | (True,[0]) | (True,[0]) | Pass |
| T02 | Check if scanner converts a positive string | scanner "73" | (True,[7,3]) | (True,[7,3]) | Pass |
| T03 | Check if scanner converts a positive string representing a big number | scanner "5372743212378421" | (True,[5,3,7,2,7,4,3,2,1,2,3,7,8,4,2,1]) | (True,[5,3,7,2,7,4,3,2,1,2,3,7,8,4,2,1]) | Pass |
| T04 | Check if scanner converts a negative string | scanner "-91" | (False,[9,1]) | (False,[9,1]) | Pass |
| T05 | Check if scanner converts a negative string representing a big number in module | scanner "-63218412931244" | (False,[6,3,2,1,8,4,1,2,9,3,1,2,4,4]) | (False,[6,3,2,1,8,4,1,2,9,3,1,2,4,4]) | Pass |

#### `output`
| Test Case # | Description | Data | Expected Result | Actual Result | Pass/Fail |
|---|---|---|---|---|---|
| T11 | Check if output converts 0 as big-number to string | output (True, [0]) | "0" | "0" | Pass |
| T12 | Check if output converts a positive big-number to string | output (True, [7,3]) | "73" | "73" | Pass |
| T12 | Check if output converts a positive big-number to string | output (True,[5,3,7,2,7,4,3,2,1,2,3,7,8,4,2,1]) | "5372743212378421" | "5372743212378421" | Pass |
| T13 | Check if output converts a negative big-number to string | output (False, [9,1]) | "-91" | "-91" | Pass |
| T13 | Check if output converts a negative big-number to string | output (False,[6,3,2,1,8,4,1,2,9,3,1,2,4,4]) | "-63218412931244" | "-63218412931244" | Pass |

#### `somaBN`
| Test Case # | Description | Data | Expected Result | Actual Result | Pass/Fail |
|---|---|---|---|---|---|
| T21 | Check if the sum of two 0's as BN works | somaBN (True, [0]) (True, [0]) | (True,[0]) | (True,[0]) | Pass |
| T22 | Check if the sum with one 0 as argument works | somaBN (True, [1]) (True, [0]) | (True,[1]) | (True,[1]) | Pass |
| T23 | Check if the sum of 2 positive BN works | somaBN (True, [3,0]) (True, [4,3]) | (True,[7,3]) | (True,[7,3]) | Pass |
| T24 | Check if the sum of a positive BN with a negative BN, where the positive is bigger works | somaBN (True, [3,0]) (False, [1,3]) | (True,[1,7]) | (True,[1,7]) | Pass |
| T25 | Check if the sum of a positive BN with a negative BN, where the negative is bigger works | somaBN (True, [3,0]) (False, [4,3]) | (False,[1,3]) | (False,[1,3]) | Pass |
| T26 | Check if the sum of 2 negative BN works | somaBN (False, [3,0]) (False, [4,3]) | (False,[7,3]) | (False,[7,3]) | Pass |
| T27 | Check if the sum of 2 large numbers (outside the range of `Int`) works | somaBN (True, [9,2,2,3,3,7,2,0,3,6,8,5,4,7,7,5,8,0,7,0]) (True, [9,2,2,3,3,7,2,0,3,6,8,5,4,7,7,5,8,0,7,0]) | (True, [1,8,4,4,6,7,4,4,0,7,3,7,0,9,5,5,1,6,1,4,0]) | (True, [1,8,4,4,6,7,4,4,0,7,3,7,0,9,5,5,1,6,1,4,0]) | Pass |
| T28 | Check if the sum of a positive BN with a negative BN does not leave trailing 0's | somaBN (True, [1,2,3]) (False, [1,0,0]) | (True,[2,3]) | (True,[2,3]) | Pass |

#### `subBN`
| Test Case # | Description | Data | Expected Result | Actual Result | Pass/Fail |
|---|---|---|---|---|---|
| T31 | Check if the subtraction of two 0's as BN works | subBN (True, [0]) (True, [0]) | (True,[0]) | (True,[0]) | Pass |
| T32 | Check if the subtraction with one 0 as argument works | subBN (True, [0]) (True, [1]) | (False,[1]) | (False,[1]) | Pass |
| T33 | Check if the subtraction of 2 positive BN, where the second is bigger, works | subBN (True, [3,0]) (True, [4,3]) | (False,[1,3]) | (False,[1,3]) | Pass |
| T34 | Check if the subtraction of 2 positive BN, where the first is bigger, works | subBN (True, [4,3]) (True, [3,0]) | (True,[1,3]) | (True,[1,3]) | Pass |
| T35 | Check if the subtraction of 2 negative BN, where the second is bigger, works | subBN (False, [3,0]) (False, [4,3]) | (True,[1,3]) | (True,[1,3]) | Pass |
| T36 | Check if the subtraction of 2 negative BN, where the first is bigger, works | subBN (False, [4,3]) (False, [3,0]) | (False,[1,3]) | (False,[1,3]) | Pass |
| T37 | Check if the subtraction of a positive BN with a negative BN works | subBN (True, [4,3]) (False, [3,0]) | (True,[7,3]) | (True,[7,3]) | Pass |
| T38 | Check if the subtraction of 2 large numbers (outside the range of `Int`) works | subBN (True, [9,2,2,3,3,7,2,0,3,6,8,5,4,7,7,5,8,0,7,0]) (False, [9,2,2,3,3,7,2,0,3,6,8,5,4,7,7,5,8,0,7,0]) | (True, [1,8,4,4,6,7,4,4,0,7,3,7,0,9,5,5,1,6,1,4,0]) | (True, [1,8,4,4,6,7,4,4,0,7,3,7,0,9,5,5,1,6,1,4,0]) | Pass |
| T39 | Check if the subtraction of 2 numbers with the same sign does not leave trailing 0's | subBN (False, [1,2,3]) (False, [1,0,0]) | (False,[2,3]) | (False,[2,3]) | Pass |

#### `mulBN`
| Test Case # | Description | Data | Expected Result | Actual Result | Pass/Fail |
|---|---|---|---|---|---|
| T41 | Check if the multiplication of two 0's as BN works | mulBN (True, [0]) (True, [0]) | (True,[0]) | (True,[0]) | Pass |
| T42 | Check if the multiplication with one 0 as argument works | mulBN (True, [0]) (True, [1]) | (True,[0]) | (True,[0]) | Pass |
| T43 | Check if the multiplication of 2 positive BN works | mulBN (True, [1,1]) (True, [1,5]) | (True,[1,6,5]) | (True,[1,6,5]) | Pass |
| T44 | Check if the multiplication of a positive BN with a negative BN works | mulBN (True, [1,1]) (False, [1,5]) | (False,[1,6,5]) | (False,[1,6,5]) | Pass |
| T45 | Check if the multiplication of 2 negative BN works | mulBN (False, [1,1]) (False, [1,5]) | (True,[1,6,5]) | (True,[1,6,5]) | Pass |
| T46 | Check if 1 is the neutral element of the multiplication  | mulBN (False, [1,1,0]) (True, [1]) | (False,[1,1,0]) | (False,[1,1,0]) | Pass |
| T47 | Check if the multiplication of 2 large numbers with a result outside the range of `Int` works | mulBN (False, [1,0,0,0,0,0,0,0,0,0,0]) (True, [1,2,3,4,5,6,7,8,9,0,1,2]) | (False,[1,2,3,4,5,6,7,8,9,0,1,2,0,0,0,0,0,0,0,0,0,0]) | (False,[1,2,3,4,5,6,7,8,9,0,1,2,0,0,0,0,0,0,0,0,0,0]) | Pass |

#### `divBN`
| Test Case # | Description | Data | Expected Result | Actual Result | Pass/Fail |
|---|---|---|---|---|---|
| T51 | Check if the division of 0 by a number different from 0 works | divBN (True, [0]) (True, [73]) | ((True,[0]),(True,[0])) | ((True,[0]),(True,[0])) | Pass |
| T52 | Check if the division of a number by 1 is the numerator | divBN (True, [25]) (True, [1]) | ((True,[25]),(True,[0])) | ((True,[25]),(True,[0])) | Pass |
| T53 | Check if the division of 2 positive BN works | divBN (True, [73]) (True, [20]) | ((True,[3]),(True,[13])) | ((True,[3]),(True,[13])) | Pass |
| T54 | Check if the division of 2 large numbers outside the range of `Int` works | divBN (True, [9,2,2,3,3,7,2,0,3,6,8,5,4,7,7,5,8,0,7,0,0,0]) (True, [9,2,2,3,3,7,2,0,3,6,8,5,4,7,7,5,0,4,4,5,6]) | ((True,[1,0]),(True,[7,6,2,4,4,0])) | ((True,[1,0]),(True,[7,6,2,4,4,0])) | Pass |

#### `safeDivBN`
| Test Case # | Description | Data | Expected Result | Actual Result | Pass/Fail |
|---|---|---|---|---|---|
| T61 | Check if the division of 0 by 0 behaves as expected | safeDivBN (True, [0]) (True, [0]) | Nothing | Nothing | Pass |
| T62 | Check if the division of a number by 0 behaves as expected | safeDivBN  (True, [7,3]) (True, [0]) | Nothing | Nothing | Pass |
| T63 | Check if the division of 0 by a number different from 0 works | safeDivBN (True, [0]) (True, [73]) | Just ((True,[0]),(True,[0])) | Just ((True,[0]),(True,[0])) | Pass |
| T64 | Check if the division of a number by 1 is the numerator | safeDivBN (True, [25]) (True, [1]) | Just ((True,[25]),(True,[0])) | Just ((True,[25]),(True,[0])) | Pass |
| T65 | Check if the division of 2 positive BN works | safeDivBN (True, [73]) (True, [20]) | Just ((True,[3]),(True,[13])) | Just ((True,[3]),(True,[13])) | Pass |
| T66 | Check if the division of 2 large numbers outside the range of `Int` works | safeDivBN (True, [9,2,2,3,3,7,2,0,3,6,8,5,4,7,7,5,8,0,7,0,0,0]) (True, [9,2,2,3,3,7,2,0,3,6,8,5,4,7,7,5,0,4,4,5,6]) | Just ((True,[1,0]),(True,[7,6,2,4,4,0])) | Just ((True,[1,0]),(True,[7,6,2,4,4,0])) | Pass |

----

## Functions Explanation

### Fib

- `fibRec` function calculates the fibonacci value of the element n using recursion. If given an invalid value, it returns -1. This function is applied to Int.

- `fibLista` function calculates the fibonacci value of the element n using dynamic programming. If given an invalid value, it returns -1. This function is applied to Int.

- `fibListaInfinita` function calculates the fibonacci value of the element n using an infinite list. If given an invalid value, it returns -1. This function is applied to Int.

- `fibRec2`, fibLista2 and fibListaInfinita do the same thing of fibRec, fibLista and fibListaInfinita, respectively, but are applied to Integers.

- `fibLista2` function calculates the fibonacci value of the element n using dynamic programming. If given an invalid value, it returns -1. This function is applied to Integer.

- `fibListaInfinita2` function calculates the fibonacci value of the element n using an infinite list. If given an invalid value, it returns -1. This function is applied to Integer.

- `fibRecBN` function calculates the fibonnaci of the nth element using recursion. If given an invalid value, it returns -1. This function is applied to BigNumbers, so the somaBN and subBN functions were used.

- `fibListaBN` uses dynamic programming to calculate the bn-fibonacci element, by calling the helpFibListBN auxiliar function. To do so, an auxiliar function was used in order to store the current values of the list with the elements and to create the breaking condition of the list calculation. SomaBN Function was also required. If given an invalid value, it returns -1.

- `fibListaInfinitaBN` function calculates the fibonnaci of the nth element using infinite lists applied to BigNumbers. SomaBN function was required in order to add two BigNumbers and construct the infinite list, so as the zip and tail functions. If given an invalid value, it returns -1.

#### Auxiliar Functions to Fib:

- `helpFibListBN` function returns the fibonacci sequence from a starting BigNumber up until the nth element. Since we are specifying the BigNumber were to start to create the list, we must give a list with all the initial values of the fibonnaci sequence from 0 to the inicial BigNumber. This functions returns a list with all the values of the fibonacci sequence from the inicial BigNumber to the final one. It uses the length function in order to get the last 2 values from the list and, this way, use dynamic programming for the calculation of the next element.


### BigNumbers

### Main Functions and definition of BigNumber

In order to make the usage of the BigNumbers easier, we decided to represent it as (Bool, [Int]), where the first element (Bool) represents the signal of the number (positive or negative) and the second element [Int] is a list that represents the current number. Ex: 100 -> (True, [1,0,0]); -1234 -> (False, [1, 2, 3, 4]).

- `scanner` function computes a string in the format of a BigNumber.

- `output` function computes a BigNumber into a string.

- `somaBN` function computes the sum of 2 BigNumbers.

- `subBN` function computes the subtraction of 2 BigNumbers.

- `mulBN` function multiplies two bigNumbers.

- `divBN` divides 2 positive BigNumbers.

- `safeDivBN` divides 2 positive BigNumbers, taking into account divisions by 0.

### Auxiliar Functions

- `isPositive` function checks if a BigNumber is positive.

- `getIndex` function returns the bn element of a list of BigNumbers. This function was used in order to get the index represented by a BigNumber: Ex getIndex (True, [5]) list, it gives the 5th element from list.

- `lengthBN` function returns the length of a BigNumber.  This should be use in case we work with values outside the scope of 64 bit Int, which is extremly unlikely

- `isBigger` function checks if bn1 > bn2.

- `isBiggerModule` function returns a bool saying if the first big number is bigger than the second in module. It compares recursively the last digit of bigNumbers if the length of them is the same. If it's not, then it means that the one with biggest length is bigger than the other.

- `isBiggerOrEqualModule` is similar to the above mentioned method, but returns True if it's bigger or equal and False if smaller.

- `stripZeros` function removes trailing zeros from a BigNumber. Ex: [0, 1, 2, 3] -> [1, 2, 3]

- `arraySum` function sums 2 arrays representing integers.

- `arrayDiff` Function subtracts 2 arrays representing integers. 

- `arrayMul` function multiplies two arrays of Int. 

- `rowMul` function multiplies an integer with an array of integers (representing a number).

- `divBNSimple` divides 2 positive BigNumbers by calling a naive algorithm

- `auxDivBN` function divides two BigNumbers and returns that division in form of (quotient, rest), where quotient and rest are BigNumbers as well, using a naive algorithm.

- `divBNCalc` divides 2 positive BigNumber efficiently.

- `prependBN` prepends a BN into another, taking into account the sign of the first.

## Strategies used for Big Numbers
- `scanner` - To convert a string to a BN, this function first analyses the first character to recognize if it is a positive or negative number. Afterwards, it maps the following digits of the string to the integer's list of the BN.

- `output` - To convert a BN to a string, it first checks the signal of the BigNumber, which is the first element of the data-type, and if it is negative, prepends a '-' to the return string. Then converts each number of the bigNumber to digit by using the map and intToDigit functions and concatenates into that string.

- `somaBN` - To compute the sum of 2 BN, we first verify the sign of the 2 operands. From there, there are 2 possible routes:
    - If they have the same sign, the resulting number will preserve that sign and we just need to execute the sum of 2 positive integers, represented as arrays.
    - If they have different signs, the resulting number will preserve the sign of the operand that is bigger in module and afterwards will execute the difference of 2 positive integers, represented as arrays. Finally, to prevent the storage of trailing 0's, we call the `stipZero` auxiliar function in the end. 
    
    To execute the sum and difference of positive integers, we created auxiliary functions named `arraySum` and `arrayDiff` respectively.

- `subBN` - To compute the subtraction of 2 BigNumbers, we reutilized the previously defined function `somaBN` and controlled our input in order to calculate using that function. This way, we shift the sign of the second operand and call `somaBN` with the new operands, since the sum of BigNumbers already takes into account negative values.

-  `mulBN` - To compute the multiplication of 2 BN, similar to the previous functions, we first analyse the sign of the operands:
    - If they have the same sign, the result will be positive.
    - If they have different signs, the result will be negative.
    
    Afterwards, it calls the `arrayMul` function that multiplies two positive integers, represented as arrays.

- `divBN` - To compute the division of 2 BNs, we start by splitting into 3 cases, where the return value is represented by the tuple (quotient, remainder):
    - If the divisor is 1, we instantly return (dividend, 0).
    - If the module of the divisor is greater than the module of the dividend, the funtion returns (0, dividend).
    - If none of the above apply, we call the `divBNCalc` function that divides two BigNumbers efficiently.

- `safeDivBN` - To compute the division of 2 BigNumbers safely, this function returns a Monad of the type `Maybe`. Hence, it is similar to the above mentioned method `divBN` but in addition to the 3 cases represented above, it first verifies if the divisor is equal to 0 and, if so, returns the value `Nothing`. Otherwise, it acts as the above function.

- `arraySum` - ArraySum function receives two arrays of `Int` representing a number in reverse order ([0,0,1] represents the number 100) in order to sum those arrays. By doing a recursive sum of least significative number of the lists and keeping the carry of that sum, the arraySum performs the sum of those arrays. When a number reaches to the end, just keeps doing the sum of the carry with the remaining number. This function returns the result in reverse order.

- `arrayDiff` - ArrayDiff function receives two arrays of `Int` representing a number in reverse order ([0,0,1] represents the number 100) in order to subtract those arrays. By doing a recursive subtraction of least significative number of the lists and keeping the carry of that subtraction, the arrayDiff performs the subtraction of those arrays. When a number reaches to the end, just keeps subtracting the remaining carry with the remaining number. This function returns the result in reverse order.

- `arrayMul` function multiplies two arrays of Int representing a number. To do so, it receives the first array in reverse order and it returns the result in reverse order as well. This mean that to do 123*45 we must call [3,2,1] * [4,5] and it returns [5,3,5,5] instead of [5,5,3,5]. To multiply, it calls foldl applying a sum (by calling `arraySum`) to a map that performs the multiplication of each element of bn2 to the array of bn1 (by calling `rowMul`). This way, we keep adding each multiplication of the elements of bn2 to bn1. Ex: [3,2,1] * [4,5] -> 5 * [3,2,1] + 4 * [0,3,2,1] = [5,1,6] + [0,2,9,4] = [5,3,5,5] 

- `rowMul` function multiplies an integer with an array of integers (representing a number). To do so, it keeps a carry representing the carry of each multiplication ((4*5) has a carry of 2) and recursively performs the multiplication of each element. 

- `auxDivBN` is an auxiliar function to the division which keeps the current quotient of the division calculation and recursively applies the subtraction of bn2 to bn1 by calling `subBN`.

- `divBNCalc` is a more efficient alternative to the previously mentioned `auxDivBN`, to divide positive BNs. 
  
  Firstly, this function receives 4 arguments: remaining divisor (`d1`), dividend (`d2`), quotient (`quot`), currently used divisor (`currD1`). The last argument stores the divisor that is being compared with the quotient in the current iteration, while the first argument stores the rest of the divisor.
  
  Afterwards, this function will be recursively called upon the following conditions:
    - If `d1` is an empty list, meaning the divisor has been fully taken into account, we divide `currD1` by the quotient, using `divBNSimple`, returning a tuple, composed by the quotient up until this point appended with the resulting quotient and the resulting remainder.
    - If `d1` is not empty, we compare the `currD1` with the quotient and, once again, there are 2 routes:
      - If `currD1` is greater than or equal to `d2`, we perform the division, using `divBNSimple`, of `currD1` by `d2`, updating `d1` to the remainder of this calculation appended with the previous `d1` and appending the quotient of this calculation to the `quot`. Then, in order to call the this function again recursively, we need to set `currD1` to the first element of this new `d1` and consequently remove that first element from `d1`.
      - If `currD1` is less than `d2`, we'll remove the first element of `d1`, as it will be taken into account and appended to `currD1` and then call `divBNCalc` with updated arguments.

## Exercise 4
As we were expecting, the methods to calculate the Fibonacci sequence are clearly more efficient when applied to the `Int` data type. This is because it is a data structure that represents integers in a predefined range, opposed to the `Integers` and `BigNumbers`, which are limited by the machine's memory.

However, this first data type is only capable of storing numbers of the Fibonacci sequence up until n=92, as the maximum range of values for `Int`'s is [-2^63, 2^63 - 1]. On the other hand, both `Integers` and `BigNumbers` are capable of calculating much larger elements of the sequence, since they are only limited by the physical memory of the system. For the sake of testing, the maximum sequence number calculated for this data types was n=10^6.

Hereafter are represented the tables with the execution time (in seconds) of the implemented functions, for each data type under analysis and for increasing values of the Fibonacci sequence.

## Tables with the execution time (seconds) for different functions Fib(n)

### `fibRec`

|    | Int   | Integer | BigNumber |
|----|-------|---------|-----------|
| 20 | 0.01  | 0.02    | 0.32      |
| 30 | 1.50  | 3.22    | 33.95     |
| 35 | 14.94 | 35.92   | 331.03    |
| 50 | ----- | ------- | --------- |

### `fibLista`

|       | Int  | Integer | BigNumber |
|-------|------|---------|-----------|
| 500   | 0.00 | 0.01    | 0.07      |
| 2000  | 0.03 | 0.04    | 0.73      |
| 10000 | 0.40 | 0.63    | 23.83     |
| 20000 | 1.53 | 2.72    | 104.25    |

Note that in the tables where the the limit of representation for `Int` is exceeded, n=92, the retuned values for that data type suffer overflow and aren't valid. Hence the tests for bigger sequence numbers were only made to compare the efficiency of the different data types.

### `fibListaInfinita`

|       | Int  | Integer | BigNumber |
|-------|------|---------|-----------|
| 500   | 0.00 | 0.01    | 0.05      |
| 2000  | 0.00 | 0.02    | 0.61      |
| 10000 | 0.01 | 0.09    | 18.32     |
| 20000 | 0.02 | 0.19    | 78.56     |

By analysing this table, we can conclude that this function is clearly the most efficient.
