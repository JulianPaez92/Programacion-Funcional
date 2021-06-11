--CURRIFICACION(es para que se pueda realizar aplicacion parcial en las funciones)
-- (es para que las funciones posean mas abstraccion)
--Podemos definir una funcion currificar que dada una funcion no currificada
-- que toma 2 parametro, devuelva la misma funcion, pero currificada

currificar :: ((a,b) -> c)


suma' :: (Int,Int) -> Int
suma' (x,y) = x + y

--curry
currificar :: ((a,b) -> c) -> a -> b -> c
currificar f = g
  where g x y = f (x,y)

suma :: Int -> Int -> Int
suma = currificar suma'

suma 3 5
>>>8

--De forma analoga, se  puede definir la funcion "descurrificar" que hace lo opuesto:
-- dada una funcion currificada de 2 parametros, devuelve la misma funcion en su version sin currificar

--uncurry
descurrificar :: (a -> b -> c)) -> (a,b) -> c
descurrificar f (x,y) = f x y

--ALGUNA EXPRESIONES UTILES

--Las operaciones ((+), (*), (/), etc) de Haskell estàn currificadas.
--Veamos a què reduce la sig. expresion:
(+1) ((*2) 5) -> (*2) 5 + 1 -> 5 * 2 + 1 -> ... -> 11
--Esto es equivalente a la expreson (lambdax ->) FALTA...

--APLICACION PARCIAL + COMPOSICION

--La combinacion de la aplicacion parcial con la composicion de funciones nos da una gran
-- flexibilidad para definir nuevas funcion

dobleMasUno :: Int -> Int
dobleMasUno = (+1) - (*2)

--Esta forma de definir funciones sin contener ninguna informacion sobre los argumentos
-- se conoce como estilo "point-free"
--Ganamos declaratividad y expresividad, con un código más corto y conciso. Esta es la esencia de la programación funcional.


--EJERCICIOS PRACTICO

--1) Verificar las siguientes propiedades.
--Para toda f :: a −> b −> c vale que curry (uncurry f) = f

curry (uncurry f) x y -> uncurry f (x,y) -> f x y

--2)Reescribir las siguientes definiciones sin utilizar where o expresiones lambda, y utilizando la menor cantidad de paréntesis posible.

apply f = g
  where g x = f x

apply :: ( a->b ) -> a -> b
apply f x = f x
apply f = f --Con point free

--3)Indicar el tipo de cada una de las funciones del ejercicio anterior, utilizando también
--  la menor cantidad posible de paréntesis.

compose :: (b->c) -> (a->b) -> a -> c
compose = \f −> (\g −> (\x −> f(g x)))
compose f g x = (f . g) x
compose f g = f . g --Con point free

--4)Reescribir las siguientes funciones en estilo point-free usando aplicación parcial de
--  alguna función adecuada.

agregar3 xs = xs ++ [3]
agregar3 xs = (++) xs [3]
agregar3 xs = (\xs -> xs ++ [3]) xs
agregar3 xs = (++[3]) xs

--Ejmpl
(\x -> x + 1) 2 = 2 + 1
(+1) 2 = 2 + 1
