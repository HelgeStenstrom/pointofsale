module Fractions where

data Fraction =
  Whole Integer | Frac Integer Integer

instance Show Fraction where
  show (Whole a) = show a ++ "/1"
  show (Frac a b) = "wrong"

instance Eq Fraction where
  Whole a == Whole b = a == b
  (Frac a b) == _ = False 
  _ == (Frac c d) = False 

denom (Whole _) = 1
denom (Frac a b) = 4711
