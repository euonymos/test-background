module Main (main) where

import Control.Concurrent (threadDelay)
import System.Process (spawnProcess, getPid)

main :: IO ()
main = do
  handle <- spawnProcess "sleep" ["1m"]
  mbPid <- getPid handle
  putStrLn $ "Process is: " <> show mbPid
  threadDelay 3_000_000
  pure ()
