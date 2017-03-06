center = 2

mf = SingletonMF(center)

# Evaluation tests
@assert mf.eval(center) == 1
@assert mf.eval(center - 1) == mf.eval(center + 1) == 0

# Mean finding tests
@assert mf.mean_at(1.0) == center
@assert mf.mean_at(0.5) == center
@assert mf.mean_at(0.1) == center
