# Contains various membership function types
# ------------------------------------------

"""	 Membership function type
"""
abstract type MF end


"""	 Triangular membership function type

    TriangularMF(l_vertex, center, r_vertex)

    Properties
    ----------
    `l_vertex`, `center` and `r_vertex` are the vertices of the triangle, in order
"""
mutable struct TriangularMF <: MF
    l_vertex::Real
    center::Real
    r_vertex::Real

    function TriangularMF(l_vertex::Real, center::Real, r_vertex::Real)
        if l_vertex <= center <= r_vertex
            new(l_vertex::Real, center::Real, r_vertex::Real)
        else
            error("invalid vertices")
        end
    end
end


"""
Gaussian membership function type

    GaussianMF(center, sigma)

    Properties
    ----------
    `center` is the center of the distribution
    `sigma` determines width of the distribution

"""
mutable struct GaussianMF <: MF
    center::Real
    sigma::Real

    function GaussianMF(center::Real, sigma::Real)
        new(center::Real, sigma::Real)
    end
end

"""
    Generalised Bell membership function type

    BellMF(a, b, c)

    Properties
    ----------
    `a`, `b` and `c` the usual bell parameters with `c` being the center

"""
mutable struct BellMF <: MF
    a::Real
    b::Real
    c::Real

    function BellMF(a::Real, b::Real, c::Real)
        new(a::Real, b::Real, c::Real)
    end
end

"""
    Trapezoidal membership function type

    TrapezoidalMF(l_bottom_vertex, l_top_vertex, r_top_vertex, r_bottom_vertex)

    Properties
    ----------
    `l_bottom_vertex`, `l_top_vertex`, `r_top_vertex` and `r_bottom_vertex` are the vertices of the trapezoid, in order
"""
mutable struct TrapezoidalMF <: MF
    l_bottom_vertex::Real
    l_top_vertex::Real
    r_top_vertex::Real
    r_bottom_vertex::Real

    function TrapezoidalMF(l_bottom_vertex::Real, l_top_vertex::Real, r_top_vertex::Real, r_bottom_vertex::Real)
        if l_bottom_vertex <= l_top_vertex <= r_top_vertex <= r_bottom_vertex
            new(l_bottom_vertex::Real, l_top_vertex::Real, r_top_vertex::Real, r_bottom_vertex::Real)
        else
            error("invalid vertices")
        end
    end
end

"""
    Sigmoid membership function type

    SigmoidMF(a, c, limit)

    Properties
    ----------
    `a` controls slope
    `c` is the crossover point
    `limit` sets the extreme limit
"""
mutable struct SigmoidMF <: MF
    a::Real
    c::Real
    limit::Real

    function SigmoidMF(a::Real, c::Real, limit::Real)
        if (a > 0 && limit > c) || (a < 0 && limit < c)
            new(a::Real, c::Real, limit::Real)
        else
            error("invalid parameters")
        end
    end
end
