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


----------------
-- QQ Arithmetic
----------------
addP :: PP -> PP -> PP
multP :: PP -> PP -> PP
ii_pp :: PP -> II
--addP O m = m
--addP (S n) m = S (addP n m)
addQ :: QQ -> QQ -> QQ
multQ :: QQ -> QQ -> QQ

----------------
-- Normalisation
----------------

normalizeI :: II -> II

----------------------------------------------------
-- Converting between VM-numbers and Haskell-numbers
----------------------------------------------------


----------
-- Testing
----------
main = do
    --let a =
    --let b =
    --let c =
    --let d =
    print $ addN (S (S O)) (S O)
    print $ multN (S (S O)) (S (S (S O)))

    --print $ nbv (II (pp_int i) (pp_int j))
