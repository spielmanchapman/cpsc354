module Interpreter where

import AbsNumbers

eval :: Exp -> Integer
eval (Num n) = n
eval (Plus n m) = (eval n) + (eval m)
eval (Times n m) = (eval n) * (eval m)
eval (Div n m) = (eval n) / (eval m)
eval (Sub n m) = (eval n) - (eval m)
eval (Mod n m) = (eval n) % (eval m)
eval (Raised n m) = (eval n) ^ (eval m)
eval (Sqrt n) = float(sqrt(eval n))
eval (Neg n) = (-1) * (eval n)

eval (addP n m) = (eval n) + (eval m)
