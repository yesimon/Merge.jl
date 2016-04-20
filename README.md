Merge
=====

[![Build Status](https://travis-ci.org/yesimon/Merge.jl.svg?branch=master)](https://travis-ci.org/yesimon/Merge.jl)
[![Coverage Status](https://coveralls.io/repos/yesimon/Merge.jl/badge.svg?branch=master)](https://coveralls.io/r/yesimon/Merge.jl?branch=master)

A simple package to merge sorted iterators using a heap.

```julia
using Merge

a = ["a", "c", "f"]
b = ["b", "e", "g"]
for line in merge_sorted(Array[a, b])
    println(line)
end
```
