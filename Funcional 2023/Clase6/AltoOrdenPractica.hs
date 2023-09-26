--1. Dar expresiones lambda para las siguientes funciones.
(suma x) y = x + y

suma x = \y -> x + y

suma x = \x -> (\y -> x + y)

suma = \x y -> x + y

snd (_,y) = y

snd = \(_,y) -> y 

head (x:_) = x -- head (x:xs) = x 

head = \x:_ -> x

--twice f x = f (f x)
--twice f = \x -> f (f x)
twice f x = f (f x)

twice twice

twice twice f = twice (twice f)

twice twice =  \f -> twice (twice f)






--2. Dar el tipo de las siguientes funciones.

--apply :: (a -> b) -> a (->) b
apply :: (a -> b) -> c (->) d
apply f = g
 where g x = f x

x :: c por ser argumento de g
x :: a por ser argumento de f
=> a = c

f x :: b
g x :: d
=> b = d porque g x = f x

apply f x = f x

apply suma

apply succ

succ :: Int -> Int
a = Int

succ (doble 3)

--suma :: a -> b
-- b ::  c -> d
suma :: Int -> Int -> Int
a = Int, b = Int -> Int

--apply f = f

id :: a -> a
id x = x

-----------

--flip :: (a -> b -> c) -> (d -> e -> f)
flip :: (a -> b -> c) -> b -> a -> c
flip f = g
 where g x y = f y x

x :: d , x :: b => d = b
y :: e , y :: a => e = a
g x y :: f , f x y :: c => f = c


flip f = \x y -> f y x

flip f x = \y -> f y x

flip f x y == f y x

(flip suma) 2 3 = suma 3 2

(flip (.)) f g = (.) g f == g.f

-------
--TAREA
appDup f = g
 where g x = f ( x , x )

--TAREA
appFork ( f , g ) = h
 where h x = ( f x , g x )




3. Teniendo en cuenta las definiciones anteriores, dar el tipo de las siguientes expresiones
y escribirlas con expresiones lambda.

apply :: (a -> b) -> a -> b
fst :: (a',b') -> a'
a = (a',b'), b = a'

apply fst :: (a', b') -> a'

apply fst = \(x,_) -> x

twice :: (a -> a) -> a -> a
twice ::(a' -> a') -> a' -> a' ( termina quedando a -> a)

--twice twice :: a -> a
twice twice :: (a' -> a') -> a' -> a' 

twice :: (a -> a) -> a -> a
--flip :: (a' -> b' -> c') -> (b' -> a' -> c')
flip :: (a' -> a' -> c') -> (a' -> a' -> c')
a = a' -> b' -> c' y a'=b'

twice flip :: (a' -> a' -> c') -> (a' -> a' -> c')

twice f x = f (f x)

twice flip f = flip (flip f)
twice flip = \f -> flip (flip p)


appDup appFork

