{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
module Test.Snapper where

import           Hedgehog
import           Hedgehog.Gen.QuickCheck

import           Snapper
import           Snapper.Prelude

import           Test.QuickCheck.Instances ()


prop_compression_tripping :: Property
prop_compression_tripping =
  property $
    forAll arbitrary >>=
      tripping `flip` compress `flip` decompress

prop_compress_differs :: Property
prop_compress_differs =
  property $
    forAll arbitrary >>= \bs ->
      compress bs /== bs

prop_decompress_garbage :: Property
prop_decompress_garbage =
  property $
    forAll arbitrary >>= \bs ->
      decompress bs /== Just bs

return []
tests :: IO Bool
tests =
  checkParallel $$(discover)