module FractionSpec
  ( wholeTests
  ) where

import Test.HUnit (Test(TestCase, TestList), assertBool, assertEqual, runTestTT)

import Fractions

testNotSame = TestCase (assertBool "Not same integers" (Whole 1 /= Whole 3))

testEqual1 = TestCase (assertBool "Same integers" (Whole 3 == Whole 3))

testEqual2 = TestCase (assertEqual "Same integers" (Whole 3) (Whole 3))

testStringRep = TestCase (assertEqual "string rep" "3/1" (show $ Whole 3))

-- | The denominator of a whole number is 1.
testWholeDenominator =
  TestCase (assertEqual "denom of whole number is 1" 1 (denom (Whole 17)))

wholeTests =
  TestList
    [testNotSame, testEqual1, testEqual2, testStringRep, testWholeDenominator]
