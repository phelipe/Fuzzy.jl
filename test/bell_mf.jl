a = 2
b = 3
c = 5

mf = BellMF(a, b, c)

# Evaluation tests
@assert Fuzzy.eval(mf, c) == 1
@assert Fuzzy.eval(mf, c - a) == Fuzzy.eval(mf, c + a) == 0.5

# Mean finding tests
@assert Fuzzy.mean_at(mf, 1) == Fuzzy.mean_at(mf, 0.6) == Fuzzy.mean_at(mf, 0.3) == Fuzzy.mean_at(mf, 0) == c