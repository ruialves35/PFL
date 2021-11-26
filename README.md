# PFL
PFL Project



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
