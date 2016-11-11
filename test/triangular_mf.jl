l_vertex = 2
center = 5
r_vertex = 7

mf = TriangularMF(l_vertex, center, r_vertex)

# Evaluation tests
@assert mf.eval(center) == 1
@assert mf.eval(l_vertex) == mf.eval(r_vertex) == 0
@assert mf.eval((l_vertex + center) / 2) == mf.eval((r_vertex + center) / 2) == 0.5

# Mean finding tests
@assert mf.mean_at(1) == center
@assert mf.mean_at(0) == (l_vertex + r_vertex) / 2