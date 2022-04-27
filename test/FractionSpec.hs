module FractionSpec
  ( fractionTests
  ) where

import Test.HUnit (Test(TestCase, TestList), assertBool, assertEqual, runTestTT)

import Fractions

import Text.Printf

fractionTests = TestList [wholeTests, fracTests, simplifyTests, operatorTests]

wholeTests =
  TestList
    [ testNotSame
    , testEqual1
    , testEqual2
    , testStringRepWhole
    , testStringRepFrac
    , testWholeDenominator
    , testWholeNumerator
    , testFracDenom
    , testFracNumerator
    , fracEqualsWhole 4
    , fracEqualsWhole 5
    , wholeEqualsFrac 6
    , wholeEqualsFrac 7
    , fracNotEqualsWhole 8
    , wholeNotEqualsFrac 9
    ]

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

exText :: [Char]
exText = "" ++ printf " %d %d" (10 :: Integer) (20 :: Integer)

-- | The denominator of a whole number is 1.
testWholeDenominator =
  TestCase (assertEqual "denom of whole number is 1" 1 (denom (Whole 17)))

testFracDenom =
  TestCase (assertEqual "Getting the denominator" 3 (denom (Frac 5 3)))

testFracNumerator =
  TestCase (assertEqual "Getting the numerator" 5 (numer (Frac 5 3)))

testWholeNumerator =
  TestCase (assertEqual "Getting the numerator" 7 (numer (Whole 7)))

fracTests =
  TestList
    [ fraqEqual 3 4
    , fraqEqual (-7) 13
    , fraqNotEqualDiffNominator 3 4
    , fraqNotEqualDiffNominator 5 6
    , fraqNotEqualDiffDenominator 7 8
    , fraqNotEqualDiffDenominator 9 10
    , fraqsEqual (Frac 3 4) (Frac 300 400)
    , fraqsEqual (Frac 30 40) (Frac 3 4)
    , fraqsEqual (Whole 3) (Frac 30 10)
    , fraqsEqual (Frac 30 10) (Whole 3) 
    ]

fraqEqual :: Integer -> Integer -> Test
fraqEqual n d =
  TestCase
    (assertBool
       (printf "Frac %d %d == Frac %d %d" n d n d)
       (Frac n d == Frac n d))

fraqsEqual :: Fraction -> Fraction -> Test
fraqsEqual f1 f2 =
  TestCase (assertEqual (printf "%s == %s" (show f1) (show f2)) f2 f1)

fraqNotEqualDiffNominator :: Integer -> Integer -> Test
fraqNotEqualDiffNominator n d =
  TestCase
    (assertBool
       (printf "Frac %d %d /= Frac %d %d" (n + 1) d n d)
       (Frac (n + 1) d /= Frac n d))

fraqNotEqualDiffDenominator :: Integer -> Integer -> Test
fraqNotEqualDiffDenominator n d =
  TestCase
    (assertBool
       (printf "Frac %d %d /= Frac %d %d" n (d + 1) n d)
       (Frac n (d + 1) /= Frac n d))

simplifyTests =
  TestList
    [ testSimplifyFrac (Frac 4 2) (Frac 2 1)
    , testSimplifyFrac (Frac 6 9) (Frac 2 3)
    ]

testSimplifyFrac f1 f2 = TestCase (assertEqual "simplify" f2 (simplify f1))

operatorTests = TestList [plusTests, timesTests, absTests]

plusTests =
  TestList
    [ testPlus (Whole 1) (Whole 2) (Whole 3)
    , testPlus (Frac 1 3) (Frac 2 3) (Whole 1)
    , testPlus (Whole 1) (Frac 1 3) (Frac 4 3)
    ]

timesTests =
  TestList
    [ testTimes (Whole (-2)) (Whole 3) (Whole (-6))
    , testTimes (Frac 3 5) (Whole 7) (Frac 21 5)
    , testTimes (Whole 2) (Frac 2 5) (Frac 4 5)
    , testTimes (Frac 2 3) (Frac 5 7) (Frac 10 21)
    ]

absTests =
  TestList
    [ testAbs (Whole (-1)) (Whole 1)
    , testAbs (Frac (-6) 3) (Whole 2)
    , testAbs (Frac 6 3) (Whole 2)
    ]

signumTests = TestList [testSignum (Whole (-3)), testSignum (Frac 2 3)]

testPlus :: Fraction -> Fraction -> Fraction -> Test
testPlus f1 f2 fs = TestCase (assertEqual "plus" fs (f1 + f2))

testTimes :: Fraction -> Fraction -> Fraction -> Test
testTimes f1 f2 fs = TestCase (assertEqual "times" fs (f1 * f2))

testAbs :: Fraction -> Fraction -> Test
testAbs fin fexpected = TestCase (assertEqual "abs" fexpected (abs fin))

testSignum f = TestCase (assertEqual "signum" f (abs f * signum f))
