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
test3 = TestCase (assertEqual "Same integers" (Whole 3) (Whole 3))

test4 = TestCase (assertEqual "string rep" "3/1" (show $ Whole 3))

tests = TestList [
    TestLabel "tst1" test1
  , TestLabel "tst2" test2
  , TestLabel "tst3" test3
  , TestLabel "tst4" test4
  ]


f1 = Whole 3
f2 = Whole (-5)
