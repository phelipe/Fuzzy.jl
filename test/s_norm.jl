tol=0.00000001
b = [0.5]
c = [1.0, 0.3]


@assert maximum_value(b) - 0.5 < tol
@assert maximum_value(c) - 1.0 < tol


@assert algebraic_sum(b) - 0.5 < tol
@assert algebraic_sum(c) - 1.0 < tol

@assert bounded_sum(b) - 0.5 < tol
@assert bounded_sum(c) - 1.0 < tol


@assert drastic_sum(b) - 0.5 < tol
@assert drastic_sum(c) - 1.0 < tol


@assert einstein_sum(b) - 0.5 < tol
@assert einstein_sum(c) - 1.0 < tol


@assert hamacher_sum(b) - 0.5 < tol
@assert hamacher_sum(c) - 1.0 < tol