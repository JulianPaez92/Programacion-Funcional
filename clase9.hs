--ESQUEMAS DE RECURSION SOBRE LISTAS
--Esquema de MAP

siguientes :: [Int] -> [Int]
siguientes [] = []
siguientes (x:xs) = (x+1) : siguientes xs

cabezas :: [[a]] -> [a]
cabezas [] = []
cabezas (xs:xss) = head xs : cabezas xss

segundos :: [(a,b)] -> [b]
segundos [] = []
segundos (x:xs) = snd x : segundos xs


--ESTE ES EL QUE HAY QUE APLICAR

esqMap :: (a -> b) -> [a] -> [b]
esqMap f = g
   where g [] = []
         g (x:xs) = f x : g xs 

--Es decir, esqMap toma una funcion "f" que manda elementos de tipo "a" 
-- en elementos de tipo "b" y devuelve una funcion que toma una lista de 
-- elementos de tipo "a" y le aplica a cada uno  de sus elementos la funcion "f",
-- devolviendo una lista de elementos de tipo "b"

--Ejemplo:
siguientes' = esqMap (+1)
cabezas' = esqMap head
segundos' = esqMap snd

--EJERCICIOS
--1) negarTodos :: [Bool] -> [Bool]
--2) porTresMasUno :: [Int] -> [Int]

--1
negarTodos :: [Bool] -> [Bool]
negarTodos = esqMap not

--2
porTresMasUno :: [Int] -> [Int]
porTresMasUno = esqMap ((+1) . (*3)) --Se puede escribir con una funcion auxilia o como lambda

--Esquema de FILTER

positivos :: [Int] -> [Int]
positivos [] = []
positivos (x:xs) | x > 0 = x : positivos xs
                 | otherwise = positivos xs

pares :: [Int] -> [Int]
pares [] = []
pares (x:xs) | x ‘mod‘ 2 == 0 = x : pares xs
             | otherwise = pares xs

sumanSiete :: [(Int,Int)] -> [(Int,Int)]
sumanSiete [] = []
sumanSiete ((x,y):xs) | x + y == 7 = x : sumanSiete xs
                      | otherwise = sumanSiete xs

--ESTE ES EL QUE HAY QUE APLICAR

esqFilter :: (a -> Bool) -> [a] -> [a]
esqFilter f = g
  where g [] = []
        g (x:xs) | f x = x : g xs
                | otherwise = g xs

--Es decir, esqFilter toma una funcion "f" que manda elementos de tipo "a" 
-- en elementos de tipo Bool y devuelve una funcion que toma una lista de 
-- elementos de tipo "a" y le aplica a cada uno de sus elementos la funcion "f", 
-- quedandose con los elementos que devuelven True

positivos' = esqFilter (>0)
pares' = esqFilter ((==0) . (‘mod‘ 2))
sumanSiete' = esqFilter ((==7) . uncurry (+))

--EJERCICIOS
--1) enCeroValenCero :: [Int -> Int] -> [Int -> Int]
--Ej: enCeroValenCero [\x -> 2*x, \x -> x-2, \x -> x*x] -> [\x -> 2*x, \x -> x*x].


--En Haskell las funciones esqMap y esqFilter ya estan definidas y 
-- se llaman map y filter

--EXTRA
--1) cabezasDeNoVacias :: [[a]] -> [a]
--2) paresCuadrados :: [Int] -> [Int]

cabezasDeNoVacias [[a]] -> [a]
cabezasDeNoVacias [] = []
cabezasDeNoVacias (xs:xss) = 
