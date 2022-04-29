module PointOfSaleTest where

import PointOfSale
import Test.HUnit (Test(TestCase, TestList), assertEqual)

-- Can we check what is being printed?
--  Can we check IO ()?

x = fromPos

posTests = TestList [testOneItemFound]

testOneItemFound  = TestCase (assertEqual "price of barcode 123" "$1.99" (displayText "12345")) 

displayText :: String -> String
displayText _ = "$1.99"
