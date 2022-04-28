module FractionCheck where

import Fractions
import Test.QuickCheck

hereAmI = putStrLn "Here am I, the QuickCheck file!"

allQuickChecks :: IO ()
allQuickChecks = do
  nt "integers" propCommutativeInt
  nt "fractions" propCommutativeFraction

propCommutativeInt :: Int -> Int -> Bool
propCommutativeInt x y = x + y == y + x

propCommutativeFraction :: Fraction -> Fraction -> Bool
propCommutativeFraction x y = x + y == y + x

propAddFraction = undefined -- What can we say about numbers, without copying the implementation?

-- ======== test support below ======================
nt :: Testable prop => [Char] -> prop -> IO ()
nt s t = do
  putStrLn ("\n" ++ s)
  quickCheck t

fractionWholeGen :: Gen Fraction
fractionWholeGen = do
  Whole <$> arbitrary

fractionFracGen :: Gen Fraction
fractionFracGen = do
  a <- arbitrary
  Frac a <$> arbitrary

fractionGen :: Gen Fraction
fractionGen = do
  a <- arbitrary
  b <- arbitrary
  oneof [return $ Whole a, return $ Frac a b]

instance Arbitrary Fraction where
  arbitrary = fractionGen
