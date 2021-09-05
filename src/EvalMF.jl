function eval(membership_function::TriangularMF, x::T) where {T <: Number}
    return maximum([minimum([((x - membership_function.l_vertex) / (membership_function.center - membership_function.l_vertex)), ((membership_function.r_vertex - x) / (membership_function.r_vertex - membership_function.center))]), 0])
end

function mean_at(membership_function::TriangularMF, firing_strength::T) where {T <: Number}
    if firing_strength != 1
        p1 = (membership_function.center - membership_function.l_vertex) * firing_strength + membership_function.l_vertex
        p2 = (membership_function.center - membership_function.r_vertex) * firing_strength + membership_function.r_vertex
        (p1 + p2) / 2
    elseif firing_strength == 1
        return membership_function.center
    end
end

function eval(menbership_function::GaussianMF, x::T) where {T <: Number}
    return exp(- 0.5 * ((x - menbership_function.center) / menbership_function.sigma)^2)    
end

function mean_at(membership_function::GaussianMF, firing_strength::T) where {T <: Number}
    return membership_function.center
end


function eval(membership_function::BellMF, x::T) where {T <: Number}
    return (1 / (1 + abs((x - membership_function.c) / membership_function.a)^(2 * membership_function.b)))
end

function mean_at(membership_function::BellMF, firing_strength::T) where {T <: Number}
    return membership_function.c
end

function eval(membership_function::TrapezoidalMF, x::T) where {T <: Number}
    return  maximum([minimum([((x - membership_function.l_bottom_vertex) / (membership_function.l_top_vertex - membership_function.l_bottom_vertex)), 1, ((membership_function.r_bottom_vertex - x) / (membership_function.r_bottom_vertex - membership_function.r_top_vertex))]), 0])
end

function mean_at(membership_function::TrapezoidalMF, firing_strength::T) where {T <: Number}
    p1 = (membership_function.l_top_vertex - membership_function.l_bottom_vertex) * firing_strength + membership_function.l_bottom_vertex
    p2 = (membership_function.r_top_vertex - membership_function.r_bottom_vertex) * firing_strength + membership_function.r_bottom_vertex
    (p1 + p2) / 2
end


function eval(membership_function::SigmoidMF, x::T) where {T <: Number}
    return  1 / (1 + exp(-membership_function.a * (x - membership_function.c)))
end

function mean_at(membership_function::SigmoidMF, firing_strength::T) where {T <: Number}
    if firing_strength == 1
        p_firing_strength = 0.999
    elseif firing_strength == 0
        p_firing_strength = 0.001
    else
        p_firing_strength = firing_strength
    end

    p1 = -log((1 / p_firing_strength) - 1) / membership_function.a + membership_function.c
    p2 = membership_function.limit
    (p1 + p2) / 2
end