# PolygonOps

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://juliageometry.github.io/PolygonOps.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://juliageometry.github.io/PolygonOps.jl/dev)
[![Build Status](https://travis-ci.com/juliageometry/PolygonOps.jl.svg?branch=master)](https://travis-ci.com/juliageometry/PolygonOps.jl)
[![Codecov](https://codecov.io/gh/juliageometry/PolygonOps.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/juliageometry/PolygonOps.jl)

The objective of this package is to provide a set of generic polygon operations. There are two assumptions: 
 - the container and points are both vector-like.
 - the first and last elements are equal. 
 
This should provide generic implementations portable and extensible for packages such as GeometryTypes, GeometryBasics, and JuliaGeo.

Please see the [docs](https://juliageometry.github.io/PolygonOps.jl/stable) for a list of exported functions.

Implements:
  - point-in-polygon
  - signed area (shoelace algorithm)
  - centroid

Planned:
  - simplification
  - booleans (ported from PolygonClipping.jl)
  - offset/insetting
