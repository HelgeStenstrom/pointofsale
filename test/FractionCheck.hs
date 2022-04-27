module FractionCheck where

import Test.QuickCheck

hereAmI = putStrLn "Here am I, the QuickCheck file!"

qsExample = quickCheck propFoo

propFoo :: Int -> Int -> Bool 
propFoo x y = x + y == y + x

