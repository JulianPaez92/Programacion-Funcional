--INDUCCION ESTRUCTURAL(es para todas las listas)
length (xs ++ ys) == length xs + length ys

--Concatenacion y longitud
[] ++ ys = ys (C1)
(x:xs) ++ ys = x: (xs ++ ys) (C2)

length [] = 0  (L1)
length (x:xs) = 1 + length xs (L2)


P(xs): para toda lista ys, length (xs ++ ys) == length xs + length ys

Demostracion por induccion estructural

Caso base: P([]): para toda lista ys, length ([] ++ ys) == length [] + length ys
1) length ([] ++ ys) == length ys (por C1)
2) length [] + length ys == 0 + length ys == length ys(por L1)
3) por 1) y 2) vale la igualdad

Paso recursivo: P(xs) => (x:xs)
Hipotesis inductiva: P(xs): para toda lista ys, length (xs ++ ys) == length xs + length ys
quiero ver que vale P(x:xs) para toda lista ys, length ((x:xs) ++ ys) == length (x:xs) + length ys
1) length ((x:xs) ++ ys) ==(C2) length (x: (xs ++ ys)) ==(L2) 1 + length (xs ++ ys)
==(Hip Ind) 1 + length xs + length ys
2) length (x:xs) + length ys == 1 + length xs + length ys
3) por 1) y 2) vale la igualdad

Por induccion estructural vale P(xs) para toda lista xs.


[1,2,3] ++ [4,5] = [1,2,3,4,5]


--------------------------------------
--Clase 5 MECANISMO DE REDUCCIÓN

--Modelo de cómputo es el modo en que se calcula el valor de una expresión
--El mecanismo de evaluación en Haskell es la REDUCCIÓN:
--1) Reemplazamos una subexpresión por otra
--2) La subexpresion a reemplazar es alguna instancia del lado izquierdo
-- de alguna ecuacion orientada del programa, y se la llama radical o redex(reducible expression)
--3) La reemplazaremos por el lado derecho de esa misma ecuación, instanciando de manera acorde
--4) El resto d ela expresión no cambia

resta :: Int -> Int -> Int
resta x y = x - y

suma :: Int -> Int -> Int
suma x y = x + ys

digitos :: Int -> Int
digitos x = ??

--Que sucede al evaluar suma (resta 2 (digitos 42)) 4
--Buscamos un redex y una asignacion:
-- suma (resta 2 (digitos 42)) 4
--      - ESTO ES REDEX      - 
--  x <- 2
--  y <- (digitos 42)

--Reemplazamos el redex con esa asignacion:
-- suma (resta 2 (digitos 42)) 4 -->> suma (2 - (digitos 42)) 4

--Se reduce hasta que no haya mas REDEX
--Por ultimo obtenemos la forma NORMAL(IRREDUCIBLE)

--MECANISMO DE REDUCCION:
--1)Si la expresion esta en forma Normal, terminamos
--2)Si no, buscar un redex, reemplazarlo y volver a empezar.


--ESTRATEGIAS DE REDUCCION(CONFLUENCIA)

--Toda expresion tiene forma NORMAL?? NO
--ejemplo
--1- f x = f (f x) = f (f (f x))
--2- infinito = infinito + 1 = (infinito + 1) + 1
--3- inverso x | x /= 0 = 1 / x 

--Cuando existe una forma Normal, es única? SI
--Esta propiedad se llama CONFLUENCIA

--Las expresiones que no tiene forma normal se dicen que están indefinididas(bottom buscar icono)

--Como podemos clasificar las funciones?
--Funciones TOTALES: nunca se indefinen

suc :: Int -> Int
suc x = x + 1

--Funciones PARCIALES: hay argumentos para los cuales se indefinen

inv :: Float -> Float
inv x | x /= 0 = 1 / x

--Que sucede si intentamos aplicar una funcion sobre una expresion que se indefine??


--((TEMA PRINCIPAL QUE DIF A LOS PROG FUNCIONALES))
--Evaluacion ESTRICTA: si cualquiera de los argumentos que pasamos a una funcion
-- esta indefinido, entonces la funcion se indefine

--Evaluacion NO ESTRICTA: puede pasar que una funcion reciba argumentos indefinidos
-- y de todas formas no se indefina

--Ejemplo

inv :: Float -> Float
inv x | x /= 0 = 1 / x

const :: a -> Int
const x = 5
--A que expresion reduce 'const (inv 0)'??
--Depende del DISEÑO del lenguaje
--El secreto está en el orden de evaluacion (Casos de False && algo, siempre es False )

--ORDENES DE EVALUACION

--Aplicativo o Eager("ansioso"): (CALL BY VALUE en calculo Lambda)
-- Empieza por reducir los redexs internos y continua hacia afuera, es decir
--  que primero evalua los argumento y despues la funcion
--Ejemplo:
  suma (3+4) (suc (2*3))
  -> suma 7 (suc (2*3))
  -> suma 7 (suc 6)
  -> suma 7 (6 + 1)
  -> suma 7 7
  -> 7 + 7
  -> 14

-- Primero redexs interno
-- Primero los argumentos, despues la funcion
-- La evaluacion siempre es estricta


--Normal: (CALL BY NAME en calculo Lambda)
-- Reduce el redex mas externo para el cual se sepa que ecuacion del programa
--  se debe aplicar, es decir que primero evalua la funcion y despues los argumentos
--  (si se necesitan)
--Ejemplo:
  suma (3+4) (suc (2*3))
  -> (3+4) + (suc (2*3))
  -> 7 + (suc (2*3))
  -> 7 ((2*3) + 1)
  -> 7 + (6 + 1)
  -> 7 + 7
  -> 14

-- El redex mas externo para el que pueda saber que ecuacion del programa se debe aplicar
-- Primero la funcion, despues los argumento(si se necesitan)
-- La evaluacion puede ser estricta o no estricta

--En caso de haber mas de un redex en el mismo nivel, ambas estrategias proceden de izq a der

--COMPARACION DE ORDENES

--Consideremos la funcion f x = x + x + x + x + x
--Veamos cuantas reducciones se hacen en cada caso al reducir la expresion f (1+1)

--Aplicativo:
f (1+1) -> f 2 -> 2 + 2 + 2 + 2 + 2
-> 4 + 2 + 2 + 2 -> 6 + 2 + 2 -> 8 + 2 -> 10
--6 reducciones

--Normal
f (1+1) -> (1+1) + (1+1) + (1+1) + (1+1) + (1+1)
-> 2 + (1+1) + (1+1) + (1+1) + (1+1) 
-> 2 + 2 + (1+1) + (1+1) + (1+1)
-> 4 + (1+1) + (1+1) + (1+1)
-> 4 + 2 + (1+1) + (1+1)
-> 6 + (1+1) + (1+1)
-> 6 + 2 + (1+1)
-> 8 + (1+1)
-> 8 + 2
-> 10
--10 reducciones

--Conclusion: es mas eficiente el orden aplicativo si el argumento aparece varias veces en al definicion de la funcion

--Consideremos la funcion f x y = x
-- Veamos cuantas reducciones se hacen en cada caso al reducir la expresion f 3 (1+2+3+4+5)

--Aplicativo:
f 3 (1+2+3+4+5) -> f 3 (3+3+4+5) -> f 3 (6+4+5) -> f 3 (10+5) -> f 3 15 -> f 3
--5 reducciones

--Normal:
f 3 (1+2+3+4+5) -> 3
--1 reduccion

--Conclusion: es mas eficiente el orden normal si hay argumentos que no aparecen en la definicion de la funcion
--Ventaja: en el orden normal siempre se llega a una forma normal (si existe) Por ej: f 3 infinito -> 3

--ORDEN DE EVALUACION "LAZY"

--En Haskell, se usa un orden normal donde los argumentos se calculan a lo sumo una vez
--Para esto se guardan los valores de los argumentos ya calculados en una table para evitar recalcularlos
--Es posible porque es un lenguaje PURO
--Ademas, un argumento puede evaluarse parcialmente. Solo se evalua lo necesario
--Esto da lugar a trabajar con estructuras de datos infinitas

--EN CMD
[1..] -- Lista de todos los numeros naturales
head [1..] -> 1
take 3 [1..] -> [1,2,3]

--------------
--CLASE 08/05

--Ejercicios practio 4

--1 y 2

--1) suma (sqrt 2) (producto 5 3)  -3 REDEXS  
--2) snd (3, inverso 0) -2 REDEXS    no tiene forma normal
--3) 1:[2] ++ reverse [3,4]  -2 REDEXS  
--4) 1 == 2 || 3 > 0  -3 REDEXS  
--5) indefinido -1 REDEX  
--6) const5 indefinido -2 REDEXS  Eval no estricta, si tiene forma normal

--2

reverse :: [a] -> [a]
reverse [] = []
reverse (x:xs) = reverse xs ++ [x]

(++) :: [a] -> [a] -> [a]
[] ++ ys = ys
(x:xs) ++ ys = x:(xs++ys)

-- [3,4] == 3:[4]
-- [4] == 4:[]


-- reduccion con orden aplicativo
--3) 
   1:[2] ++ reverse [3,4]
~> 1:[2] ++ reverse [4] ++ [3]
~> 1:[2] ++ ((reverse [] ++ [4]) ++ [3])
~> 1:[2] ++ (([] ++ [4]) ++ [3])
~> 1:[2] ++ ([4] ++ [3])
~> 1:[2] ++ (4:([] ++ [3]))
~> 1:[2] ++ 4:[3]
~> 1:([2] ++ (4:[3]))
~> 1:(2:([] ++ 4:[3]))
~> 1:(2:4:[3])
~> 1:2:4:[3]

-- ¿TOTAL O PARCIAL?

-- divide es parcial, ejemplo: divide 3 0 ~> mod 3 0 == 0 ~> bottom

divide :: Int -> Int -> Bool
divide x y = mod x y == 0

f :: Int -> Bool
f x = divide 2 (x^2+1)

-- f es total, porque divide solo se indefine con y=0 pero x^2+1 es mnayor o igual que 1,
-- en particular es distinta de 0

