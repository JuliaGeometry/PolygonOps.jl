var documenterSearchIndex = {"docs":
[{"location":"#PolygonOps.jl","page":"Home","title":"PolygonOps.jl","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"","category":"page"},{"location":"","page":"Home","title":"Home","text":"PolygonOps.inpolygon\nPolygonOps.HaoSun\nPolygonOps.HormannAgathos","category":"page"},{"location":"#PolygonOps.inpolygon","page":"Home","title":"PolygonOps.inpolygon","text":"inpolygon(p, poly)\ninpolygon(p, poly, [::MembershipCheckAlgorithm])\ninpolygon(p, poly, [::MembershipCheckAlgorithm]; in = 1, on = -1, out = 0)\n\ncheck the membership of p in poly where poly is an AbstractVector of AbstractVectors. poly should have the first and last elements equal.\n\nReturns:\n\nin = 1\non = -1\nout = 0\n\nMembershipCheckAlgorithm:\n\nHaoSun()\nHormannAgathos()\n\nDefault is HaoSun() as it has the best performance and works invariant of winding order and self-intersections. However the HaoSun algorithm is new and bugs may be possible. The classic HormannAgathos algorithm is provided, however it is sensitive to self-intersections and winding order so may produce different results.\n\nCustom return values:\n\nThe return logic can be customized to return alternate values and types by specify the in, on, and out keywords. For example, to treat the 'on' and 'in' cases the same and return a Bool: inpolygon(p, poly, in=true, on=true, out=false)\n\nAlgorithm by Hao and Sun (2018): https://doi.org/10.3390/sym10100477\n\nHormann-Agathos (2001) Point in Polygon algorithm: https://doi.org/10.1016/S0925-7721(01)00012-8\n\n\n\n\n\n","category":"function"},{"location":"#PolygonOps.HaoSun","page":"Home","title":"PolygonOps.HaoSun","text":"Algorithm by Hao and Sun (2018): https://doi.org/10.3390/sym10100477\n\n\n\n\n\n","category":"type"},{"location":"#PolygonOps.HormannAgathos","page":"Home","title":"PolygonOps.HormannAgathos","text":"Hormann-Agathos (2001) Point in Polygon algorithm: https://doi.org/10.1016/S0925-7721(01)00012-8\n\n\n\n\n\n","category":"type"},{"location":"#Examples","page":"Home","title":"Examples","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"using PolygonOps\nusing StaticArrays\n\nxv = [ 0.05840, 0.48375, 0.69356, 1.47478, 1.32158, \n        1.94545, 2.16477, 1.87639, 1.18218, 0.27615, \n        0.05840 ]\nyv = [ 0.60628, 0.04728, 0.50000, 0.50000, 0.02015, \n        0.18161, 0.78850, 1.13589, 1.33781, 1.04650, \n        0.60628 ]\n\nxa = 0:0.1:2.3\nya = 0:0.1:1.4\n\npolygon = SVector.(xv,yv)\npoints = vec(SVector.(xa',ya))\n\ninside = [inpolygon(p, polygon; in=true, on=false, out=false) for p in points]\n\nusing Plots\nplot(Tuple.(polygon), legend=false)\nscatter!(Tuple.(points), marker_z=inside)","category":"page"}]
}
