import FractionSpec
import Test.HUnit
    ( assertBool, assertEqual, runTestTT, Test(TestList, TestCase) )

import Fractions

main :: IO ()
main = do
  runTestTT fractionTests
  -- TODO: run QuickCheck too. I want to compare the techniques.
  return ()
