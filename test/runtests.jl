using Merge
using Base.Test

a = [1, 2, 5, 7, 8, 11]
b = [1, 4, 5, 6, 9, 10, 12, 16]
expected = [1, 1, 2, 4, 5, 5, 6, 7, 8, 9, 10, 11, 12, 16]
@test collect(merge_sorted([a; b])) == expected
@test collect(merge_sorted([a; b], x -> x * -1)) == reverse(expected)

a = ["abcd", "acbd", "bcad", "db", "dbac", "dcab"]
b = ["abcde", "acbdf", "baad", "cabd", "dba", "dc"]
c = ["bbcde", "cfbdf", "daad", "dabd", "dba", "ec"]
expected = sort([a; b; c])
@test collect(merge_sorted(Vector{ASCIIString}[a, b, c])) == expected

a = [1, 2, 7]
b = []
@test collect(merge_sorted(Array[a, b])) == [1, 2, 7]

a = []
b = [2, 5, 8]
@test collect(merge_sorted(Array[a, b])) == [2, 5, 8]

a = []
b = []
@test collect(merge_sorted(Array[a, b])) == []

a = [1, 2, 7]
b = []
c = []
d = [2, 5, 8]
e = [100]
f = []
@test collect(merge_sorted(Array[a, b, c, d, e, f])) == [1, 2, 2, 5, 7, 8, 100]
