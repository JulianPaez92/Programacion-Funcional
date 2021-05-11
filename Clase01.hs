suma x y = x + y
doble x = 2 * x
producto x y = x * y
absoluto x | x >= 0 = x
    | otherwise = -x

maximo :: Int -> Int -> Int
maximo x y | x > y = x
            | otherwise = y



-- Esto es un comentario 

-- Tipo de datos
-- Main> :t maximo
-- maximo :: Int

-- Clases de tipos

-- Engloban varios datos de tipos entre si en un conjunto
-- para realizar calculos
-- 1- Integral
-- 2- Fractional
-- 3- Floating := ({Float, Double, ...},{sqrt, sin, cos, tan, ...})
-- 4- Num := ({Int, Integer, Float, Double, ...},{(+), (*), abs, ...})
-- 5-
-- 
-- ejemplo 
--  :t identidad 
--  identidad :: a -> a

instance Num Bool where
    (+) = (||)
    negate = not
    (*) = (&&)
    abs = id
    signum = id
    fromInteger = (>0)
-- Los operadores, x ej, van con "()" si es que se colocan de manera prefija
-- Main> (+) 2 3 PREFIJA
-- Main> 2 + 3 INFIJA
-- 
-- 3 * True = True
--  True && false = F
-- 1 * 0 = 0
-- Diferencia entre variable y constantes son las A y a
-- A es una constante
-- a es una variable
-- 
-- Nueva familia de tipos: Tuplas
-- fst :: (a, b)
-- snd :: (a, b)
-- 
-- 2 -
sucesor :: () -> ()
sucesor x = x + 1
--
--
-- 
--
--
--
