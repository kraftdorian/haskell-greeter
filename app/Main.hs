module Main where

import qualified Greeter (greet)
import System.Environment (getArgs)
import Control.Exception (IOException, catch)

tryGreeting :: IO ()
tryGreeting = do
  (who:_) <- getArgs
  putStrLn $ Greeter.greet who

main :: IO ()
main = tryGreeting `catch` handler
  where
    handler :: IOException -> IO ()
    handler e = putStrLn "Who shall I greet? :-)"