--Recursivas
potenciaBase2 :: Int->Int
potenciaBase2 n
 | n == 0 = 1
 | n > 0 = 2 * potenciaBase2 (n-1)

--Pattern matching del mismo ejercicio
potenciaBase22 :: Int->Int
potenciaBase22 0 = 1
potenciaBase22 n = 2 * potenciaBase22 (n-1)

--Factorial de un Numero
--n! = {1         si n=0
--     {n*(n-1)!  si n>0

factorial :: Int->Int
factorial 0=1
factorial n=n*factorial (n-1)

--Ejercicios clase
esPar :: Int->Bool
esPar 0 = True --caso Base
esPar n = not (esPar(n - 1)) --paso Recursivo

--la entrada es un nro natural
esMultiploDe3 ::  Int->Bool
esMultiploDe3 0 = True --caso Base
--esMultiploDe3 1 = (False Esto matematicamente)
esMultiploDe3 n = not(esMultiploDe3(n-1)) && not(esMultiploDe3(n-2)) -- paso Recursivo

sumaImpares :: Int->Int
sumaImpares 0 = 0
sumaImpares n = 1 + sumaImpares(n-1)


--n = 1 = 1
--n = 2 = 4
--n = 3 = 9
--n = 4 = 16
--n*n = n-1 + n+1 PARA 2 X 2
--n*n = 3*3 = 1*3*1*3 PARA 3 X 3
--Recursion infinita sin el 1=False
esPar3 :: Int->Bool
esPar3 0 = True
esPar3 1 = False
esPar3 n = esPar3 (n-2)

--Ejercicios Practica 2

--f(n)=2n
dosN :: Int->Int
dosN 0 = 0 --(D1)
dosN n = 2 + dosN(n-1) --(D2)

--f(n)=3 elevado a la n
tresALaN :: Int->Int
tresALaN 0 = 1
tresALaN n = 3 * tresALaN(n-1)

--f(n)=sumatoria de n de 1 en 1 de i
sum1 :: Int->Int
sum1 0 = 0
sum1 i = i + sum1(i-1)

--f(n)=sumatoria de n de 1 en 1 de icuadrado
sum2 :: Int->Int
sum2 0 = 0
sum2 i = (i)^2 + sum2(i-1)


--17/04
--Inducción
--caso BASE
--paso INDUCTIVO

--Correctitud de recursividad
-- P(n): dosN n = 2n
-- CasoBase) P(0): dosN 0 == 0 == 2*0 vale por (D1)
-- PasoInductivo) P(n) => P(n+1)
-- HipotesisInductiva) P(n): dosN n = 2n
-- Tesis) P(n+1): dosN (n+1) = 2(n+1)
-- dosN (n+1) ==(D2) dosN ((n+1)-1) + 2 == dosN n + 2 ==(HipInduct) 2n + 2
-- 2(n+1) == 2
-- como llegamos a lo mismo en (1) y (2) entonces vale Tesis)

--Practica 2

--Ejercicio 4
--mcd(a, 0) = a  Y  mcd(a, b) = mcd(b, a módulo b)

mcd :: Int->Int->Int
mcd x 0 = x
mcd x y = mcd y (x `mod` y)

