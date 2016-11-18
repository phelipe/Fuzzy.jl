

#"MAX"
function maximum_value{T<:AbstractFloat}(tmp_strengths::Vector{T})
   return max(tmp_strengths)
end


#"A-SUM"
function algebraic_sum{T<:AbstractFloat}(tmp_strengths::Vector{T})
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

#"B-SUM"
function bounded_sum{T<:AbstractFloat}(tmp_strengths::Vector{T})
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

#"D-SUM"
function drastic_sum{T<:AbstractFloat}(tmp_strengths::Vector{T})
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

#"E-SUM"
function einstein_sum{T<:AbstractFloat}(tmp_strengths::Vector{T})
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

#"H-SUM"
function hamacher_sum{T<:AbstractFloat}(tmp_strengths::Vector{T})
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
