-- Programación Funcional - Primer Parcial
-- Modificar nombre del archivo por "nombre-apellido.hs"

-------------- Ejercicio 1 -----------------

-- Definir una función con el siguiente tipo
f1 :: (Eq b, Num a) => (a -> b) -> b -> (b,b)

-------------- Ejercicio 2 -----------------

-- a) Definir recursivamente una función "repetir" que dado un caracter c 
-- y un entero n devuelve el string que tiene el caracter c repetido 2*n veces.
-- Ej: repetir 'a' 2 == "aaaa"

-- b) Probar por inducción la siguiente propiedad:
-- P(n): length (repetir 'a' n) == 2 * n

-- length :: [a] -> Int
-- length [] = 0                 (L1)
-- length (_:xs) = 1 + length xs (L2)

-------------- Ejercicio 3 -----------------

f :: [Int] -> Int
f []                    = 1
f [_]                   = 1
f (x:_:xs)              = div x (f xs)

-- reducir la expresión f [1,f [3],4,2] con orden aplicativo.

-------------- Ejercicio 4 -----------------

-- verificar la siguiente igualdad: (3*) . curry (\(x,y) -> x+y) == \x y -> 3 * (x + y)

--Ejercicio 1

f1 :: (Eq b, Num a) => (a -> b) -> b -> (b,b)

f1 x y | y == True = (x,x) 


--Ejercicio 2 a)

repetir :: Char -> Int -> String
repetir c 0 = "" 
repetir c n = c ++ c ++ repetir (c n-1) 

--Ejercicio 2 b)

--P(n): length (repetir "a" n) == 2 * n

length :: [a] -> Int
length [] = 0                 (L1)
length (_:xs) = 1 + length xs (L2)

repetir :: Char -> Int -> String
repetir c 0 = "" --(C1)
repetir c n = c ++ c ++ repetir (c n-1) --(C2)

-- P(n): length (repetir 'a' n) == 2 * n
-- CB) P(0): length (repetir 'a' 0) == lenght [] == 0  vale por (C1)
-- PI) P(n) => P(n+1)
-- HI) P(n): length (repetir 'a' n) = 2*n
-- Tesis) P(n+1): lenght (repetir 'a' n+1) = 2*(n+1)
-- lenght (repetir 'a' n+1) ==(C2) lenght(repetir 'a' ((n+1)-1)) + 2 == lenght(repetir 'a' n) + 2 ==(HI) 2n + 2
-- 2(n+1) == 2  --Tesis vale por (1) y (2)

--Ejercicio 3

f :: [Int] -> Int
f []                    = 1
f [_]                   = 1
f (x:_:xs)              = div x (f xs)

-- reducir la expresión f [1,f [3],4,2] con orden aplicativo.

f :: [Int] -> Int
f []                    = 1
f [_]                   = 1
f (x:_:xs)              = div x (f xs) -- div x y

  f[1,f [3],4,2]
~>f[1,1,4,2]
~>f 1:[1,4,2]
~>f 1:1:[4,2]
~>div 1 (f [4,2])
~>div 1 (f 4:[2])
~>div 1 (f 4:2:[])
~>div 1 (div 4 (f []))
~>div 1 (div 4 1)
~>div 1 4
~> 0

--Ejercicio 4

-- verificar la siguiente igualdad: (3*) . curry (\(x,y) -> x+y) == \x y -> 3 * (x + y)

--currificar :: ((a,b) -> c)

(3*) . curry (\(x,y) -> x+y) == \x y -> 3 * (x + y)
(3*) . (x+y) == \x y -> 3 * (x + y)
3 * (x+y) == \x y -> 3 * (x + y)  
3*x + 3*y == \x y -> 3*x + 3*y
