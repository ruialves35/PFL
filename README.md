# PFL Project

This projects consists in implementing a library of big-numbers in haskell, including its basic arithmetic operations, in order to do the Fibonacci sequence calculation using it

# Case tests to all functions.

# Functions Explanation

## Fib

- fibRec function calculates the fibonacci value of the element n using recursion. If given an invalid value, it returns -1. This function is applied to Int.
- fibLista function calculates the fibonacci value of the element n using dynamic programming. If given an invalid value, it returns -1. This function is applied to Int.
- fibListaInfinita function calculates the fibonacci value of the element n using an infinite list. If given an invalid value, it returns -1. This function is applied to Int.

- fibRec2, fibLista2 and fibListaInfinita do the same thing of fibRec, fibLista and fibListaInfinita, respectively, but are applied to Integers.

- fibRecBN function calculates the fibonnaci of the n element by using recursion. If given an invalid value, it returns -1. This function is applied to BigNumbers, so the somaBN and subBN functions were used.

- fibListaBN uses dynamic programming to calculate the bn-fibonacci element, by calling the helpFibListBN auxiliar function. To do so, an auxiliar function was used in order to store the current values of the list with the elements and to create the breaking condition of the list calculation. SomaBN Function was also required. If given an invalid value, it returns -1.

- fibListaInfinitaBN function calculates the fibonnaci of the n element by using infinite lists applied to BigNumbers. SomaBN function was required in order to add two BigNumbers and construct the infinite list, so as the zip and tail functions. If given an invalid value, it returns -1.

### Auxiliar Functions to Fib:

- helpFibListBN function calculates the fibonacci list from a BigNumber to another. Since we are specifying the BigNumber were to start to create the list, we must give a list with all the initial values of the fibonnaci sequence from 0 to the inicial BigNumber. This functions returns a list with all the values of the fibonacci sequence from the inicial BigNumber to the final one. It uses the length function in order to get the last 2 values from the list and, this way, use dynamic programming for the calculation of the next element.


## BigNumbers

### Main Functions and definition of BigNumber

In order to make the usage of the BigNumbers easier, we decided to represent it as (Bool, [Int]), where the first element (Bool) represents the signal of the number (positive or negative) and the second element [Int] is a list that represents the current number. Ex: 100 -> (True, [1,0,0]); -1234 -> (False, [1, 2, 3, 4]).

- scanner function computes a string in the format of a BigNumber. To do so, it first checks the signal of the string (+ or -) and then maps each digit of the string

- output function computes a BigNumber into a string. To do so, it first checks if the signal of BigNumber and then converts each number of the bigNumber to digit by using the map and intToDigit functions and concatenates into a string.

- somaBN function computes the sum of 2 BigNumbers. To do so, it first checks the signal of them and if they are the same it remains the same signal, otherwise it changes the signal to the biggest bignumber in module. To add, it calls arraySum or arrayDiff, according, respectively, to having the same signal or not.

- subBN function computes the subtraction of 2 BigNumbers. To do so, it first checks the signal of them. If they have the same signal, it calls somaBN with bn2 signal changed, since bn1 - bn2 it's equal to bn1 + (-bn2). If they dont have same signals, then it calls somaBN with the respective signal on bn2, since somaBN already takes care about subtracting elements in the case that bn2 has negative signal.

-  mulBN Function multiplies two bigNumbers. To do so, it checks the signal of the result (+ if the 2 bigNumbers have the same signal, - if they dont) and uses the arrayMul function to multiply the array representing the number of the two bigNumbers.

- divBN divides 2 positive BigNumbers. This function does not prevents the division by 0. To do the division, it uses auxDivBN auxiliar function. Since the algorithm used in auxDivBN is subtract to the first number the second one until we can't do that anymore, we decided to put a special case of the division by 1.

#TO DO VER ESTA FUNCAO DE BOSTA :'( E ESTE COMENTARIO SERA QUE DEVIA EXPLICAR ISTO?


### Auxiliar Functions

- isPositive function checks if a BigNumber is positive.

- getIndex function returns the bn element of a list of BigNumbers. This function was used in order to get the index represented by a BigNumber: Ex getIndex (True, [5]) list, it gives the 5th element from list.

- lengthBN function returns the length of a BigNumber.  This should be use in case we work with values outside the scope of 64 bit Int, which is extremly unlikely

- isBigger function checks if bn1 > bn2.

- isBiggerModule function returns a bool saying if the first big number is bigger than the second in module. It compares recursively the last digit of bigNumbers if the length of them is the same. If it's not, then it means that the one with biggest length is bigger than the other.

- stripZeros function removes trailing zeros from a BigNumber. Ex: [0, 1, 2, 3] -> [1, 2, 3]

- arraySum function sums 2 arrays representing integers by doing a recursive sum of each element and keeping the carry of that sum.

- arrayDiff Function subtracts 2 arrays representing integers. To do so, it subtracts recursively the head number of each array and keeps the carry of that subtraction

- arrayMul function multiplies two arrays of Int. To do so, it receives the first array in reverse order and it returns the result in reverse order as well. This mean that to do 123*45 you must call [3,2,1] * [4,5] and it returns [5,3,5,5] instead of  [5,5,3,5]. To multiply it calls foldl applied to a map representing the multiplication of each element of bn2 to the array of bn1, using the rowMul function.

- rowMul function multiplies an integer with an array of integers (representing a number). To do so, it keeps a carry representing the carry of each multiplication ((4*5) has a carry of 2) and does that sum recursively.

- auxDivBN is an auxiliar function to the division which stores the current quocient of the division calculation and applies the subtraction of bn2 to bn1 until we can no more. This function returns the result in form of (quocient, rest).

- safeDivBN prevents the user to divide a number bn1 for a second number bn2 that represents the value 0 (bn2 = (True, [0])).

## Alínea 4
Como seria de se esperar, os métodos de cálculo da sequência de Fibonacci são claramente mais eficientes quando aplicados à estrutura de dados `Int`. Isto porque se trata de uma estrutura de dados que representa inteiros num intervalo definido, ao contrário dos `Integers` e `BigNumbers`, que são limitados pela própria memória da máquina.

No entanto, este primeiro tipo de dados é apenas capaz de armazenar números da sequência de Fibonacci até n=92, já que o intervalo máximo de valores de um `Int` é [-2^63, 2^63 - 1]. Por outro lado, tanto os `Integers`, como os `BigNumbers`, são capazes de calcular números da sequência muito maiores, visto que são limitados apenas pela memória física do sistema e, no contexto dos testes realizados, o número de sequência máximo calculado foi n = 10^6.

De seguida, estão representadas as tabelas com o tempo de execução (em segundos) das funções implementadas, para os tipos de dados estudados e para valores crescentes da sequência de Fibonacci:

## Tabelas com o tempo de execução para diferentes funções Fib(n)

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

Note-se que nas tabelas onde se ultrapassa o limite da representação de `Int`, n=92, os valores returnados para esse tipo de dados sofrem de overflow e não são válidos. Sendo que o teste foi apenas realizado para comparar a eficiência dos diferentes tipos de dados.

### `fibListaInfinita`

|       | Int  | Integer | BigNumber |
|-------|------|---------|-----------|
| 500   | 0.00 | 0.01    | 0.05      |
| 2000  | 0.00 | 0.02    | 0.61      |
| 10000 | 0.01 | 0.09    | 18.32     |
| 20000 | 0.02 | 0.19    | 78.56     |

Ao analisar esta tabela, conclui-se que esta função é claramente a mais eficiente.
