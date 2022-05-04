module PointOfSale where

import Control.Monad (forever)

fromPos = "From the PointOfSale.hs file"

displayText :: String -> String
displayText bc
  | bc == "12345" = "$1.99"
  | bc == "45678" = "$12.00"
  | otherwise = "Product not found. Please try again"

iteration = do
  bc <- getLine
  putStr $ displayText bc
  putStr "\n"
  return ()

main :: IO ()
main = forever $ do iteration
-- Hur kan en funktion "komma ihåg"?

