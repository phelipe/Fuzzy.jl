# Contains FIS and Rule types
# ---------------------------

type Rule
	# A Rule connecting input and output membership function
	#
	# Properties
	# ----------
	# `input_mf_names` is a Vector of ASCIIString (in order of inputs) which contains name of membership functions
	# `output_mf` is either an ASCIIString containing the connected output membership function name with `input_mf_names`
	# 		or is a Vector of Float64 containing consequence parameters in case of Sugeno fis

	input_mf_names::Vector{ASCIIString}
	output_mf::Union{Vector{Float64}, ASCIIString}

end

type FISMamdani
	# Fuzzy Inference System of Mamdani type
	#
	# Properties
	# ----------
	# `input_mfs_dicts` is a Vector of Dict (one for each input) which contains membership function
	# 		associated with its name
	# 		e.g. "small" => TriangularMF(1, 2, 3)
	# `output_mfs_dict` is a Dict containing membership function of output associated with names
	# 		e.g. "small" => GaussianMF(4, 2)
	# `rules` is a Vector of Rule that form the inference system

	input_mfs_dicts::Vector{Dict{Any, Any}}
	output_mfs_dict::Dict{Any, Any}
	rules::Vector{Rule}

end

type FISSugeno
	# Fuzzy Inference System of Mamdani type
	#
	# Properties
	# ----------
	# `input_mfs_dicts` is a Vector of Dict (one for each input) which contains membership function
	# 		associated with its name
	# 		e.g. "small" => TriangularMF(1, 2, 3)
	# `rules` is a Vector of Rule (of sugeno type) that form the inference system

	input_mfs_dicts::Vector{Dict{Any, Any}}
	rules::Vector{Rule}

end