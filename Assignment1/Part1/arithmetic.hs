-- A Virtual Machine (VM) for Arithmetic (template)

-----------------------
-- Data types of the VM
-----------------------

-- Natural numbers
data NN = O | S NN
  deriving (Eq,Show) -- for equality and printing

-- Integers
data II = II NN NN
  deriving (Eq,Show) -- for equality and printing

-- Positive integers (to avoid dividing by 0)
data PP = I | T PP

-- Rational numbers
data QQ =  QQ II PP

------------------------
-- Arithmetic on the  VM
------------------------

----------------
-- NN Arithmetic
----------------

-- add natural numbers
addN :: NN -> NN -> NN
addN O m = m
addN (S n) m = S (addN n m)

-- multiply natural numbers
multN :: NN -> NN -> NN
multN O m = O
multN (S n) m = addN (multN n m) m

----------------
-- II Arithmetic
----------------

addI :: II -> II -> II
addI 0 m = m

----------------
-- QQ Arithmetic
----------------
addP :: PP -> PP -> PP
addP O m = m


multP :: PP -> PP -> PP
multP O m = m


--ii_pp :: PP -> II
--addI O m = m


--addP O m = m
--addP (S n) m = S (addP n m)

addQ :: QQ -> QQ -> QQ
addQ O m = m


multQ :: QQ -> QQ -> QQ
multQ O m = m


----------------
-- Normalisation
----------------

normalizeI :: II -> II
nbv :: II -> II

----------------------------------------------------
-- Converting between VM-numbers and Haskell-numbers
----------------------------------------------------

nn_int :: Integer -> NN
int_nn :: NN->Integer
ii_int :: Integer -> II
int_ii :: II -> Integer
pp_int :: Integer -> PP
int_pp :: PP->Integer
float_qq :: QQ -> Float

----------
-- Testing
----------
main = do
    let a = 3
    let b = 4
    let c = 5
    let d = 2
    print $ addN (S (S O)) (S O)
    print $ multN (S (S O)) (S (S (S O)))

    print $ nbv (II (pp_int a) (pp_int b))
