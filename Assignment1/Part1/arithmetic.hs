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
  deriving (Eq,Show) -- for equality and printing

-- Rational numbers
data QQ =  QQ II PP
  deriving (Eq,Show) -- for equality and printing

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

-- subtract natural numbers
subN :: NN -> NN -> NN
subN O m = O
subN m O = m
subN (S m) (S n) = subN m n

----------------
-- II Arithmetic
----------------

-- Addition:
addI :: II -> II -> II
addI (II a b) (II c d) = II (addN a c) (addN b d)

-- Multiplication:
multI :: II -> II -> II
multI (II a b) (II c d) = II (multN a c) (multN b d)

-- Subtraction:
subtrI :: II -> II -> II
subtrI (II a b) (II c d) = II (subN a d) (subN b c)

-- Negation:
negI :: II -> II
negI (II a b) = (II b a)

----------------
-- QQ Arithmetic
----------------

addP :: PP -> PP -> PP
addP I m = (T m)
addP (T n) m =  addP n (T m)

----------------
-- Normalisation
----------------

normalizeI :: II -> II
normalizeI (II n O) = (II n O)
normalizeI (II O m) = (II O m)
normalizeI (II (S n) (S m)) = normalizeI (II n m)

----------------------------------------------------
-- Converting between VM-numbers and Haskell-numbers
----------------------------------------------------

-- Precondition: Inputs are non-negative
nn_int :: Integer -> NN
nn_int 0 = O
nn_int n = addN (S O) (nn_int (n - 1))

int_nn :: NN -> Integer
int_nn O = 0
int_nn (S n) = 1 + (int_nn n)

ii_int :: Integer -> II
ii_int 0 = II O O
ii_int n = II (nn_int(n)) O

int_ii :: II -> Integer
int_ii (II O O) = 0
int_ii (II (n) m) = int_nn(n) - int_nn(m)

-- Precondition: Inputs are positive
pp_int :: Integer -> PP
pp_int 1 = I
pp_int n = addP I (pp_int (n - 1))

int_pp :: PP -> Integer
int_pp I = 1
int_pp (T n) = 1 + int_pp (n)

------------------------------
-- Normalisation by Evaluation
------------------------------

nbv :: II -> II
nbv m = ii_int (int_ii m)
----------
-- Testing
----------

main = do
-- Integers: (II i j) represents i-j, (II k l) represents k-l
    let i = 1
    let j = 2
    let k = 3
    let l = 4
    print $ addN (S (S O)) (S O)
    print $ multN (S (S O)) (S (S (S O)))
    print $ addP (T (T (T I))) (T I) -- T = Successor and I = 1
