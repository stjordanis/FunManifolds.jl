__precompile__()

"""
Main module for `FunManifolds.jl` -- a Julia package for
differential geometry (also functional).
"""
module FunManifolds

using Interpolations
using Manifolds
using ManifoldsBase
using Markdown: @doc_str
using QuadGK

import Base: +, -, *, isapprox

import ManifoldsBase:
    allocate,
    allocate_result,
    allocate_result_type,
    allocation_promotion_function,
    array_value,
    base_manifold,
    check_manifold_point,
    check_manifold_point__transparent,
    check_tangent_vector,
    decorated_manifold,
    decorator_transparent_dispatch,
    default_decorator_dispatch,
    distance,
    embed,
    embed!,
    exp,
    exp!,
    exp!__intransparent,
    geodesic,
    # TODO: uncomment the import if `flat!` goes to ManifoldsBase
    # flat!__intransparent,
    get_basis,
    get_coordinates,
    get_coordinates!,
    get_embedding,
    get_vector,
    get_vector!,
    get_vectors,
    injectivity_radius,
    inner,
    inner__intransparent,
    is_manifold_point,
    is_tangent_vector,
    inverse_retract,
    inverse_retract!,
    log,
    log!,
    manifold_dimension,
    mid_point,
    mid_point!,
    number_eltype,
    number_of_coordinates,
    project,
    project!,
    representation_size,
    retract,
    retract!,
    shortest_geodesic,
    vector_transport_direction,
    vector_transport_direction!,
    vector_transport_to,
    vector_transport_to!,
    zero_tangent_vector,
    zero_tangent_vector!

import Manifolds: zero_vector



mutable struct GeneralParams
    quad_rel_tol::Union{Real,Nothing}
    quad_abs_tol::Union{Real,Nothing}
end

const global PARAMS = GeneralParams(nothing, nothing)

function rtoldefault(M::Manifold, x1, x2)
    return 1.e-8
end

function atoldefault(M::Manifold, x1, x2)
    return 0.0
end

function concretize_tols(M::Manifold, x1, x2; reltol = nothing, abstol = nothing)
    rtol = if reltol === nothing
        rtoldefault(M.M, x1, x2)
    else
        reltol
    end

    atol = if abstol === nothing
        atoldefault(M.M, x1, x2)
    else
        abstol
    end

    return (rtol, atol)
end

include("FunctionCurve.jl")
include("functional_transformations.jl")

export FunctionCurveSpace

end #module
