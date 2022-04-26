module FractionSpec
  ( wholeTests
  ) where

import Test.HUnit (Test(TestCase, TestList), assertBool, assertEqual, runTestTT)

import Fractions

testNotSame = TestCase (assertBool "Not same integers" (Whole 1 /= Whole 3))

testEqual1 = TestCase (assertBool "Same integers" (Whole 3 == Whole 3))

testEqual2 = TestCase (assertEqual "Same integers" (Whole 3) (Whole 3))

testStringRepWhole =
  TestCase (assertEqual "string rep Whole 3" "3/1" (show $ Whole 3))

testStringRepFrac =
  TestCase (assertEqual "string rep Frac 5 4" "5/4" (show $ Frac 5 4))

testWholeEqualsToFractionIfDenominatorIsOne =
  TestCase (assertBool "Whole n == Frac n 1" (Whole 4 == Frac 4 1))

testWholeEqualsToFractionIfDenominatorIsOneReversed =
  TestCase (assertBool "Frac n 1 == Whole n" (Frac 3 1 == Whole 3))

fracEqualsWhole n =
  TestCase
    (assertBool
       ("Frac " ++ show n ++ " 1 == Whole " ++ show n)
       (Frac n 1 == Whole n))

fracNotEqualsWhole n =
  TestCase
    (assertBool
       ("Frac " ++ show n ++ " 1 /= Whole " ++ show (n + 1))
       (Frac n 1 /= Whole (n + 1)))

wholeEqualsFrac n =
  TestCase
    (assertBool
       ("Whole " ++ show n ++ " == Frac " ++ show n ++ " 1")
       (Whole n == Frac n 1))

wholeNotEqualsFrac n =
  TestCase
    (assertBool
       ("Whole " ++ show (n + 1) ++ " /= Frac " ++ show n ++ " 1")
       (Whole (n + 1) /= Frac n 1))

-- | The denominator of a whole number is 1.
testWholeDenominator =
  TestCase (assertEqual "denom of whole number is 1" 1 (denom (Whole 17)))

wholeTests =
  TestList
    [ testNotSame
    , testEqual1
    , testEqual2
    , testStringRepWhole
    , testStringRepFrac
    , testWholeDenominator
    , fracEqualsWhole 4
    , fracEqualsWhole 5
    , wholeEqualsFrac 6
    , wholeEqualsFrac 7
    , fracNotEqualsWhole 8
    , wholeNotEqualsFrac 9
    ]

exampl = Frac 3 4 == Frac 5 6
