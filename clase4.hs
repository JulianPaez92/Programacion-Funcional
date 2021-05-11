--Repaso de Listas en Haskell
--Siempre tienen que ser del mismo tipo, el primero que encuentra es el que la define.

--[True,False] :: [Bool]
--[[1::Int], [2,3], [], [1,1000,2,0]] :: [[Int]]

--OPERACIONES 

--Para construir listas
--[] :: [a]
--(:) :: a -> [a] -> [a]
--head :: [a] -> a
--tail :: [a] -> [a]
--(++) :: [a] -> [a] -> [a]
--length :: [a] -> Int
--reverse :: [a] -> [a]

--Induccion Estructural
--Se basa en como se construyen estructuralmente las listas

--Dado un A como definimos las listas de A?
--1) [] :: [A]
--2) x :: A && xs :: [A] => x:xs :: [A]

--Propiedad
-- P(xs): length xs => 0

--1)CASO BASE 
--2)PASO INDUCTIVO

--1) P([])
--2) f (2:[]) => Es cierto por x:xs y porque length([]) => 0 

--1) length [] = 0
--2) length (x:xs) = 1 + length xs

--length [1,2] => 1+length [2] => 1+(1+length []) => 1+(1+0) => 2

--INDUCCION ESTRUCTURAL
reverse' :: [a] -> [a]
reverse' [] = []                       --(R1)
reverse' (x:xs) = reverse' xs ++ [x]   --(R2)       [1,2,3] = 1:(2:(3:([]))) ES LO MISMO QUE (x:xs)

length' :: [a] -> Int
length' [] = 0                  --(L1)
length' (x:xs) = 1 + length' xs --(L2)

-- P(xs): length xs == length (reverse xs)
-- CB) P([]): length [] == length (reverse [])
-- length [] =(L1) 0
-- length (reverse []) =(R1) length []
-- PI) P(xs) => P(x:xs)
-- Hipotesis Inductiva) P(xs): length xs == length (reverse xs)
-- Tesis) P(x:xs): length (x:xs) == length (reverse (x:xs))
-- 1) length (x:xs) ==(L2) 1 + length ==(HI) 1 + length (reverse xs)
-- 2) length (reverse (x:xs)) ==(R2) length (reverse xs ++ [x]) ==(*)
-- Por propiedad: length (xs ++ ys) == length xs ++ length ys
-- (*)== length (reverse xs) + length [x] ==(L2) length (reverse xs) + 1 + length []
-- ==(L1) length (reverse xs) + 1 + 0 == length (reverse xs) + 1

-- (*) Pruebo la propiedad: HACER


-- todosPares :: [ Int ] -> Bool que devuelve True si y solo si todos los elementos
-- de la lista son pares.

todosPares :: [Int] -> Bool
todosPares [] = True
todosPares (x:xs) = esPar x && todosPares xs

esPar :: Int -> Bool
esPar x = x `mod` 2 == 0

bubbleStep :: Ord a => [a] -> [a]
bubbleStep [] = []
bubbleStep [x] = [x]
bubbleStep (x:y:xs) | x <= y = x : bubbleStep (y:xs)
                    | otherwise = y : bubbleStep (x:xs) 

bubbleStepNVeces :: Ord a => Int -> [a] -> [a]
bubbleStepNVeces 0 xs = xs
bubbleStepNVeces n xs = bubbleStepNVeces (n-1) xs

bubbleSort :: Ord a => [a] -> [a]
bubbleSort xs = bubbleStepNVeces (length xs - 1) xs

-----------------------------------------------------------------------------
--CLASE 4
--