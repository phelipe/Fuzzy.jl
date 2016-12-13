# Contains T-norms
# ----------------------------------
"""
	Compute the minimum value of the tmp_strengths vector

    minimum_value(tmp_strengths<:AbstractFloat)
"""
function minimum_value{T<:AbstractFloat}(tmp_strengths::Vector{T})
    return minimum(tmp_strengths)
end


"""
	Compute the algebraic product of the tmp_strengths vector

    algebraic_product(tmp_strengths<:AbstractFloat)
"""
function algebraic_product{T<:AbstractFloat}(tmp_strengths::Vector{T})
    return prod(tmp_strengths)
end

"""
	Compute the bounded difference of the tmp_strengths vector

    bounded_difference(tmp_strengths<:AbstractFloat)
"""
function bounded_difference{T<:AbstractFloat}(tmp_strengths::Vector{T})
    if  length(tmp_strengths) > 1
        val = tmp_strengths[1]
        for i=2:length(tmp_strengths)
            val = max(0.0, val + tmp_strengths[i] - 1.0)
        end
        return val
    else
        return tmp_strengths[1]
    end
end

"""
	Compute the drastic product of the tmp_strengths vector

    drastic_product(tmp_strengths<:AbstractFloat)
"""
function drastic_product{T<:AbstractFloat}(tmp_strengths::Vector{T})
    if  length(tmp_strengths) > 1
        val = tmp_strengths[1]
        for i = 2:length(tmp_strengths)
            if max(val, tmp_strengths[i]) == 1.0
                val = min(val, tmp_strengths[i])
            else
                val = 0.0
            end
        end
        return val
    else
        return tmp_strengths[1]
    end
end

"""
	Compute the Einstein product of the tmp_strengths vector

    einstein_product(tmp_strengths<:AbstractFloat)
"""
function einstein_product{T<:AbstractFloat}(tmp_strengths::Vector{T})
    if  length(tmp_strengths) > 1
        val = tmp_strengths[1]
        for i=2:length(tmp_strengths)
            val = (val * tmp_strengths[i]) / (2.0 - (val + tmp_strengths[i] - val * tmp_strengths[i]))
        end
        return val
    else
        return tmp_strengths[1]
    end
end

"""
	Compute the Hamacher product of the tmp_strengths vector

    hamacher_product(tmp_strengths<:AbstractFloat)
"""
function hamacher_product{T<:AbstractFloat}(tmp_strengths::Vector{T})
    if  length(tmp_strengths) > 1
        val = tmp_strengths[1]
        for i=2:length(tmp_strengths)
            val=(val * tmp_strengths[i]) / (val + tmp_strengths[i] - val * tmp_strengths[i])
        end
        return val
    else
        return tmp_strengths[1]
    end
end
