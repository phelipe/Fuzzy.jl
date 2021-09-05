center = 5
sigma = 2

mf = GaussianMF(center, sigma)

# Evaluation tests
@assert Fuzzy.eval(mf, center + sigma) == exp(-0.5)
@assert Fuzzy.eval(mf, center) == 1
@assert Fuzzy.eval(mf, center + sigma) == Fuzzy.eval(mf, center - sigma)

# Mean finding tests
@assert Fuzzy.mean_at(mf, 1) == Fuzzy.mean_at(mf, 0.6) == Fuzzy.mean_at(mf, 0.3) == Fuzzy.mean_at(mf, 0) == center
