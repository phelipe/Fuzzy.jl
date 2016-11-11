ipa = Dict()
ipb = Dict()
ops = Dict()

# Input membership functions
ipa["small"] = TriangularMF(1, 2, 3)
ipa["large"] = TriangularMF(5, 6, 7)
ipb["small"] = TriangularMF(1, 2, 3)
ips = [ipa, ipb]

# Output membership functions
ops["small"] = TriangularMF(1, 2, 3)
ops["large"] = TriangularMF(5, 6, 7)

# Simple rule
rule1 = Rule(["small", "small"], "small")
rule2 = Rule(["large", "small"], "large")
rules = [rule1, rule2]

fis = FISMamdani(ips, ops, rules)

# Input values
ival1 = [1.2, 2.3]
ival2 = [5.7, 2.0]

@assert eval_fis(fis, ival1) == 2.0
@assert eval_fis(fis, ival2) == 6.0