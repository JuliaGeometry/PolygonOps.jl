using PolygonOps
using Test
using StaticArrays

edge(p1, p2) = (SVector(p1),SVector(p2))

@testset "inpolygon" begin
    poly1 = SVector{2,Int}[(0,0),(0,10),(10,10),(10,0),(0,0)]
    @test inpolygon(SVector(5,5),poly1) == 1 #in
    @test inpolygon(SVector(-5,-5),poly1) == 0 #out
    @test inpolygon(SVector(0,5),poly1) == -1 #on
    @test inpolygon(SVector(5,10),poly1) == -1 #on
    @test inpolygon(SVector(10,10),poly1) == -1 #on
    @test inpolygon(SVector(0,0),poly1) == -1 #on
end
