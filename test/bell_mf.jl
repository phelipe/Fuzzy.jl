a = 2
b = 3
c = 5

mf = BellMF(a, b, c)

# Evaluation tests
@assert mf.eval(c) == 1
@assert mf.eval(c - a) == mf.eval(c + a) == 0.5

# Mean finding tests
@assert mf.mean_at(1) == mf.mean_at(0.6) == mf.mean_at(0.3) == mf.mean_at(0) == c