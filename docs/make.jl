using Documenter, PolygonOps

makedocs(;
    modules=[PolygonOps],
    format=Documenter.HTML(),
    pages=[
        "Home" => "index.md",
    ],
    repo="https://github.com/sjkelly/PolygonOps.jl/blob/{commit}{path}#L{line}",
    sitename="PolygonOps.jl",
    authors="steve <kd2cca@gmail.com>",
    assets=String[],
)

deploydocs(;
    repo="github.com/sjkelly/PolygonOps.jl",
)
