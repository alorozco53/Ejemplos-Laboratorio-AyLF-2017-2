{-# LANGUAGE FlexibleInstances #-}
{-- Práctica 3
-- Autómatas y Lenguajes Formales
-- 2017-2
-- Prof: Noé Salomón Hernández Sánchez
-- Ayudante: Albert Manuel Orozco Camacho
-- Ayudante: Cenobio Moisés Vázquez Reyes
-- Version: 0.1
-- Author1: AlOrozco53
-- Author2: <NOMBRE_DE_LOS_INTEGRANTES_DEL_EQUIPO>
--}

module TM where

-- | Basic types
type Simbolo = Char
type Estado = [Char]
type Alfabeto = [Simbolo]

-- | Ejercicio 1, TM motion values
-- data Movimiento = ... deriving (Show, Eq)

-- | Ejercicio 2, transition function type alias
-- type Delta = ...

-- | Turing machine structure
data MaqT = MaqT { q :: [Estado],  -- conjunto de estados
                   q0 :: Estado,   -- estado inicial
                   qf :: Estado,   -- estado de aceptación
                   qr :: Estado,   -- estado de rechazo
                   s :: Alfabeto,  -- alfabeto de entrada
                   g :: Alfabeto   -- alfabeto de cinta
                 } deriving Show

-- | Turing machine definition
type MT = (MaqT, Delta)


-- | Show functions for standard Turing Machines
pintaEstados :: [Estado] -> String
pintaEstados [] = ""
pintaEstados (l:le) = l ++ "  " ++ pintaEstados le

pintaEstado :: Estado -> String
pintaEstado e = e ++ ""

pintaAlfabeto :: Alfabeto -> String
pintaAlfabeto [] = ""
pintaAlfabeto (l:la) = [l] ++ " " ++ pintaAlfabeto la

-- | Auxiliar function to produce the cross product between
-- | a set of states and an alphabet
generaPares :: [Estado] -> Alfabeto -> [(Estado, Simbolo)]
generaPares le ls = [(e, s)| e <- le, s <- ls]

-- | Show functions for a TM delta function
pintaDeltaAux :: Delta -> [(Estado, Simbolo)] -> String
pintaDeltaAux _ [] = "\n"
pintaDeltaAux t ((e, s):xs) =
  case t e s of
    -- ("qr", s', m) -> pintaDeltaAux t xs
      (e', s', m) -> "                        d " ++
                     e ++ " " ++ [s] ++ " = " ++ " " ++e' ++
                     " " ++ [s'] ++ " " ++ show m ++ "\n" ++ pintaDeltaAux t xs

pintaDelta :: [Estado] -> Alfabeto -> Delta -> String
pintaDelta le ls t = pintaDeltaAux t (generaPares le ls)


instance Show MT where
  show (m, d) = "\nEstados:: "
                ++ pintaEstados (q m) ++ "\n" ++
                "\nEstado Inicial:: "
                ++ pintaEstado (q0 m) ++ "\n" ++
                "\nEstado de Aceptación:: "
                ++ pintaEstado (qf m) ++ "\n" ++
                "\nEstado de Rechazo:: "
                ++ pintaEstado (qr m) ++ "\n" ++
                "\nAlfabeto de Entrada:: "
                ++ pintaAlfabeto (s m) ++ "\n" ++
                "\nAlfabeto de la Cinta:: "
                ++ pintaAlfabeto (g m) ++ "\n" ++
                "\nFuncion de Transicion::\n"
                ++ pintaDelta (q m) (g m) d

-- | Ejercicio 3, TM that accepts binary strings with even number of 0's
tmPares :: MT
tmPares = error "to be implemented..."

-- | Ejercicio 4, TM for a^n b^n c^n
tmanbncn :: MT
tmanbncn = error "to be implemented..."

-- | Configuration-useful types
type Cadena = [Simbolo]
type Configuracion = (Estado, Cadena, Int)

-- | This function takes a string str, an integer i, and a symbol s
-- | and substitutes s in the i-th position of str
sustituye :: Cadena -> Int -> Simbolo -> Cadena
sustituye [] _ _ = []
sustituye (w:ws) 0 a = a:ws
sustituye (w:ws) n a
  | n < 0 = error "invalid index!"
  | otherwise = w: sustituye ws (n-1) a

-- | Ejercicio 5, delta function
delta :: Delta -> Configuracion -> Configuracion
delta = error "to be implemented..."

-- | Closure for delta function
deltaEstrella :: MT -> Configuracion -> Bool
deltaEstrella (mt, d) (q, w, n)
  | q == qf mt = True
  | q == qr mt = False
  | otherwise = deltaEstrella (mt, d) (delta d (q,w,n))

-- | Ejercicio 6, decides if the given string is accepted by the given TM
aceptaCadena :: MT -> Cadena -> Bool
aceptaCadena = error "to be implemented..."

-- | Auxiliar for Kleene star operation
kln :: Alfabeto -> Int -> [Cadena]
kln s 0 = [" "]
kln s n
  | n < 0 = error "invalid index!"
  | otherwise = [a:w | a <- s , w <- kln s (n-1)]

-- | Kleene star of an alphabet
klns :: Alfabeto -> [Cadena]
klns s = concat [kln s n | n <- [0..] ]

-- | Ejercicio 7, lazy construction of the language accepted by a TM
lenguajeAceptado :: MT -> [Cadena]
lenguajeAceptado = error "to be implemented..."
