--Clase 1 Programación Funcional 2022 - Profesor: Mariano Rean
suma x y = x + y
doble x = 2 * x
producto x y = x * y
cuadrado x = producto x x

norma :: (Float, Float) -> Float  --Definimos el tipo de la función para restringir la función
norma (x,y) = sqrt (cuadrado x + cuadrado y)

--Guardas
absoluto x | x >= 0 = x
            | x < 0 = -x
--Otra manera de definir Guardas
absoluto2 x | x >= 0 = x
            | otherwise = -x 
