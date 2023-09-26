--Comentario
--doble :: Int -> Int
doble x = 2 * x

--Regla de inferencia - Si f :: A -> B y x :: A entonces f x :: B

--Clases de tipos := Tipos de datos
--1) Integral := Int, Integer {mod,div}
--2) Fractional := Float, Double {(/)}
--3) Floating := Float, Double {sqrt,sin,cos,tan}
--4) Num := Int, Integer, Float, Double {(+),(*),abs}
--5) Ord := Bool, Int, Integer, Float, Double {(<=),compare} (cualquier tipo numerado)
--6) Eq := Bool, Int, Integer, Float, Double {(==),(/=)}

--Las funciones no tienen igualdad
-- Tipos deben ser instancia de las clases de Tipos(Num Bool fallarìa por ejemplo)
-- Con triple :: Num a => a -> a (restricción de tipo en Num a)
triple x = x * 3

identidad :: a -> a
identidad x = x

cuadruple :: Num a => a -> a
cuadruple x = 4 * x

--Tuplas - Pares Ordenados de elementos
--Tipos de tuplas - (Int, Float), (Bool, (Float, Int))

--fst :: (a,b) -> a
--fst (1+3, 2) = 4

--Nivel 1: Valores (True, 1, 2.0)
--Nivel 2: Tipos (Int, Float, Bool)
--Nivel 3: Clases de tipos (Num, Ord, Eq, Integral, Fractional)

--Implementar las siguientes funciones, especificando su tipo.
--1. sumaTerna: dada una terna de enteros, calcula la suma de sus tres elementos.
sumarTerna :: (Int, Int, Int) -> Int
sumarTerna (x,y,z) = x + y + z



--2. todoMenor: dadas dos ternas de números reales, decide si es
--cierto que cada coordenada de la primera es menor a la
--coordenada correspondiente de la segunda.
todoMenor' :: (Num a, Num b) => (a, a, a) -> (b, b, b) -> Bool
todoMenor' (x,y,z) (f,g,h) = (x<f) && (y<g) && (z<h)
type R3 = (Float,Float,Float)
todoMenor :: (Float,Float,Float) -> (Float,Float,Float) -> Bool
todoMenor (x,y,z) (f,g,h) = x<f && y<g && z<h 

--3. posicPrimerPar: dada una terna de enteros, devuelve la
--posición del primer número par si es que hay alguno, y
--devuelve 4 si son todos impares.
-- even
posicPrimerPar :: (Int,Int,Int) -> Int
posicPrimerPar (x,y,z) | mod x 2 == 0 = 1
                        | mod y 2 == 0 = 2
                        | mod z 2 == 0 = 3
                        | otherwise = 4

--4. crearPar :: a -> b -> (a, b): crea un par a partir de sus dos
--componentes dadas por separado (debe funcionar para
--elementos de cualquier tipo).
crearPar :: a -> b -> (a, b)
crearPar x y = (x,y)

--5. invertir :: (a, b) -> (b, a): invierte los elementos del par
--pasado como parámetro (debe funcionar para elementos de
--cualquier tipo).
invertir :: (a, b) -> (b, a)
invertir (x, y) = (y, x)

invertir' :: (a, b) -> (b, a)
invertir' par = (segundaCoordenada, primerCoordebada)
    where primerCoordebada = fst par
            segundaCoordenada = snd par
invertir'' :: (a, b) -> (b, a) 
invertir'' par = (x,y)
    where (x,y) = par -- para recursión va a servir
