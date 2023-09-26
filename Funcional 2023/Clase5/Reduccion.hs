REDUCCION
En el contexto de los lenguajes funcionales, llamamos modelo
de cómputo al modo en que se calcula el valor de una
expresión.
El mecanismo de evaluación en Haskell es la reducción:
1. Reemplazamos una subexpresión por otra.
2. La subexpresión a reemplazar es alguna instancia del lado
izquierdo de alguna ecuación orientada del programa, y se la
llama radical o redex (reducible expression).
3. La reemplazaremos por el lado derecho de esa misma ecuación,
instanciado de manera acorde.
4. El resto de la expresión no cambia.

Reducción
Dado el siguiente programa:
resta :: Int -> Int -> Int
resta x y = x - y

suma :: Int -> Int -> Int
suma x y = x + y

digitos :: Int -> Int
digitos x = ??

 Qué sucede al evaluar suma (resta 2 (digitos 42)) 4
 Buscamos un redex y una asignación:
suma (resta 2 (digitos 42)) 4
            redex

x ← 2
y ← (digitos 42)
Reemplazamos el redex con esa asignación:
suma (resta 2 (digitos 42)) 4 suma (2 - (digitos42)) 4


FORMAS NORMALES

Las expresiones se reducen hasta que no haya más redexes.
Como resultado se obtiene una forma normal (expresión
irreducible).
Mecanismo de reducción:
1. Si la expresión está en forma normal, terminamos.
2. Si no, buscar un redex, reemplazarlo y volver a empezar.

CONFLUENCIA DE ESTRATEGIAS DE REDUCCIÓN

¿Toda expresión tiene forma normal? ¡No!
1. f x = f (f x) – ¿cuánto vale f 3?
2. infinito = infinito + 1 – ¿cuánto vale infinito?
3. inverso x | x /= 0 = 1 / x – ¿cuánto vale inverso 0?

Cuando existe una forma normal, ¿es única? ¡Sí!
Esta propiedad se llama confluencia.


INDEFINICION

Las expresiones que no tienen forma normal se dicen que están 
indefinidas (⊥). (Bottom)
¿Cómo podemos clasificar las funciones?
-Funciones totales: nunca se indefinen.
1 suc :: Int -> Int
2 suc x = x + 1
-Funciones parciales: hay argumentos para los cuales se indefinen.
1 inv :: Float -> Float
2 inv x | x /= 0 = 1/ x

EVALUACION ESTRICA VS. NO ESTRICTA

¿Qué sucede si intentamos aplicar una función sobre una expresión
que se indefine?
-Evaluación estricta: si cualquiera de los argumentos que
pasamos a una función está indefinido, entonces la función se
indefine.
-Evaluación no estricta: puede pasar que una función reciba
argumentos indefinidos y de todas formas no se indefina.
Por ejemplo:
1 inv :: Float -> Float
2 inv x | x /= 0 = 1/ x
3
4 const :: a -> Int
5 const x = 5
¿A qué expresión reduce ‘const (inv 0)’?
¡Depende del diseño del lenguaje!
El secreto está en el orden de evaluación.

ORDENES DE EVALUACION

-Orden aplicativo o eager (“ansioso”):
Empieza por reducir los redexes internos y continúa hacia
afuera; es decir que primero evalúa los argumentos y después la
función.
Ejemplo:
suma (3+4) (suc (2*3))
 suma 7 (suc (2*3))
 suma 7 (suc 6)
 suma 7 (6 + 1)
 suma 7 7
 7 + 7
 14

-Orden normal:
Reduce el redex más externo para el cual se sepa qué
ecuación del programa se debe aplicar; es decir que primero evalúa
la función y después los argumentos (si se necesitan).
Ejemplo:
suma (3+4) (suc (2*3))
 (3+4) + (suc (2*3))
 7 + (suc (2*3))
 7 + ((2*3) + 1)
 7 + (6 + 1)
 7 + 7
 14

-Orden aplicativo o eager:
Primero redexes internos.
Primero los argumentos, después la función.
La evaluación siempre es estricta(si una evaluacion se indefine, se indefine todo).

-Orden normal:
El redex más externo para el que pueda saber qué ecuación del
programa se debe aplicar.
Primero la función, después los argumentos (si se necesitan).
La evaluación puede ser estricta o no estricta.
En caso de haber más de un redex en el mismo nivel, ambas
estrategias proceden de izquierda a derecha.

ORDEN APLICATIVO VS. NORMAL

Consideremos la función f x = x + x + x + x + x.
Veamos cuantás reducciones se hacen en cada caso al reducir la
expresión f (1+1):
-Orden aplicativo:
f (1+1) f 2 -> 2 + 2 + 2 + 2 + 2 ->
 4 + 2 + 2 + 2 -> 6 + 2 + 2 -> 8 + 2 -> 10
En total: 6 reducciones.

-Orden normal:
f (1+1) -> (1+1) + (1+1) + (1+1) + (1+1) + (1+1) ->
2 + (1+1) + (1+1) + (1+1) + (1+1) ->
 2 + 2 + (1+1) + (1+1) + (1+1) -> 4 + (1+1) +
(1+1) + (1+1) -> 4 + 2 + (1+1) + (1+1) -> 6 +
(1+1) + (1+1) -> 6 + 2 + (1+1) -> 8 + (1+1) -> 8 + 2 -> 10
En total: 10 reducciones.
Conclusión: es más eficiente el orden aplicativo si el argumento
aparece varias veces en la definición de la función.


Consideremos la función f x y = x.
Veamos cuantás reducciones se hacen en cada caso al reducir la
expresión f 3 (1+2+3+4+5):

-Orden aplicativo:
f 3 (1+2+3+4+5) -> f 3 (3+3+4+5) -> f 3 (6+4+5) ->
 f 3 (10+5) -> f 3 15 3
En total: 5 reducciones.

-Orden normal:
f 3 (1+2+3+4+5) -> 3
En total: 1 reducción.

Conclusión: es más eficiente el orden normal si hay argumentos que
no aparecen en la definición de la función.
Ventaja: en el orden normal siempre se llega a una forma normal (si
existe). Por ej: f 3 infinito 3.


ORDEN DE EVALUACION LAZY

En haskell, se usa un orden normal donde los argumentos se
calculan a lo sumo una vez.
Para esto se guardan los valores de los argumentos ya
calculados en una tabla para evitar recalcularlos.
Notar que esto es posible gracias a que haskell es un lenguaje
puro.
Además, un argumento puede evaluarse parcialmente. Solo se
evalúa lo necesario.
Esto da lugar a trabajar con estructuras de datos infinitas.
Este orden se conoce como orden de evaluación lazy ("perezoso").