import           Hedgehog.Main

import qualified Test.Snapper

main :: IO ()
main =
  defaultMain [
      Test.Snapper.tests
    ]
