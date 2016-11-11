# Contains evaluation functions
# ----------------------------------

function eval_fis(fis::FISMamdani,
					input_values::Vector{Float64};
					firing_method = "MIN",
					defuzz_method = "WTAV")
	# Evaluates the FIS
	#
	# Parameters
	# ----------
	# `fis` is the inference system to evaluate
	# `input_values` is a Vector of inputs
	# `firing_method` is the method for finding firing strength
	# 		Currently supports "MIN" (minimum) and "PROD" (product)
	# `defuzz_method` is the method for defuzzification, see defuzz function definition

	firing_strengths = Float64[]
	
	for rule in fis.rules
		
		tmp_strengths = Float64[]
		
		for i in 1:length(rule.input_mf_names)
			
			push!(tmp_strengths, fis.input_mfs_dicts[i][rule.input_mf_names[i]].eval(input_values[i]))
		
		end
		
		if firing_method == "MIN"
			
			push!(firing_strengths, minimum(tmp_strengths))
		
		elseif firing_method == "PROD"
			
			push!(firing_strengths, prod(tmp_strengths))
		
		end
	
	end
	
	defuzz(firing_strengths, fis.rules, fis.output_mfs_dict, defuzz_method = defuzz_method)

end

function eval_fis(fis::FISSugeno,
					input_values::Vector{Float64};
					firing_method = "MIN")
	# Evaluates the FIS
	#
	# Parameters
	# ----------
	# `fis` is the inference system to evaluate
	# `input_values` is a Vector of inputs
	# `firing_method` is the method for finding firing strength
	# 		Currently supports "MIN" (minimum) and "PROD" (product)

	firing_strengths = Float64[]
	
	for rule in fis.rules
		
		tmp_strengths = Float64[]
		
		for i in 1:length(rule.input_mf_names)
			
			push!(tmp_strengths, fis.input_mfs_dicts[i][rule.input_mf_names[i]].eval(input_values[i]))
			
		end
		
		if firing_method == "MIN"
			
			push!(firing_strengths, minimum(tmp_strengths))
		
		elseif firing_method == "PROD"
			
			push!(firing_strengths, prod(tmp_strengths))
		
		end
	
	end
	
	push!(input_values, 1)
	
	n_firing_strengths = firing_strengths / sum(firing_strengths)
	
	out = 0.0
	
	for i = 1:length(fis.rules)
	
		out += n_firing_strengths[i] * (fis.rules[i].output_mf' * input_values)[1]
		
	end
	
	pop!(input_values)

	return out

end

function defuzz(firing_strengths::Vector{Float64},
				rules::Vector{Rule},
				output_mfs_dict::Dict{Any, Any};
				defuzz_method = "WTAV")
	# Defuzzifies the output using the given firing strengths
	#
	# Parameters
	# ----------
	# `firing_strengths` is a Vector of firing strengths
	# 		one for each output membership function
	# `rules` is a Vector of Rule
	# `output_mfs_dict` is a Dict of output membership functions
	# `defuzz_method` is the method for defuzzification
	# 		"MOM" - Mean of Maximum
	# 		"WTAV" - Weighted Average
	
	if defuzz_method == "MOM"
		
		max_firing_index = indmax(firing_strengths)
		max_fired_mf_name = rules[max_firing_index].output_mf
		output_mfs_dict[max_fired_mf_name].mean_at(maximum(firing_strengths))
		
	elseif defuzz_method == "WTAV"
	
		mean_vec = Float64[]
		
		for i in 1:length(rules)
			
			push!(mean_vec, output_mfs_dict[rules[i].output_mf].mean_at(firing_strengths[i]))
			
		end
		
		(mean_vec' * firing_strengths)[1] / sum(firing_strengths)
		
	end

end