module Fuzzy
	
	export TriangularMF, GaussianMF, BellMF, TrapezoidalMF, SigmoidMF
	
	export Rule, FISMamdani, FISSugeno
	
	export eval_fis
	
	# Membership functions
	include("MF.jl")
	
	# FIS
	include("FIS.jl")
	
	# Evaluation functions
	include("Eval.jl")

end