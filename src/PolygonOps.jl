module PolygonOps

export inpolygon

"""
    inpolygon(p, poly)

check the membership of `p` in `poly`. Works invariant of winding order.

Returns:
    - in = 1
    - on = -1
    - out = 0

Based on the algorithm by Hao, et. al. :
https://www.researchgate.net/publication/328261689_Optimal_Reliable_Point-in-Polygon_Test_and_Differential_Coding_Boolean_Operations_on_Polygons
"""
function inpolygon(p, poly)
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

end # module
