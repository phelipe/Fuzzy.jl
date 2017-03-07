ipa = Dict()
ipb = Dict()
opa = Dict()
opb = Dict()
ops = Dict()

# Input membership functions
ipa["small"] = TriangularMF(1, 2, 3)
ipa["large"] = TriangularMF(5, 6, 7)
ipb["small"] = TriangularMF(1, 2, 3)
ips = [ipa, ipb]

# Output membership functions
opa["small"] = TriangularMF(1, 2, 3)
opa["large"] = TriangularMF(5, 6, 7)
opb["small"] = TriangularMF(1, 2, 3)
opb["large"] = TriangularMF(5, 6, 7)
ops = [opa, opb]

# Simple rule
rule1 = Rule(["small", "small"], ["small","small"])
rule2 = Rule(["large", "small"], ["large","large"])
rules = [rule1, rule2]

fis = FISMamdani(ips, ops, rules)

# Input values
ival1 = [1.2, 2.3]
ival2 = [5.7, 2.0]

@assert eval_fis(fis, ival1) == [2.0, 2.0]
@assert eval_fis(fis, ival2) == [6.0, 6.0]
@assert eval_fis(fis, ival1,"MOM") == [2.0, 2.0]
@assert eval_fis(fis, ival2,"MOM") == [6.0, 6.0]
