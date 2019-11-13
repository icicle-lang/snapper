<div align="center">

# Snapper

### Haskell library for compressing / decompressing [snappy](http://google.github.io/snappy) encoded data.

[![Build Status](https://api.travis-ci.com/icicle-lang/snapper.svg?branch=master)](https://travis-ci.com/icicle-lang/snapper)

</div>

This package is much the same as the existing
[snappy](http://hackage.haskell.org/package/snappy) package on Hackage.
The main difference being that it includes the whole Snappy C++ library
so that it does not need to be install via `brew` or similar.

## API

<img src="img/snappy-tom.png" width="240" align="right"/>

Because of the way Snappy is used in the Hadoop ecosystem (i.e. small
length prefixed blocks) we don't have a need for anything fancier than
functions over a strict `ByteString`.

```hs
compress :: Strict.ByteString -> Strict.ByteString

decompress :: Strict.ByteString -> Maybe Strict.ByteString
```
