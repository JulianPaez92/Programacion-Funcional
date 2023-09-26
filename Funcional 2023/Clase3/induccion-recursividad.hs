--Implementar recursivamente las siguientes funciones.
--1) f(n) = 2n
doble :: Int -> Int
doble 0 = 0
doble n = 2 + doble (n-1)

-- como llegar a la forma recursiva

f(n-1) = 2 * (n-1) = 2 * n - 2 = f(n) - 2

f(n) = 2 * n

f(n-1) = f(n) - 2, n >= 1

--otra forma

f(n+1) = 2 * (n+1) = 2 * n + 2 = f(n) + 2

f(n+1) = f(n) + 2, n >= 0

--otra forma mas

f(0) = 2*0 = 0
0 + 2 = 2
f(1) = 2*1 = 2
2 + 2 = 4
f(2) = 2*2 = 4
4 + 2 = 6
f(3) = 2*3 = 6
6 + 2 = 8
f(4) = 2*4 = 8
8 + 2 = 10
f(5) = 2*5 = 10
---

f(n) = f(n-1) + 2, n>=1


-- 2) f(n) = 1^2 + 2^2 + ... + n^2

f 0 = 0
f n = 

f(n+1) = 1^2 + 2^2 + ... + n^2 + (n+1)^2 == f(n) + (n+1)^2

f(n+1) = f(n) + (n+1)^2, n>=0
f(n) = f(n-1) + n^2, n>=1
-- n=0 => f(1) = f(0) + 1

sumatoriaCuadrados :: Int -> Int
sumatoriaCuadrados 0 = 0
sumatoriaCuadrados n = sumatoriaCuadrados(n-1) + n^2

-- f(0) = 0
-- 1 = 0 + 1
-- f(1) = 1
-- 5 = 1 + 4
-- f(2) = 1 + 4 = 5
-- 14 = 5 + 9
-- f(3) = 1 + 4 + 9 = 14
-- 30 = 14 + 16
-- f(4) = 1 + 4 + 9 + 16 = 30
-- ...



P(n): sumatoriaCuadrados n = 1 + 2^2 + ... + n^2


f(n) = sumatoria_1{n} (i^2) = 1^2 + 2^2 + ... + n^2

f(n+1) = 1^2 + 2^2 + ... + n^2 + (n+1)^2 
f(n+1) = f(n) + (n+1)^2, n>=0
m = n+1
f(m) = f(m-1) + m^2, m>=1

sumaCuadrados :: Int -> Int
sumaCuadrados 0 = 0 (S1)
sumaCuadrados n = sumaCuadrados (n-1) + n^2 (S2)

--Probemos por induccion
P(n): sumaCuadrados n == f(n), para todo n natural

CB) p(0): sumaCuadrados 0 == f(0), para todo n natural

sumaCuadrados 0 ==(S1) 0
f(0) == sumatoria_1{0} (i^2) == 0

PI) P(n) => p(n+1)

HI) P(n): sumaCuadrados n == f(n)

Quiero ver P(n+1): sumaCuadrados (n+1) == f(n+1)

sumaCuadrados (n+1) ==(S2) sumaCuadrados (n+1-1) + (n+1)^2 == sumaCuadrados n + (n+1)^2
f(n+1) = sumatoria_1{n+1} (i^2) == sumatoria_1{n} (i^2) + (n+1)^2 == f(n) + (n+1)^2
==HI) sumaCuadrados n + (n+1)^2

Por lo tanto, por induccion, vale P(n) para todo n natural.
















--2. Probar por inducción que las funciones implementadas en el ejercicio 1 son correctas.

doble :: Int -> Int
doble 0 = 0                --D1
doble n = 2 + doble (n-1)   --D2

-- P(n): doble n == 2*n

-- Comienzo caso base
-- CB) Tengo que probar P(0): doble 0 == 2*0 (*)

-- 1)doble 0 ==(D1) 0
-- 2)2*0 = 0

-- Como 1) y 2) son iguales, entonces vale la igualdad / P(0) (*)
-- -- Fin caso base

-- -- Principio Paso Inductivo
-- PI) P(n) => P(n+1)
-- HI) P(n): doble n == 2*n

-- Tengo que probar P(n+1): doble (n+1) == 2*(n+1)

-- 1) doble (n+1) ==(D2) doble (n+1-1) + 2 == doble n + 2 ==(HI) 2*n + 2
-- 2) 2*(n+1) == 2*n + 2

-- Como 1) y 2) son iguales, entonces vale la igualdad (PI) / P(n+1) 
-- -- Fin Paso inductivo

-- Por el principio de Induccion, P(n) vale para todo n natural






--3. Dada la siguiente definición recursiva del factorial probar por inducción las propiedades.
--factorial :: Int ->Int
--factorial 0 = 1
--factorial n = n * factorial (n-1)
--P(n): factorial n ≥ 1
--P(n): factorial n > 2^n si n ≥ 4

factorial :: Int -> Int
factorial 0 = 0
factorial n = n * factorial (n-1) (F2)

--P(n): factorial n > 2^n si n ≥ 4

factorial 1 = 1

-- P(1) es falso
P(1): factorial 1 > 2*1
                1 > 2 (es falso)

CB) P(4): factorial 4 > 2*4

factorial 4 == 4*3*2*1 == 24
2*4 == 8
24 > 8 => P(4) es verdadero

PI) P(n) => P(n+1), n>=4

HI) P(n): factorial n > 2*n

P(n+1): factorial (n+1) > 2 * (n+1)

factorial (n+1) ==(F2) (n+1)  factorial (n+1-1) == (n+1) * factorial n >(*) (n+1) * 2 * n >
> (n+1) * 2 * 1 == (n+1) * 2

vamos a usar esta propiedad: a > b y c > 0 => c * a > c * b

a = factorial n, b = 2*n, c = (n+1) => (n+1) * factorial n > (n+1) * 2*n (*)

a = n, b = 1, c = (n+1) * 2 => (n+1) * 2 * n > (n+1) * 2 * 1 (**)








-- 4. Implementar recursivamente la función mcd :: Int ->Int ->Int que devuelve el máximo
-- común divisor entre dos números utilizando el algoritmo de euclides, es decir, usando
-- las siguientes propiedades: mcd(a, 0) = a y mcd(a, b) = mcd(b, a módulo b).
