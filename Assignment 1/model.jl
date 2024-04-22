using JuMP, Gurobi
# Include the data file
include("data.jl")

function bio_model()

    model = Model()

    # Define the variables
    @variable(model, x[j in J] >= 0) # Land allocation
    @variable(model, b[i in I] >= 0) # Volume of biodiesel product produced

    # Objective Function: Maximize Profit
    @objective(model, Max, sum(P[i]*b[i] *(1-tax[i]) for i in I) - 
               (sum(O[j]*1000*Y[j]*x[j] for j in J) * M * V_methanol_to_biodiesel)-
                (sum(b[i]*(1-pi[i]) for i in I)*D))

    # Define the constraints
    @constraint(model, area, sum(x[j] for j in J) <= A) 
    @constraint(model, water, sum(W[j]*x[j] for j in J) <= W_max)
    @constraint(model, sum(b[i]*pi[i]/(V_oil_to_biodiesel) for i in I) == sum(Y[j]*x[j]*O[j]*1000 for j in J))
    @constraint(model, sum(b[i] for i in I) >= D_total)
    @constraint(model, petrol, sum(b[i]*(1 - pi[i]) for i in I) <= D_max)

    return model, x, b, area, water, petrol

end