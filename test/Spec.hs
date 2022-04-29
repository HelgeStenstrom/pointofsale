import FractionSpec
import FractionCheck
import PointOfSaleTest
import Test.HUnit
    ( assertBool, assertEqual, runTestTT, Test(TestList, TestCase) )

import Fractions

main :: IO ()
main = do
  -- runTestTT fractionTests
  runTestTT posTests 
  -- allQuickChecks 
  return ()
