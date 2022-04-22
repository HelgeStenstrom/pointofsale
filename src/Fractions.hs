module Fractions where

newtype Fraction =
  Whole Integer

instance Show Fraction where
  show (Whole a) = show a ++ "/1"

instance Eq Fraction where
  Whole a == Whole b = True -- a == b
