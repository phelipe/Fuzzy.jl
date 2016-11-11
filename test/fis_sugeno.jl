ipa = Dict()
ipb = Dict()

# Input membership functions
ipa["small"] = TriangularMF(1, 2, 3)
ipa["large"] = TriangularMF(5, 6, 7)
ipb["small"] = TriangularMF(1, 2, 3)
ips = [ipa, ipb]

# Rules
rule1 = Rule(["small", "small"], [1.0, 1.0, 1.0])
rule2 = Rule(["large", "small"], [0, 0, 17.0])
rules = [rule1, rule2]

fis = FISSugeno(ips, rules)

# Input values
ival1 = [2.3, 1.2] # Runs completely on rule 1
ival2 = [6.4, 2.1] # Runs completely on rule 2

@assert eval_fis(fis, ival1) == 4.5
@assert eval_fis(fis, ival2) == 17.0