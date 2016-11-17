module Fuzzy

	export TriangularMF, GaussianMF, BellMF, TrapezoidalMF, SigmoidMF

	export Rule, FISMamdani, FISSugeno

	export eval_fis

	export minimum_value, algebraic_product, bounded_difference, drastic_product, einstein_product, hamacher_product

	# T-Norm
	include("T-norm.jl")

	# Membership functions
	include("MF.jl")

	# FIS
	include("FIS.jl")

	# Evaluation functions
	include("Eval.jl")

end
