b = [0.5]
c = [1.0, 0.3]


@assert minimum_value(b) == 0.5
@assert minimum_value(c) == 0.3


@assert algebraic_product(b) == 0.5
@assert algebraic_product(c) == 0.3

@assert bounded_difference(b) == 0.5
@assert bounded_difference(c) == 0.3


@assert drastic_product(b) == 0.5
@assert drastic_product(c) == 0.3


@assert einstein_product(b) == 0.5
@assert einstein_product(c) == 0.3


@assert hamacher_product(b) == 0.5
@assert hamacher_product(c) == 0.3