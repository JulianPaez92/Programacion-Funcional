maximo :: Int -> Int -> Int
maximo x y | x >= y = x
            | otherwise = y

--f :: Int -> Bool

--g :: (Int,Int) -> Bool


--Como definir los tipos de datos
--Instancia(Clase y variable de tipo) => x :: y  
--Num a => 1 :: a -- a es variable de tipo
--Las variables de tipos deben empezar en minuscula

--(^) :: (Integral b, Num a) => a -> b -> a

--Main> :t triple
triple :: Num a => a -> a
triple x = 3 * x

--Familia de tipos TUPLAS

sucesor :: Num a => a -> a
sucesor x = x + 1

segundo :: a -> b -> b 
segundo _ y = y

--Practica1
-- 1. Dar un tipo válido para las siguientes expresiones.
-- 1 + 1.0
f :: Int -> Float -> Float

-- 1/2
g :: Integer -> Integer -> Double

-- div 1 2
h :: Int -> Int -> Int

-- mod 2 3 == 0
i :: Integral -> Integral -> Bool

-- (1, True)
j :: Int -> Bool -> (Int,Bool) 
-----------------------------------

--Ejercicio 1
--Definir una funcion con el siguiente tipo
--f :: (Eq a, Ord b) => a -> a -> b -> b Bool -> a


--Ejercicio 2

--Ejercicio 3

--Ejercicio 4
