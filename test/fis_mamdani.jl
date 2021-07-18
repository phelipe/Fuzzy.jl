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


service = Dict( "poor"      => TrapezoidalMF(0.0, 0.0, 2.0, 4.0), 
                "good"      => TriangularMF(3., 5., 7.),
                "excellent" => TrapezoidalMF(6., 8., 10., 10.))

food = Dict("rancid"    => TrapezoidalMF(0., 0., 3., 6.),
            "delicious" => TrapezoidalMF(4., 7., 10., 10.))

inputs = [service, food]

tip  = Dict("cheap"     => TrapezoidalMF(10., 10., 20., 30.),
            "average"   => TriangularMF(20., 30., 40.), 
            "generous"  => TrapezoidalMF(30., 40, 50., 50.))

rule1 = Rule(["poor", "rancid"], "cheap", "MAX")

# How to not include food input ?
rule2 = Rule(["good", ""], "average", "MAX")

rule3 = Rule(["excellent", "delicious"], "generous", "MAX")
rules = [rule1, rule2, rule3]

fis_tips = FISMamdani(inputs, tip, rules)

in_vals = [7., 8,]

@assert eval_fis(fis_tips, in_vals) == 45.0