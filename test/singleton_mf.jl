center = 2

mf = SingletonMF(center)

# Evaluation tests
@assert mf.eval(center) == 1
@assert mf.eval(center - 1) == mf.eval(center + 1) == 0

# Mean finding tests
@assert mf.mean_at(1) == center
