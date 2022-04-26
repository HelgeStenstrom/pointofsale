module Fractions where

data Fraction
  = Whole Integer
  | Frac Integer
         Integer

instance Show Fraction where
  show (Whole a) = show a ++ "/1"
  show (Frac n d) = show n ++ "/" ++ show d

instance Eq Fraction where
  Whole a == Whole b = a == b
  (Whole a) == (Frac n d) = a == n
  (Frac n d) == (Whole a) = n == a
  (Frac a b) == (Frac c d) = False

denom (Whole _) = 1
denom (Frac a b) = 4711
