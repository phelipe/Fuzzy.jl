# Contains evaluation functions
# ----------------------------------
"""
	 Evaluates the FIS

	eval_fis(fis, input_values,defuzz_method = "WTAV")

	 Parameters
	 ----------
	 `fis` is the inference system to evaluate
	 `input_values` is a Vector of inputs
	 `defuzz_method` is the method for defuzzification, see defuzz function definition

"""
function eval_fis{T<:AbstractFloat}(fis::FISMamdani, input_values::Vector{T},defuzz_method = "WTAV")
    if length(input_values)!= length(fis.input_mfs_dicts)
        error("The system input has dimension $(length(fis.input_mfs_dicts)) not $(length(input_values))")
    else
        firing_strengths = AbstractFloat[]
    	for rule in fis.rules
    		tmp_strengths = AbstractFloat[]
    		for i in 1:length(rule.input_mf_names)
    			push!(tmp_strengths, fis.input_mfs_dicts[i][rule.input_mf_names[i]].eval(input_values[i]))
    		end
    			push!(firing_strengths, firing(tmp_strengths,rule.firing_method ))
    	end
    	defuzz(firing_strengths, fis.rules, fis.output_mfs_dicts, defuzz_method)
    end
end

"""
	 Evaluates the FIS

	 eval_fis(fis, input_values)

	 Parameters
	 ----------
	 `fis` is the inference system to evaluate
	 `input_values` is a Vector of inputs

"""
function eval_fis{T<:AbstractFloat}(fis::FISSugeno,	input_values::Vector{T})
    if length(input_values)!= length(fis.input_mfs_dicts)
        error("The system input has dimension $(length(fis.input_mfs_dicts)) not $(length(input_values))")
    else
    	firing_strengths = AbstractFloat[]
    	for rule in fis.rules
    		tmp_strengths = AbstractFloat[]
    		for i in 1:length(rule.input_mf_names)
    			push!(tmp_strengths, fis.input_mfs_dicts[i][rule.input_mf_names[i]].eval(input_values[i]))
    		end
    			push!(firing_strengths, firing(tmp_strengths,rule.firing_method ))
    	end

    	push!(input_values, 1)
    	n_firing_strengths = firing_strengths / sum(firing_strengths)
        out=zeros(length(fis.rules[1].output_mf))
        for i = 1: length(out)
            for j = 1:length(fis.rules)
    		    out[i] += n_firing_strengths[j] * dot(fis.rules[j].output_mf[i] , input_values)
    	    end
        end
    	pop!(input_values)
    	return out
    end
end

"""
	Defuzzifies the output using the given firing strengths

	defuzz(firing_strengths, rules, output_mfs_dict, defuzz_method)

	Parameters
	 ----------
	`firing_strengths` is a Vector of firing strengths
	    one for each output membership function
	`rules` is a Vector of Rule
	`output_mfs_dicts` is a Vector of Dict of output membership functions
	`defuzz_method` is the method for defuzzification
	 		"MOM" - Mean of Maximum
	 		"WTAV" - Weighted Average
"""
function defuzz(firing_strengths::Vector{AbstractFloat}, rules::Vector{Rule},	output_mfs_dicts::Array{Dict{AbstractString, MF}}, defuzz_method::AbstractString)

	if defuzz_method == "MOM"
		max_firing_index = indmax(firing_strengths)
		result = AbstractFloat[]
		for i in 1: length(rules[max_firing_index].output_mf)
			max_fired_mf_name = rules[max_firing_index].output_mf[i]
			push!(result,output_mfs_dicts[i][max_fired_mf_name].mean_at(maximum(firing_strengths)))
		end
		return result
	elseif defuzz_method == "WTAV"
        out=AbstractFloat[]
        for i in 1:length(rules[1].output_mf)
		mean_vec = AbstractFloat[]
		    for j in 1:length(rules)
			    push!(mean_vec, output_mfs_dicts[i][rules[j].output_mf[i]].mean_at(firing_strengths[j]))
		    end
		push!(out, (mean_vec' * firing_strengths)[1] / sum(firing_strengths))
        end
        out
	end

end

function firing{T<:AbstractFloat}(tmp_strengths::Vector{T},firing_method::Symbol)
    try
    f=eval(firing_method)
    return f(tmp_strengths)
    catch
        error("$(firing_method) is not one option! Possible options are in the vector: \n $(methods)")
    end
end

const methods = [:minimum_value,
                 :algebraic_product,
                 :bounded_difference,
                 :drastic_product,
                 :einstein_product,
                 :hamacher_product,
                 :maximum_value,
                 :algebraic_sum,
                 :bounded_sum,
                 :drastic_sum,
                 :einstein_sum,
                 :hamacher_sum]
