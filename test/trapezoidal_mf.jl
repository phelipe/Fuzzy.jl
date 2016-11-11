l_bottom_vertex = 2
l_top_vertex = 5
r_top_vertex = 7
r_bottom_vertex = 11

mf = TrapezoidalMF(l_bottom_vertex, l_top_vertex, r_top_vertex, r_bottom_vertex)

# Evaluation tests
@assert mf.eval(l_top_vertex) == mf.eval(r_top_vertex) == 1
@assert mf.eval(l_bottom_vertex) == mf.eval(r_bottom_vertex) == 0
@assert mf.eval((l_bottom_vertex + l_top_vertex) / 2) == mf.eval((r_top_vertex + r_bottom_vertex) / 2) == 0.5

# Mean finding tests
@assert mf.mean_at(1) == (l_top_vertex + r_top_vertex) / 2
@assert mf.mean_at(0) == (l_bottom_vertex + r_bottom_vertex) / 2