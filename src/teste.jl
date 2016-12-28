include("Fuzzy.jl")
#TODO fazr testes do sistema mimo

ipa = Dict()
ipb = Dict()
opa = Dict()
opb = Dict()


# Input membership functions
ipa["small"] = Fuzzy.TriangularMF(1, 2, 3)
ipa["large"] = Fuzzy.TriangularMF(5, 6, 7)
ipb["small"] = Fuzzy.TriangularMF(1, 2, 3)
ips = [ipa, ipb]

# Output membership functions
opa["small"] = Fuzzy.TriangularMF(1, 2, 3)
opa["large"] = Fuzzy.TriangularMF(5, 6, 7)
opb["small"] = Fuzzy.TriangularMF(1, 2, 3)
opb["large"] = Fuzzy.TriangularMF(5, 6, 7)

ops = [opa, opb]
# Simple rule
rule1 = Fuzzy.Rule(["small", "small"], ["small","small"])
rule2 = Fuzzy.Rule(["large", "small"], ["large","large"])
rules = [rule1, rule2]

fis = Fuzzy.FISMamdani(ips, ops, rules)

# Input values
ival1 = [1.2, 2.3]
ival2 = [5.7, 2.0]

println( Fuzzy.eval_fis(fis, ival1,"MOM"))# == 2.0
println( Fuzzy.eval_fis(fis, ival2,"MOM"))# == 6.0
