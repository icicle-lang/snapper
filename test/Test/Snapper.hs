{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
module Test.Snapper where

import           Disorder.Core.Tripping (tripping)

import           Snapper

import           P

import           Test.QuickCheck (forAllProperties, quickCheckWithResult)
import           Test.QuickCheck (stdArgs, maxSuccess)
import           Test.QuickCheck.Instances ()


prop_compression_tripping =
  tripping compress decompress

prop_compress_differs bs =
  compress bs /= bs

prop_decompress_garbage bs =
  decompress bs /= Just bs

return []
tests =
  $forAllProperties $ quickCheckWithResult (stdArgs {maxSuccess = 10000})
