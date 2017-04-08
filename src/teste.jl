include("Fuzzy.jl")

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
opb["small"] = Fuzzy.TriangularMF(1, 1, 3)
opb["large"] = Fuzzy.TriangularMF(5, 6, 7)

ops = [opa, opb]
# Simple rule

rule1_s = Fuzzy.Rule(["small", "small"], ["small","small"])
rule2_s = Fuzzy.Rule(["large", "small"], ["large","large"])
rule3_s = Fuzzy.Rule(["large", "small"], ["large","large"])
rule4_s = Fuzzy.Rule(["large", "small"], ["large","large"])
rule5_s = Fuzzy.Rule(["large", "small"], ["large","large"])
rule6_s = Fuzzy.Rule(["large", "small"], ["large","large"])
rule7_s = Fuzzy.Rule(["large", "small"], ["large","large"])
rule8_s = Fuzzy.Rule(["large", "small"], ["large","large"])
rule9_s = Fuzzy.Rule(["large", "small"], ["large","large"])
rule10_s = Fuzzy.Rule(["large", "small"], ["large","large"])
rule11_s = Fuzzy.Rule(["large", "small"], ["large","large"])
rule12_s = Fuzzy.Rule(["large", "small"], ["large","large"])
rules = [rule1_s, rule2_s, rule3_s, rule4_s, rule5_s, rule6_s, rule7_s, rule8_s, rule9_s, rule10_s, rule11_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s, rule12_s]

fis = Fuzzy.FISMamdani(ips, ops, rules)

# Input values
ival1 = [1.2, 2.3]
ival2 = [5.7, 2.0]
@time Fuzzy.eval_fis(fis, ival1)
#=
println("WTAV method")
println( Fuzzy.eval_fis(fis, ival1))# == 2.0
println( Fuzzy.eval_fis(fis, ival2))# == 6.0

println("MOM method")
println( Fuzzy.eval_fis(fis, ival1,"MOM"))# == 2.0
println( Fuzzy.eval_fis(fis, ival2,"MOM"))# == 6.0
=#

#Testes do sistema mimo sugeno
rule1_s = Fuzzy.Rule(["large", "small"],[ [1.0, 0.0, 1.0],[1.0, 1.0, 1.0],[ 0.0, 0.0, 5.0]])
rule2_s = Fuzzy.Rule(["small", "small"],[ [1.0, 1.0, 5.0],[0.0, 0.0, 5.0],[0.0,0.0,1.2]])
rule3_s = Fuzzy.Rule(["small", "small"],[ [1.0, 1.0, 5.0],[0.0, 0.0, 5.0],[0.0,0.0,1.2]])
rule4_s = Fuzzy.Rule(["small", "small"],[ [1.0, 1.0, 5.0],[0.0, 0.0, 5.0],[0.0,0.0,1.2]])
rule5_s = Fuzzy.Rule(["small", "small"],[ [1.0, 1.0, 5.0],[0.0, 0.0, 5.0],[0.0,0.0,1.2]])
rule6_s = Fuzzy.Rule(["small", "small"],[ [1.0, 1.0, 5.0],[0.0, 0.0, 5.0],[0.0,0.0,1.2]])
rule7_s = Fuzzy.Rule(["small", "small"],[ [1.0, 1.0, 5.0],[0.0, 0.0, 5.0],[0.0,0.0,1.2]])
rule8_s = Fuzzy.Rule(["small", "small"],[ [1.0, 1.0, 5.0],[0.0, 0.0, 5.0],[0.0,0.0,1.2]])
rule9_s = Fuzzy.Rule(["small", "small"],[ [1.0, 1.0, 5.0],[0.0, 0.0, 5.0],[0.0,0.0,1.2]])
rule10_s = Fuzzy.Rule(["small", "small"],[ [1.0, 1.0, 5.0],[0.0, 0.0, 5.0],[0.0,0.0,1.2]])
rule11_s = Fuzzy.Rule(["small", "small"],[ [1.0, 1.0, 5.0],[0.0, 0.0, 5.0],[0.0,0.0,1.2]])
rule12_s = Fuzzy.Rule(["small", "small"],[ [1.0, 1.0, 5.0],[0.0, 0.0, 5.0],[0.0,0.0,1.2]])
rules_s = [rule1_s, rule2_s, rule3_s, rule4_s, rule5_s, rule6_s, rule7_s, rule8_s, rule9_s, rule10_s, rule11_s, rule12_s]
 fis_s = Fuzzy.FISSugeno(ips, rules_s)
 in_vals = [2., 2.5]
 @time Fuzzy.eval_fis(fis_s, in_vals)# 8.5,5,7.3


#TODO adicionar método do centro de gravidade
#TODO implementar fuzzy segeno ordem > ou = 2
