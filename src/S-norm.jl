# Contains S-norms
# ----------------------------------

"""
	Compute the maximum value of the tmp_strengths vector

    maximum_value(tmp_strengths<:AbstractFloat)
"""
function maximum_value(tmp_strengths::Vector{<:AbstractFloat})
   return maximum(tmp_strengths)
end


"""
	Compute the algebraic sum of the tmp_strengths vector

    algebraic_sum(tmp_strengths<:AbstractFloat)
"""
function algebraic_sum(tmp_strengths::Vector{<:AbstractFloat})
    if  length(tmp_strengths) > 1
        val = tmp_strengths[1]
        for i=2:length(tmp_strengths)
            val = val + tmp_strengths[i] - (val * tmp_strengths[i])
        end
        return val
    else
        return tmp_strengths[1]
    end
end

"""
	Compute the bounded sum of the tmp_strengths vector

    bounded_sum(tmp_strengths<:AbstractFloat)
"""
function bounded_sum(tmp_strengths::Vector{<:AbstractFloat})
    if  length(tmp_strengths) > 1
        val = tmp_strengths[1]
        for i=2:length(tmp_strengths)
            val = min(1.0, val + tmp_strengths[i])
        end
        return val
    else
        return tmp_strengths[1]
    end
end

"""
	Compute the drastic sum of the tmp_strengths vector

    drastic_sum(tmp_strengths<:AbstractFloat)
"""
function drastic_sum(tmp_strengths::Vector{<:AbstractFloat})
    if  length(tmp_strengths) > 1
        val = tmp_strengths[1]
        for i = 2:length(tmp_strengths)
            if min(val, tmp_strengths[i]) == 0.0
                val = max(val, tmp_strengths[i])
            else
                val = 1.0
            end
        end
        return val
    else
        return tmp_strengths[1]
    end
end

"""
	Compute the Einstein sum of the tmp_strengths vector

    einstein_sum(tmp_strengths<:AbstractFloat)
"""
function einstein_sum(tmp_strengths::Vector{<:AbstractFloat})
    if  length(tmp_strengths) > 1
        val = tmp_strengths[1]
        for i=2:length(tmp_strengths)
            val = (val * tmp_strengths[i]) / (1.0 + (val * tmp_strengths[i]))
        end
        return val
    else
        return tmp_strengths[1]
    end
end

"""
	Compute the Hamacher sum of the tmp_strengths vector

    hamacher_sum(tmp_strengths<:AbstractFloat)
"""
function hamacher_sum(tmp_strengths::Vector{<:AbstractFloat})
    if  length(tmp_strengths) > 1
        val = tmp_strengths[1]
        for i=2:length(tmp_strengths)
            val=(val + tmp_strengths[i] - (2 * val * tmp_strengths[i])) / (1- (val * tmp_strengths[i]))
        end
        return val
    else
        return tmp_strengths[1]
    end
end
