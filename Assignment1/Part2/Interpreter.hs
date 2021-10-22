module Interpreter where

import AbsNumbers

eval :: Exp -> Integer
eval (Num n) = n
eval (Plus n m) = (eval n) + (eval m)
eval (Sub n m) = (eval n) - (eval m)
eval (Times n m) = (eval n) * (eval m)
eval (Div n m) = quot (eval n) (eval m)
eval (Mod n m) = (eval n) `mod` (eval m)
eval (Raised n m) = (eval n) ^ (eval m)
eval (Sqrt n) = floor(sqrt(fromIntegral(eval n)))
eval (Neg n) = (eval n) * (-1)
