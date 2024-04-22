using JuMP, Gurobi

include("model.jl")
include("data.jl")

# Create the model
model, x, b, area, water, petrol = bio_model()

# Set the solver to Gurobi
set_optimizer(model, Gurobi.Optimizer)

# Solve the model
optimize!(model)

if termination_status(model) == MOI.OPTIMAL

    ha=value.(x)
    liters=value.(b)
    profit=objective_value(model)

    # Display results
    println("Optimal Solution:")
    println("Land allocation (ha): ", ha)
    println("Biodiesel production (liters): ", liters)
    println("Profit: ", profit)


    println("Dual value area: ", dual(area))
    println("Dual value water: ", dual(water))
    println("Dual value petrol: ", dual(petrol))

    println("Shadow price area: ", shadow_price(area))
    println("Shadow price water: ", shadow_price(water))
    println("Shadow price petrol: ",shadow_price(petrol))
else
    println("Model did not solve to optimality. Status: ", termination_status(model))
end