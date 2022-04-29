module PointOfSale where

fromPos = "From the PointOfSale.hs file"

displayText :: String -> String
displayText bc 
 | bc == "12345" = "$1.99"
 | bc == "45678" = "$12.00"
 | otherwise  = "Product not found. Please try again"

