import FractionSpec
import Test.HUnit
    ( assertBool, assertEqual, runTestTT, Test(TestList, TestCase) )

import Fractions

main :: IO ()
main = do
  runTestTT wholeTests
  return ()
