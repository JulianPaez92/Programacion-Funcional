maximo :: Int -> Int -> Int
maximo x y  | x >= y = x
            | otherwise = y

producto x y = x*y
cuadrado x = producto x x

norma :: (Float,Float) -> Float
norma (x,y) = sqrt (cuadrado x + cuadrado y)

triple x = 3*x
-- triple 2 = 6 SI
-- triple 2.5 = 7.5 SI
-- triple True (No deja a menos que modifiquemos el tipo del Bool)

identidad :: a->a --(ESTO SIEMPRE VA CON MINUSCULA)
identidad x = x

cuadruple :: Num a=>a->a
cuadruple x = 4*x

-- (*) 2 3 = 2 * 3
--TUPLAS
--Dados 2 tipos de datos A y B podemos crear el tipo de datos(A,B) que representa PARES ORDENADOS de elementos. Ej: (Int,Float),(Bool,(Float,Int))
--
--Funciones de 2 elem:
--fst :: (a,b) -> a  
--fst (1+4,2)
-- 5

primera :: (a,b,c) -> a
primera (x,y,z) = x

--prodInt
type R2 = (Float,Float)
type R = Float
prodInt :: R2 -> R2 -> Float
prodInt (x1,y1) (x2,y2) = x1*x2 + y1*y2

--String son una lista de caracteres String -> [Char]

todoMenor :: R2->R2->Bool
todoMenor (x1,y1) (x2,y2) = x1<x2 && y1<y2

--distanciaPuntos :: R2->R2->R
--distanciaPuntos v1 v2 = norma(diferencia v1 v2)
--  where diferencia (x1,y1) (x2,y2) > (x1-x2,y1-y2)

--mod 4 2
--0 es par
--mod 5 2
--1 no es par

--Ejercicio Practica 1
--1
suma1 :: Float->Float->Float
suma1 x y = x + y 

--fraccional :: Int->Int->Float
--fraccional x y =  x / y

--2
--HECHO
--3
f1 :: Int->Int->Int->Int
f1 x y z = x+y+z

--PREGUNTAR SABADO CLASE 3(resuelto)
f2 :: Bool->a->a->a
f2 x y z | x         = y
         | otherwise = z
--PREGUNTAR SI "X" PODRIA SER UN NUMERO(CERO POR EJ)


f3 :: (a,b)->c->(c,b,a)
f3 (a,b) c = (c,b,a)

--Ejercicios Practica 2

sumaTerna :: (Int,Int,Int)->Int
sumaTerna (x,y,z) = x+y+z

posicPrimerPar :: (Int,Int,Int)->Int
posicPrimerPar (x,y,z) | mod x 2 == 0 = 1
                       | mod y 2 == 0 = 2
                       | mod z 2 == 0 = 3
                       | otherwise = 4

crearPar :: a->b->(a,b)
crearPar x y = (x,y)

invertir :: (a,b)->(b,a)
invertir (x,y) = (y,x)

--Concatenar es ++

--Tipo función
(->) Int Bool
