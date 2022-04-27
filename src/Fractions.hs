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
  (Frac a b) == (Frac c d) = (a == c) && (b == d)

denom (Whole _) = 1
denom (Frac _ b) = b

numer (Frac a _) = a
numer (Whole n) = n

instance Num Fraction where
  (+) = undefined
  (*) = undefined
  abs = undefined
  signum = undefined
  fromInteger = undefined
  (-) = undefined

simplify :: Fraction -> Fraction
simplify (Frac n d) = Frac nn dd
  where
    factor = gcd n d
    nn = quot n factor
    dd = quot d factor
simplify (Whole n) = Whole n
