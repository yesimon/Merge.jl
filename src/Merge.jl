module Merge
import Base: start, next, done, eltype, length
using DataStructures
export merge_sorted

immutable SortedMerger{I}
    keyfunc::Function
    its::Vector{I}
end

function merge_sorted(its, f=identity)
    SortedMerger(f, its)
end

function start(it::SortedMerger)
    el_type = eltype(eltype(it.its))
    if el_type <: AbstractString
        el_type = AbstractString
    end
    h = binary_minheap(Tuple{el_type, Int})
    l = length(it.its)
    its = Vector(l)
    values = Vector{eltype(eltype(it.its))}(l)
    for (i, xs) in enumerate(it.its)
        s = start(xs)
        if done(xs, s)
            continue
        end

        (x, s) = next(xs, s)
        key = it.keyfunc(x)
        values[i] = x
        its[i] = (xs, s)
        push!(h, (key, i))
    end
    (h, its, values)
end

function next(it::SortedMerger, state)
    (h, its, values) = state
    (key, i) = pop!(h)
    next_x = values[i]
    (xs, s) = its[i]
    if !done(xs, s)
        (x, s) = next(xs, s)
        key = it.keyfunc(x)
        its[i] = (xs, s)
        values[i] = x
        push!(h, (key, i))
    end
    (next_x, (h, its, values))
end

function done(it::SortedMerger, state)
    (h, its, values) = state
    isempty(h)
end

end # module
