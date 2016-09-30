module Main where

import Network.HTTP.Simple

import Lib
import Yesod

data Piggies = Piggies

instance Yesod Piggies

mkYesod "Piggies" [parseRoutes|
  / HomeR GET
|]

getHomeR =
  let fun = "hi"::String in
  defaultLayout $ do
    setTitle "Minimal Multifile"
    [whamlet|
      #{fun},
      Welcome to the Pigsty!
    |]

main = warpDebug 3000 Piggies
