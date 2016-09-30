module Main where

import Data.Foldable
import Network.HTTP.Simple
import Data.String.Conversions (cs)

import Lib
import Yesod

data Piggies = Piggies

instance Yesod Piggies

mkYesod "Piggies" [parseRoutes|
  / HomeR GET
|]

getHomeR = do
  b <- httpLBS "http://example.com"
  let c = (cs $ fold b) :: String

  defaultLayout $ do
    setTitle "Minimal Multifile"
    [whamlet|
      #{c},
      Welcome to the Pigsty!
    |]

main = warpDebug 3000 Piggies
