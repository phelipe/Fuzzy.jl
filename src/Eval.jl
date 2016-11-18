# Contains evaluation functions
# ----------------------------------

function eval_fis{T<:AbstractFloat}(fis::FISMamdani, input_values::Vector{T},defuzz_method = "WTAV")
	# Evaluates the FIS
	#
	# Parameters
	# ----------
	# `fis` is the inference system to evaluate
	# `input_values` is a Vector of inputs
	# `defuzz_method` is the method for defuzzification, see defuzz function definition

	firing_strengths = AbstractFloat[]
	for rule in fis.rules
		tmp_strengths = AbstractFloat[]
		for i in 1:length(rule.input_mf_names)
			push!(tmp_strengths, fis.input_mfs_dicts[i][rule.input_mf_names[i]].eval(input_values[i]))
		end
			push!(firing_strengths, firing(tmp_strengths,rule.firing_method ))
	end
	defuzz(firing_strengths, fis.rules, fis.output_mfs_dict, defuzz_method)

end

function eval_fis{T<:AbstractFloat}(fis::FISSugeno,	input_values::Vector{T})
	# Evaluates the FIS
	#
	# Parameters
	# ----------
	# `fis` is the inference system to evaluate
	# `input_values` is a Vector of inputs

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
	out = 0.0
	for i = 1:length(fis.rules)
		out += n_firing_strengths[i] * (fis.rules[i].output_mf' * input_values)[1]
	end
	pop!(input_values)
	return out

end

function defuzz(firing_strengths::Vector{AbstractFloat}, rules::Vector{Rule},	output_mfs_dict::Dict{Any, Any}, defuzz_method::AbstractString)
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
		mean_vec = AbstractFloat[]
		for i in 1:length(rules)
			push!(mean_vec, output_mfs_dict[rules[i].output_mf].mean_at(firing_strengths[i]))
		end
		(mean_vec' * firing_strengths)[1] / sum(firing_strengths)
	end

end


function firing{T<:AbstractFloat}(tmp_strengths::Vector{T},firing_method::AbstractString)
	if firing_method == "MIN"
		return	minimum_value(tmp_strengths)
	elseif firing_method == "A-PROD"
		return algebraic_product(tmp_strengths)
	elseif firing_method == "B-DIF"
		return bounded_difference(tmp_strengths)
	elseif firing_method == "D-PROD"
		return drastic_product(tmp_strengths)
	elseif firing_method == "E-PROD"
		return einstein_product(tmp_strengths)
	elseif firing_method == "H-PROD"
		return hamacher_product(tmp_strengths)
	elseif firing_method == "MAX"
		return	maximum_value(tmp_strengths)
	elseif firing_method == "A-SUM"
		return algebraic_sum(tmp_strengths)
	elseif firing_method == "B-SUM"
		return bounded_sum(tmp_strengths)
	elseif firing_method == "D-SUM"
		return drastic_sum(tmp_strengths)
	elseif firing_method == "E-SUM"
		return einstein_sum(tmp_strengths)
	elseif firing_method == "H-SUM"
		return hamacher_sum(tmp_strengths)
	end
end
