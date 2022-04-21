import Test.HUnit
import Lib 

import Fractions

main :: IO ()
-- main = putStrLn "Test suite not yet implemented"
main = do
  runTestTT tests
  return ()

test1 = TestCase (assertEqual "besrivning" 3 3)
test2 = TestCase (assertEqual "besrivning" 3 Lib.threex)

tests = TestList [
    TestLabel "tst1" test1
  , TestLabel "tst2" test2
  ]


f1 = Fraction 3
f2 = Fraction (-5)
