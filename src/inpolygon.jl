

abstract type MembershipCheckAlgorithm end

"""
https://www.researchgate.net/publication/328261689_Optimal_Reliable_Point-in-Polygon_Test_and_Differential_Coding_Boolean_Operations_on_Polygons
"""
struct HaoSun <: MembershipCheckAlgorithm end

"""
http://www.sciencedirect.com/science/article/pii/S0925772101000128
"""
struct HormannAgathos <: MembershipCheckAlgorithm end

"""
inpolygon(p, poly)

check the membership of `p` in `poly`. Works invariant of winding order.

Returns:
- in = 1
- on = -1
- out = 0

Based on the algorithm by Hao and Sun :
https://www.researchgate.net/publication/328261689_Optimal_Reliable_Point-in-Polygon_Test_and_Differential_Coding_Boolean_Operations_on_Polygons
"""
function inpolygon(p, poly)
    inpolygon(p, poly, HaoSun())
end

function inpolygon(p, poly, ::HaoSun)
    k = 0

    xp = p[1]
    yp = p[2]

    PT = eltype(p)

    for i = 1:length(poly)-1
        v1 = poly[i][2] - yp
        v2 = poly[i+1][2] - yp

        if v1 < zero(PT) && v2 < zero(PT) || v1 > zero(PT) && v2 > zero(PT)
            continue
        end

        u1 = poly[i][1] - xp
        u2 = poly[i+1][1] - xp

        f = (u1 * v2) - (u2 * v1)

        if v2 > zero(PT) && v1 <= zero(PT)
            if f > zero(PT)
                k += 1
            elseif iszero(f)
                return -1
            end
        elseif v1 > zero(PT) && v2 <= zero(PT)
            if f < zero(PT)
                k += 1
            elseif iszero(f)
                return -1
            end
        elseif iszero(v2) && v1 < zero(PT)
            iszero(f) && return -1
        elseif iszero(v1) && v2 < zero(PT)
            iszero(f) && return -1
        elseif iszero(v1) && iszero(v2)
            if u2 <= zero(PT) && u1 >= zero(PT)
                return -1
            elseif u1 <= zero(PT) && u2 >= zero(PT)
                return -1
            end
        end
    end

    iszero(k % 2) && return 0
    return 1
end

function detq(q1,q2,r)
    (q1[1]-r[1])*(q2[2]-r[2])-(q2[1]-r[1])*(q1[2]-r[2])
end

"""
See: http://www.sciencedirect.com/science/article/pii/S0925772101000128
"The point in polygon problem for arbitrary polygons"
An implementation of Hormann-Agathos (2001) Point in Polygon algorithm
"""
function inpolygon(v, poly, ::HormannAgathos)
    c = false
    r = v.location
    for q1 in poly
        q2 = q1.next
        if q1.location == r
            throw(VertexException())
        end
        if q2.location[2] == r[2]
            if q2.location[1] == r[1]
                throw(VertexException())
            elseif (q1.location[2] == r[2]) && ((q2.location[1] > r[1]) == (q1.location[1] < r[1]))
                throw(EdgeException())
            end
        end
        if (q1.location[2] < r[2]) != (q2.location[2] < r[2]) # crossing
            if q1.location[1] >= r[1]
                if q2.location[1] > r[1]
                    c = !c
                elseif ((detq(q1.location,q2.location,r) > 0) == (q2.location[2] > q1.location[2])) # right crossing
                    c = !c
                end
            elseif q2.location[1] > r[1]
                if ((detq(q1.location,q2.location,r) > 0) == (q2.location[2] > q1.location[2])) # right crossing
                    c = !c
                end
            end
        end
    end
    return c
end
