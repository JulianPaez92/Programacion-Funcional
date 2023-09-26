--1. Decir cuáles de las siguientes expresiones son válidas y dar un tipo válido para ellas.
--[] :: [a] --válido 

--[3, 1.0, 2] :: [Float] --valido

--[2 :: Int, 1.0 , 2] -- no tipa porque Int no esta en la clase Fractional

--[True, [False]] -- no tipa porque el 1er elemento es de tipo Bool y el 2do es tipo [Bool]


--2. Implementar recursivamente las siguientes funciones.
sumaLista :: [Int] -> Int--que calcula la suma de todos los elementos de la lista.

sumaLista [] = 0                    (SL1)
sumaLista (x:xs) = x + sumaLista xs (SL2)

--CORRECTITUD:
P(xs): sumaLista xs == "la suma de todos los elementos de la lista xs"

--Otra forma de escribir P(xs): sumaLista xs == x1 + x2 + ... + xn donde xs == [x1, x2, ..., xn]

CB) P([]): sumaLista [] == "la suma de todos los elementos de la lista []"

sumaLista [] ==(SL1) 0
"la suma de todos los elementos de la lista []" = 0

PI) P(xs) => P(x:xs)

HI) P(xs): sumaLista xs == "la suma de todos los elementos de la lista xs"

Quiero probar P(x:xs): sumaLista (x:xs) == "la suma de todos los elementos de la lista (x:xs)"

sumaLista (x:xs) ==(SL2) x + sumaLista xs  == x + "la suma de todos los elementos de la lista xs"

"la suma de todos los elementos de la lista (x:xs)" == x + "la suma de todos los elementos de la lista xs"

Por lo tanto, por inducción estructural, P(xs) vale para toda lista xs


--sumaLista [1,2,3,4] == 1 + 2 + 3 + 4
--sumaLista [2,3,4] == 2 + 3 + 4

--prodLista :: [ Int] −> Int que calcula el producto de todos los elementos de la
--lista.
--todosPares :: [ Int] −> Bool que devuelve True si y solo si todos los elementos
--de la lista son pares.
--todosIguales :: [ Int] −> Bool que devuelve True si y solo si todos los elementos
--de la lista son iguales.
--pertenece :: Eq a => a −> [a] −> Bool que toma un elemento x y una lista xs
--y devuelve True si y solo si x pertenece a xs.


--3. Probar por inducción estructural que las funciones implementadas en el ejercicio 2 son
--correctas.


--4. Dadas las siguientes definiciones recursivas probar por inducción la sigiuentes propiedades.
length [ ] = 0 (L1)
length ( x : xs ) = 1 + length xs (L2)

[ ] ++ ys = ys (C1)
( x : xs ) ++ ys = x : ( xs ++ ys ) (C2)

reverse [ ] = [ ] (R1)
reverse ( x : xs ) = reverse xs ++ [ x ] (R2)

--P(xs): para toda lista ys y para toda lista zs, (xs ++ ys) ++ zs == xs ++ (yz ++ zs)

P(xs): para toda lista ys, length (xs ++ ys) == length xs + length ys

CB) P([]): para toda lista ys, length ([] ++ ys) == length [] + length ys

Sea ys una lista cualquiera.

length ([] ++ ys) ==(C1) length ys
length [] + length ys ==(L1) 0 + length ys == length ys

PI) P(xs) => P(x:xs)

HI) P(x:xs): para toda lista ys, length ((x:xs) ++ ys) == length (x:xs) + length ys

length ((x:xs) + [ys]) == length (x : (xs ++ ys)) ==(L2) 1 + length (xs ++ ys) ==(hi) 1 + length xs + length ys

length (x:xs) + length ys ==(L2) 1 + length xs + length ys

Por lo tanto, por induccion estructural, vale P(xs) para toda lista xs.

--SE PUEDEN USAR DEMOSTRACIONES/PROPIEDADES DE OTROS EJERCICIOS PARA DEMOSTRAR EL ACTUAL.

length [ ] = 0 (L1)
length ( x : xs ) = 1 + length xs (L2)

[ ] ++ ys = ys (C1)
( x : xs ) ++ ys = x : ( xs ++ ys ) (C2)


--Ejemplo -> length ([1,2] ++ [3]) == length [1,2] + length [3]

--P(xs): length xs == length (reverse xs)