l_bottom_vertex = 2
l_top_vertex = 5
r_top_vertex = 7
r_bottom_vertex = 11

mf = TrapezoidalMF(l_bottom_vertex, l_top_vertex, r_top_vertex, r_bottom_vertex)

# Evaluation tests
@assert Fuzzy.eval(mf, l_top_vertex) == Fuzzy.eval(mf, r_top_vertex) == 1
@assert Fuzzy.eval(mf, l_bottom_vertex) == Fuzzy.eval(mf, r_bottom_vertex) == 0
@assert Fuzzy.eval(mf, (l_bottom_vertex + l_top_vertex) / 2) == Fuzzy.eval(mf, (r_top_vertex + r_bottom_vertex) / 2) == 0.5

# Mean finding tests
@assert Fuzzy.mean_at(mf, 1) == (l_top_vertex + r_top_vertex) / 2
@assert Fuzzy.mean_at(mf, 0) == (l_bottom_vertex + r_bottom_vertex) / 2