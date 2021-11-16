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


service = Dict("poor" => TrapezoidalMF(0.0, 0.0, 2.0, 4.0),
    "good" => TriangularMF(3.0, 5.0, 7.0),
    "excellent" => TrapezoidalMF(6.0, 8.0, 10.0, 10.0))

food = Dict("rancid" => TrapezoidalMF(0.0, 0.0, 3.0, 6.0),
    "delicious" => TrapezoidalMF(4.0, 7.0, 10.0, 10.0))

inputs = [service, food]

tip = Dict("cheap" => TrapezoidalMF(10.0, 10.0, 20.0, 30.0),
    "average" => TriangularMF(20.0, 30.0, 40.0),
    "generous" => TrapezoidalMF(30.0, 40, 50.0, 50.0))

rule1 = Rule(["poor", "rancid"], "cheap", "MAX")

# How to not include food input ?
rule2 = Rule(["good", ""], "average", "MAX")

rule3 = Rule(["excellent", "delicious"], "generous", "MAX")
rules = [rule1, rule2, rule3]

fis_tips = FISMamdani(inputs, tip, rules)

in_vals = [7.0, 8,]

@assert eval_fis(fis_tips, in_vals) == 45.0