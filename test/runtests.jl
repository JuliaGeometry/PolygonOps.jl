using PolygonOps
using Test
using StaticArrays

edge(p1, p2) = (SVector(p1),SVector(p2))

@testset "inpolygon" begin
    poly1 = SVector{2,Int}[(0,0),(0,10),(10,10),(10,0),(0,0)]

    @testset "Hao Sun" begin
        algo = HaoSun()
        for poly in (poly1, reverse(poly1))
            @test inpolygon(SVector(5,5),poly, algo) == 1 #in
            @test inpolygon(SVector(-5,-5),poly, algo) == 0 #out
            @test inpolygon(SVector(0,5),poly, algo) == -1 #on
            @test inpolygon(SVector(5,10),poly, algo) == -1 #on
            @test inpolygon(SVector(10,10),poly, algo) == -1 #on
            @test inpolygon(SVector(0,0),poly, algo) == -1 #on
        end
    end
    @testset "Hormann Agathos" begin
        algo = HormannAgathos()

        poly = reverse(poly1)
        @test inpolygon(SVector(5,5),poly, algo) == 1 #in
        @test inpolygon(SVector(-5,-5),poly, algo) == 0 #out
        @test_broken inpolygon(SVector(0,5),poly, algo) == -1 #on
        @test inpolygon(SVector(5,10),poly, algo) == -1 #on
        @test inpolygon(SVector(10,10),poly, algo) == -1 #on
        @test inpolygon(SVector(0,0),poly, algo) == -1 #on
    end
end
