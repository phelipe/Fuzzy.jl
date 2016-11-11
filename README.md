# Fuzzy

[![Build Status](https://travis-ci.org/phelipe/Fuzzy.jl.svg?branch=master)](https://travis-ci.org/phelipe/Fuzzy.jl)

[![Coverage Status](https://coveralls.io/repos/phelipe/Fuzzy.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/phelipe/Fuzzy.jl?branch=master)

[![codecov.io](http://codecov.io/github/phelipe/Fuzzy.jl/coverage.svg?branch=master)](http://codecov.io/github/phelipe/Fuzzy.jl?branch=master)

Mamdani and Sugeno type Fuzzy Inference System in julia

### Install

`julia> Pkg.clone("git://github.com/lepisma/Fuzzy.jl.git")`

### QuickStart

`julia> using Fuzzy`

#### Mamdani FIS

-	Create input, output membership functions and rules

```
julia> input_a = {"small" => Fuzzy.TriangularMF(1, 2, 3), "large" => Fuzzy.TriangularMF(4, 5, 6)}
julia> input_b = {"small" => Fuzzy.TriangularMF(1, 2, 3)}

julia> inputs = [input_a, input_b]
julia> output = {"small" => TriangularMF(1, 2, 3)}

julia> rule = Rule(["large", "small"], "small")
julia> rules = [rule]
```
    
-	Create FIS

```
julia> fis = FISMamdani(inputs, output, rules)
```

-	Find output

```
julia> in_vals = [4.7, 2.3]
julia> eval_fis(fis, in_vals)
```

#### Sugeno FIS

-	Create input membership functions and rules with consequence coefficients

```
julia> input_a = {"small" => Fuzzy.TriangularMF(1, 2, 3), "large" => Fuzzy.TriangularMF(5, 6, 7)}
julia> input_b = {"small" => Fuzzy.TriangularMF(1, 2, 3)}

julia> inputs = [input_a, input_b]

julia> rule1 = Rule(["large", "small"], [1.0, 1.0, 1.0])
julia> rule2 = Rule(["small", "small"], [0.0, 0.0, 5.0])
julia> rules = [rule]
```
    
-	Create FIS

```
julia> fis = FISSugeno(inputs, rules)
```

-	Find output

```
julia> in_vals = [2.3, 1.2]
julia> eval_fis(fis, in_vals)
```

### Features

-	FIS
	-	Mamdani
    -	Sugeno
-	Membership functions
	-	Triangular
    -	Gaussian
    -	Bell
    -	Trapezoidal
    -	Sigmoid
-	Defuzzification
	-	Mean of Maximum
    -	Weighted Average (default)
    -	*Centroid (coming soon)*

###License

MIT
