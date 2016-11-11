a = 1
c = -5
limit = 10

mf = SigmoidMF(a, c, limit)

# Evaluation tests
@assert mf.eval(c) == 0.5
@assert mf.eval(c - 5) < mf.eval(c + 5)

# Mean finding tests
@assert mf.mean_at(1) > mf.mean_at(0.6) > mf.mean_at(0.3) > mf.mean_at(0)