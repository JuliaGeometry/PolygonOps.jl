using Documenter, PolygonOps

makedocs(;
    modules=[PolygonOps],
    format=Documenter.HTML(),
    pages=[
        "Home" => "index.md",
    ],
    repo="https://github.com/juliageometry/PolygonOps.jl/blob/{commit}{path}#L{line}",
    sitename="PolygonOps.jl",
    authors="steve <kd2cca@gmail.com>",
    assets=String[],
)

deploydocs(;
    repo="github.com/juliageometry/PolygonOps.jl",
)
