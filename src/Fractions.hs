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
  (Whole a) == f = f == Whole a
  f == (Whole a) = numer (simplify f) == a && denom (simplify f) == 1
  f1 == f2 = (a1 == c1) && (b1 == d1)
    where
      (Frac a1 b1) = simplify f1
      (Frac c1 d1) = simplify f2

denom (Whole _) = 1
denom (Frac _ b) = b

numer (Frac a _) = a
numer (Whole n) = n

instance Num Fraction where
  (+) (Whole a) (Whole b) = Whole (a + b)
  (+) (Frac a b) (Frac c d) = simplify (Frac (a * d + b * c) (b * d))
  (+) (Frac n d) f2 = f2 + Frac n d
  (+) (Whole a) f2 = Frac a 1 + f2
  (*) (Whole a) (Whole b) = Whole (a * b)
  (*) (Frac a b) (Frac c d) = Frac (a * c) (b * d)
  (*) f1 (Whole c) = f1 * Frac c 1
  (*) (Whole n) f2 = f2 * Whole n
  abs (Whole n)
    | n < 0 = Whole (-n)
    | otherwise = Whole n
  abs (Frac n d)
    | numer (simplify (Frac n d)) < 0 = Frac (-n) d
    | otherwise = Frac n d
  signum (Whole n) 
    | n < 0 = Whole (-1)
    | otherwise  = Whole 1
  signum (Frac n d)
    | numer (Frac n d) < 0 = Whole (-1)
    | otherwise  = Whole 1
  fromInteger = undefined
  (-) = undefined

simplify :: Fraction -> Fraction
simplify (Frac n d) = Frac nn dd
  where
    factor = gcd n d
    nn = quot n factor
    dd = quot d factor
simplify (Whole n) = Whole n
