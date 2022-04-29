module PointOfSale where

fromPos = "From the PointOfSale.hs file"

displayText :: String -> String
displayText bc 
 | bc == "12345" = "$1.99"
 | otherwise  = "$12.00"

