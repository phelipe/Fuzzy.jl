#TODO: fazer testes das T-normas


#"MIN"
function minimum_value(tmp_strengths::Vector{Float64})

    return minimum(tmp_strengths)

end

#"A-PROD"
function algebraic_product(tmp_strengths::Vector{Float64})

    return prod(tmp_strengths)

end

#"B-DIF"
function bounded_difference(tmp_strengths::Vector{Float64})
    if  tmp_strengths > 1
        val = tmp_strengths[1]
        for i=2:length(tmp_strengths)
            val = max(0.0, val + tmp_strengths[i] - 1)
        end
        return val
    else
        return tmp_strengths[1]
    end
end

#"D-PROD"
function drastic_product(tmp_strengths::Vector{Float64})
    if  tmp_strengths > 1
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

#"E-PROD"
function einstein_product(tmp_strengths::Vector{Float64})
    if  tmp_strengths > 1
        val = tmp_strengths[1]
        for i=2:length(tmp_strengths)
            val = (val * tmp_strengths[i]) / (2 - (val + tmp_strengths[i] - val * tmp_strengths[i]))
        end
        return val
    else
        return tmp_strengths[1]
    end
end

#"H-PROD"
function hamacher_product(tmp_strengths::Vector{Float64})
    if  tmp_strengths > 1
        val = tmp_strengths[1]
        for i=2:length(tmp_strengths)
            val=(val * tmp_strengths[i]) / (val + tmp_strengths[i] - val * tmp_strengths[i])
        end
        return val
    else
        return tmp_strengths[1]
    end
end