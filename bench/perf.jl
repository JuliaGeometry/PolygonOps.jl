using BenchmarkTools
using PolygonOps
using StaticArrays
using Test

circle(t) = SVector(cos(t), sin(t))

circle_poly = map(circle, 0:(2pi/1000000):2pi)

@show length(circle_poly)

using Plots
display(plot(map(x -> x[1], circle_poly),map(x -> x[2], circle_poly)))

# end == begin
push!(circle_poly, circle_poly[1])
@test isinside(SVector(0.1,0),circle_poly) == 1
@test isinside(SVector(0.,2.),circle_poly) == 0
@test isinside(SVector(2.,0.),circle_poly) == 0
@test isinside(SVector(1.,0.),circle_poly) == -1
@test isinside(SVector(0.,-2.),circle_poly) == 0

@benchmark isinside(SVector(0,0),circle_poly)