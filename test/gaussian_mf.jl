center = 5
sigma = 2

mf = GaussianMF(center, sigma)

# Evaluation tests
@assert mf.eval(center + sigma) == e ^ (-0.5)
@assert mf.eval(center) == 1
@assert mf.eval(center + sigma) == mf.eval(center - sigma)

# Mean finding tests
@assert mf.mean_at(1) == mf.mean_at(0.6) == mf.mean_at(0.3) == mf.mean_at(0) == center