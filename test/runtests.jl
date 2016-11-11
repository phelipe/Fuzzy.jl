#
# Tests
#

using Fuzzy

tests = ["triangular_mf.jl",
		"gaussian_mf.jl",
		"trapezoidal_mf.jl",
		"bell_mf.jl",
		"sigmoid_mf.jl",
		"fis_mamdani.jl",
		"fis_sugeno.jl"]
				
println("Running test:")

for tst in tests
	println(" * $(tst)")
	include(tst)
end