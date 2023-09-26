-LISTAS

Las listas en Haskell son “listas” de elementos de un mismo tipo.
Los elementos se pueden repetir. Por ejemplo:
-> [1, 2, 1]
-> [True, False, False, True]
-> [] (lista vacía)
Si T es un tipo concreto, el tipo de una lista de elementos de T se
escribe con [T]:
-> [True, False, False]:: [Bool]
-> [1, 2, 3, 4]:: Num a => [a]
-> [1, 2 ‘div‘ 1, 3, 4]:: Integral a => [a]
-> [1, 2/1, 3, 4]:: Fractional a => [a]
-> [[1::Int], [2,3], [], [1,1000,2,0]]:: [[Int]]
-> [1, True] no es una lista válida
-> [1.0, div 1 1] no es una lista válida

-OPERACIONES

Para construir listas
-> [] :: [a]
-> (:) :: a -> [a] -> [a]
Algunas operaciones
-> head :: [a] -> a
-> tail :: [a] -> [a]
-> (++) :: [a] -> [a] -> [a]
-> length :: [a] -> Int
-> reverse :: [a] -> [a]

-INDUCCION ESTRUCTURAL

Dado un tipo A ¿Cómo podemos definir rigurosamente las listas de
A?
Podemos notar que [A] satisface las siguientes propiedades:
(i) [] :: [A]
(ii) x :: A && xs :: [A] => x:xs :: [A]
Más aún, toda lista de tipo [A] se puede construir de esta forma.
Tomemos por ejemplo A=Int y veamos que [1,2] :: [Int]
-> ¿[2] :: [Int]? Sí, porque por (i) [] :: [Int] y por (ii), esto
implica que 2:[]=[2] :: [Int]
-> ¿[1,2] :: [Int]? Sí, porque ya vimos que [2] :: [Int] y por
(ii), esto implica que 1:[2] = [1,2] :: [Int]
-> etc...

Podemos basarnos en la estructura de las listas para demostrar
propiedades sobre ellas.
Sea P(xs) una proposición sobre una lista xs.
Por ejemplo P(xs): length xs >= 0
¿Cómo probamos que esta proposición es válida para toda lista?
(i) Probamos la proposición para la lista vacía (P([]) es
verdadera). Esto se llama el caso base.
(ii) Probamos que si la proposición vale para la lista xs, entonces
también vale para la lista x:xs (P(xs) => P(x:xs)). Esto se
llama el paso inductivo.
De esto se deduce que la proposición es verdadera para toda lista.
Por ejemplo, si xs = [1,2]:
-> ¿Vale P([])? Sí, porque lo probamos en (i).
-> ¿Vale P([2])? Sí, porque ya sabemos que vale P([]) y, por (ii),
esto implica que también vale P(2:[]).
-> etc...


-DEFINICIONES RECURSIVAS EN LISTAS

Podemos definir funciones sobre las listas de forma similar.
Primero, definimos el valor de la función en []. Luego, definimos el
valor de la función en la lista x:xs usando el valor de la función en
xs, que lo asumimos ya definido. Resumiendo...
1 -> f [] = ...
2 -> f ( x : xs ) = ... f xs ...
Por ejemplo, podemos definir la función length :: [a] -> Int de la
siguiente forma:
1 -> length [] = 0
2 -> length ( x : xs ) = 1 + length xs
Podemos probar por inducción estructural que esta función queda
definida en cualquier lista.
length [1,2] -> 1+length [2] -> 1+(1+length []) -> 1+(1+0) -> 2

-DEMOSTRACIONES POR INDUCCION ESTRUCTURAL

Notar que es inmediato, a partir de la definición, probar la
correctitud de la función length.
Veamos que P(xs): length xs >= 0 es verdadera para toda lista xs.
-> P([]): length [] >= 0 es verdadero ya que, por la primera
ecuación de la definición de length, esto reduce a 0 >= 0, que
es verdadero (asumimos la correctitud de (>=)).
-> Supongamos que P(xs): length xs >= 0 es verdadero, y
veamos que esto implica que P(x:xs): length (x:xs) >= 0
también lo es.
(i) Por la segunda ecuación, length (x:xs) reduce a
  1 + length xs
(ii) por la hipótesis inductiva: length xs >= 0
(iii) de (ii) y la correctitud de (>=), se sigue que
  1 + length xs >= 0
(iv) por (i) y (iii), deducimos que length (x:xs) >= 0 es verdadero
Queda probado entonces, por inducción estructural, que P(xs):
length xs >= 0 es verdadera para toda lista xs.

-MAS DEFINICIONES RECURSIVAS

-- head no esta definida en la lista vacia
head :: [ a ] -> a
head [] = error " lista vacia "
head ( x : _ ) = x

tail :: [ a ] -> [a]
tail [] = []
tail ( _ : xs ) = xs

(++) :: [ a ] -> [ a ] -> [ a ]
[] ++ ys = ys
( x : xs ) ++ ys = x : ( xs ++ ys )

-MAS DEFINICIONES RECURSIVAS

Ejercicio
-> Probar por inducción estructural la siguiente propiedad:
length (xs ++ ys) == length xs + length ys.
-> Implementar la función reverse recursivamente y probar por
inducción estructural que length xs == length (reverse xs).
-> Definir recursivamente la función sum :: Num a => [a] -> a que
suma todos los elementos de una lista de números. Ej:
sum [1,3,5] 1+3+5 9

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]
--reverse' [x] = [x] --CB 
--reverse' (x:y:xs) = reverse' xs ++ [y,x]


-- [1,2,3] == 1 : [2,3]

-- x = 1, xs = [2,3]

-- [3,2,1] == [3,2] ++ [1] = reverse [2,3] ++ [1]