module Fractions where

newtype Fraction =
  Whole Integer
  deriving (Eq)


instance Show Fraction where
  show (Whole a) = show a ++ "/1"