Snapper
=======

Haskell library for compressing / decompressing
[snappy](http://google.github.io/snappy) encoded data.

![Snappy Tom - Chunky Fish with Flaked Snapper](img/snappy-tom.png)

This package is much the same as the existing
[snappy](http://hackage.haskell.org/package/snappy) package on Hackage.
The main difference being that it includes the whole Snappy C++ library
so that it does not need to be install via `brew` or similar.

## API

Because of the way Snappy is used in the Hadoop ecosystem (i.e. small
length prefixed blocks) we don't have a need for anything fancier than
functions over a strict `ByteString`.

```hs
compress :: Strict.ByteString -> Strict.ByteString

decompress :: Strict.ByteString -> Strict.ByteString
```
