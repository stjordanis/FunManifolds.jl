using FunManifolds
using Test
using ForwardDiff
using StaticArrays

include("utils.jl")

@testset "FunManifolds tests" begin
    include("manifolds/FunctionCurve.jl")
end
