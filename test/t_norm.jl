tol=0.00000001
b = [0.5]
c = [1.0, 0.3]


@assert minimum_value(b) - 0.5 < tol
@assert minimum_value(c) - 0.3 < tol


@assert algebraic_product(b) - 0.5 < tol
@assert algebraic_product(c) - 0.3 < tol

@assert bounded_difference(b) - 0.5 < tol
@assert bounded_difference(c) - 0.3 < tol


@assert drastic_product(b) - 0.5 < tol
@assert drastic_product(c) - 0.3 < tol


@assert einstein_product(b) - 0.5 < tol
@assert einstein_product(c) - 0.3 < tol


@assert hamacher_product(b) - 0.5 < tol
@assert hamacher_product(c) - 0.3 < tol