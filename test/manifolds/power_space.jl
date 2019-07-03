using FunManifolds
using Test

include("../utils.jl")

@testset "Power space" begin
    s2 = Sphere(2)

    sphere = (s2,
        [project_point_wrapped(s2, [0., 1., 0.]),
        project_point_wrapped(s2, [1., 0., 0.]),
        project_point_wrapped(s2, [0.2, 0., 1.])])

    generic_manifold_tests(PowerSpace(sphere[1], 3),
        [PowerPt([sphere[2][mod1(i+j, 3)] for j ∈ 1:3]) for i ∈ 1:3],
        "Power space",
        0.0)
end
