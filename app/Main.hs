module Main where

import qualified Greeter (greet)
import qualified System.Environment (getArgs)

main :: IO ()
main = do
  (who:_) <- System.Environment.getArgs
  putStrLn $ Greeter.greet who