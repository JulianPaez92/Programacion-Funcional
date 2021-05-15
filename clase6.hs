--CLASE 6 ALTO ORDEN

--Las funciones son valores

--Un valor es una entidad abstracta(matematica)
--un entero(int), un boolean(bool), etc
--En particular, las funciones son valores
--Por ejemplo, las funciones de enteros en enteros(Int->Int),
-- las funciones de enteros en booleanos(Int->Bool)
--Asi como entedemos al 5 como el valor cinco. Podemos entender a la funcion
-- que "dado un x, devuelve el doble de x" como la función doble.
--En haskell podemos escribir esta funcion así: \x -> 2*x

cinco :: Int
cinco = 5

doble :: Int->Int
doble = \x -> 2*x

--Funciones Anonimas

--Podemos escribir expresiones que involucren funciones sin necesidad
-- de darle un nombre a la funcion(de la misma forma que usamos el numero 5 sin ponerle el nombre cincon).

--Que valor denota la expresion?
(\x -> 2*x) 2 + 1
--Estas funciones que no tienen nombre se llaman LAMBDA EXPRESSIONS(funciones anonimas)
--Esto se debe a la similitud con el calcula lambda donde se escribe la 
-- de forma similar: (λx.2*x)

--Como se reduce esta expresion?
(\x -> 2*x) ((\x -> x+1) 5)
-> 2 * (\x -> x+1) 5
-> 2 * (5+1)
-> 2 * 6
-> 12

--ALTO ORDEN

--Recordemos que las funciones toman valores y devuelven valores.
--Vimos que las funciones tambien son valores, entonces... las funciones
-- pueden tomar funciones y devolver funciones!!!

twice = \f -> (\x -> f (f x))
--Esto se lee: "twice es la funcion que toma una funcion f y devuelve la funcion
-- que toma un valor x y devuelve el resultado de aplicar f al resultado de aplicar f a x"

--Definido de otra manera:
twice f = \x -> f (f x) 
--Mas claro:
twice f = g
 where g x = f (f x)

--Ejemplo:
(twice doble) 2
-> (\x -> doble (doble x)) 2
-> doble (doble 2)
-> 8

--Ejercicios ejemplo:
--1)Defini la funcion sumarDos usando la funcion twice y la funcion succ
succ x = x + 1
sumarDos x = x + 2

--2)Reducir la expresion((twice twice) doble) 3

--1)
twice f = g
 where g x = f (f x)
--usar twice y succ

sumarDos :: Int->Int
sumarDos = twice succ

--sumarDos x == (twice succ) x == succ (succ x) == succ x + 1 = x + 1 + 1 == x + 1

--2)
doble x = 2 * x

reducir ((twice twice) doble) 3 == (twice (twice doble)) 3 == (twice doble) ((twice doble) 3)
== doble (doble ((twice doble) 3)) == 2 * (2 * (twice doble) 3) == 2 * (2 * doble (doble 3))
== ... == 48

--Cual es el tipo de la funcion twice?
twice :: (a->a) -> (a->a)
--En realidad, los ultimos parentesis no son necesarios porque
a -> b -> c y a -> (b->c) --son equivalentes(se asocia a derecha)
--Tambien podemos escribir la funcion twice asi:
(twice f) x = f (f x)
--En realidad, los primeros parentesis no son necesarios porque f x y Y (f x) son equivalentes(la ecuacion asocia aizquierda)
twice :: (a->a) -> a -> a
twice f x = f (f x)

--LA COMPOSICION

--Una operacion muy util entre funciones es la composicion, definida de la siguiente forma
comp f g = h
 where h x = f (g x)
--Notar que la composicion es asociativa pero no es conmutativa, por ej, las sig funciones son distintas:
dobleMasUno = comp succ doble
dobleDelSucesor = comp doble succ

dobleMasUno 3 -> (comp succ doble) 3 -> succ (doble 3) -> ... -> 2 * 3 + 1 -> 7
dobleDelSucesor 3 -> (comp doble succ) 3 -> doble (succ 3) -> ... -> 2 * (3 + 1) -> 8

--Ya viene definida en haskell
(.) :: (b -> c) -> (a -> b) -> a -> c
(.) f g = h
 where h x = f (g x)

--Ejercicio ejemplo:
--1) Definir la funcion twice usando la funcion (.) (composicion)
--2) Idem para la funcion sumaTres
sumarTres x = x + 3

--1)
twice' f = f . f
twice' f x == (f . f) x == f (f x)

--2)
--operacion nivel uno
sumarTres = succ . (succ . succ) == succ . (twice' succ) == succ . sumarDos

4 = 2 + 2 -- operacion nivel cero

sumarDos x == (succ . sumarDos) x == succ (sumarDos x) == sumarDos x + 1 == x + 2 + 1 == x + 3
{-
--Ejercicios Practica 5

-- Alto orden
-- 1. Dar expresiones lambda para las siguientes funciones.
-- suma
-- snd
-- head
-- twice twice
-- 2. Dar el tipo de las siguientes funciones.
-- apply f = g
-- where g x = f x
-- flip f = g
-- where g x y = f y x
-- appDup f = g
-- where g x = f ( x , x )
-- appFork ( f , g ) = h
-- where h x = ( f x , g x )
-- 3. Teniendo en cuenta las definiciones anteriores, dar el tipo de las siguientes expresiones
-- y escribirlas con expresiones lambda.
-- apply fst
-- twice twice
-- twice flip
-- appDup appFork
-}

--1) suma
suma' x = \y -> x+y

suma = \x -> suma x (\y -> x+y)

sum'' =  \x y -> x+y

--esto se hace si necesitas utilizar la función sólo una vez

\x y -> x+y

-- snd
snd :: (a,b) -> b
snd (_,y) = y 

snd = \(_,y) -> y

-- head 
head :: 
head = \

--twice twice
twice f = \x -> f (f x)
twice twice = \x -> twice(twice x)

doble x = 2*x

(twice twice) doble 
-> twice (twice doble) 
-> \x -> (twice doble) ((twice doble) x)
-> \x 

--2) apply f = g
apply :: (a -> b) -> (a -> b)
apply f = g
  where g x = f x

(apply succ) 5 -> succ 5 -> 5+1 -> 6

-- appFork ( f , g ) = h
appFork :: (* -> *, * -> *) -> (* -> (*,*))
appFork ( f , g ) = h
  where h x = ( f x , g x )

*Main> :t appFork
--(appFork (doble, succ)) 5 -> (doble 5, succ 5) -> ... -> (10, 6)

:i (.)
