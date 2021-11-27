get_dots(membership_function::MF, input_point_vector::Union{StepRange,StepRangeLen}) =
    get_dots(membership_function, collect(input_point_vector))

function get_dots(membership_function::MF, input_point_vector::Vector{T}) where {T<:Number}
    return Real.(map(x -> Fuzzy.eval(membership_function, x), input_point_vector))
end

chart_prepare(sets_dict::Dict{String,N}, input_point_vector::Union{StepRange,StepRangeLen}) where {N<:MF} =
    chart_prepare(sets_dict, collect(input_point_vector))

function chart_prepare(sets_dict::Dict{String,N}, input_point_vector::Vector{T}) where {T<:Number,N<:MF}
    names = String[]
    outputs = Array{T,1}[]
    for (name, membership_function) in sets_dict
        push!(names, name)
        push!(outputs, get_dots(membership_function, input_point_vector))
    end
    return Dict("names" => reshape(names, 1, :), "values" => outputs)
end
