module PointOfSaleTest where

import PointOfSale
import Test.HUnit (Test(TestCase, TestList), assertEqual)

-- Can we check what is being printed?
--  Can we check IO ()?
x = fromPos

posTests =
  TestList [testOneItemFound, testAnotherItemFound, testProductNotFound]

testOneItemFound =
  TestCase (assertEqual "price of barcode 12345" "$1.99" (displayText "12345"))

testAnotherItemFound =
  TestCase (assertEqual "price of barcode 45678" "$12.00" (displayText "45678"))

testProductNotFound =
  TestCase
    (assertEqual
       "Product not found"
       "Product not found. Please try again"
       (displayText "99999"))
