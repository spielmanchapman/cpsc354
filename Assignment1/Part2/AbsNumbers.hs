-- Haskell data types for the abstract syntax.
-- Generated by the BNF converter.

-- | The abstract syntax of language numbers.

module AbsNumbers where

import Prelude (Integer)
import qualified Prelude as C (Eq, Ord, Show, Read)

data Exp
    = Plus Exp Exp
    | Times Exp Exp
    | Sub Exp Exp
    | Div Exp Exp
    | Num Integer
    | Mod Exp Exp
    | Raised Exp Exp
    | Sqrt Exp
    | Neg Exp
  deriving (C.Eq, C.Ord, C.Show, C.Read)