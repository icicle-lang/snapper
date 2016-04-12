import           Disorder.Core.Main

import qualified Test.Snapper

main :: IO ()
main =
  disorderMain [
      Test.Snapper.tests
    ]
