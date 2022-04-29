module FractionCheck where

import Fractions
import Test.QuickCheck

hereAmI = putStrLn "Here am I, the QuickCheck file!"

allQuickChecks :: IO ()
allQuickChecks = do
  nt "integers" propCommutativeInt
  nt "fractions" propCommutativeFraction
  nt "ordering" propFracOrder

propCommutativeInt :: Int -> Int -> Bool
propCommutativeInt x y = x + y == y + x

propCommutativeFraction :: Fraction -> Fraction -> Bool
propCommutativeFraction x y = x + y == y + x

propAddFraction = undefined -- What can we say about numbers, without copying the implementation?

propFracOrder :: Fraction -> Bool
propFracOrder f1 = f1 <= (f1 + Whole 1)


-- TODO: Write tests for Fractional

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
  Frac a <$> arbitrary `suchThat` (/= 0)

fractionGen :: Gen Fraction
fractionGen = do
  a <- arbitrary
  b <- arbitrary `suchThat` (/= 0)
  oneof [return $ Whole a, return $ Frac a b]

instance Arbitrary Fraction where
  arbitrary = fractionGen
