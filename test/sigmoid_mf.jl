a = 1
c = -5
limit = 10

mf = SigmoidMF(a, c, limit)

# Evaluation tests
@assert Fuzzy.eval(mf, c) == 0.5
@assert Fuzzy.eval(mf, c - 5) < Fuzzy.eval(mf, c + 5)

# Mean finding tests
@assert Fuzzy.mean_at(mf, 1) > Fuzzy.mean_at(mf, 0.6) > Fuzzy.mean_at(mf, 0.3) > Fuzzy.mean_at(mf, 0)