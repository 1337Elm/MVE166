
function build_model(data_file::String)
    include(data_file)
    
    m = Model()
    @variable(m,x[K] >= 0)

    @objective(m, Max, sum(P*(p_1.*(r*(c_oil.*c_yield.*x)) + p_2.*([0 0 0 0 1]*x)) - cost*x))

    
    @constraint(m, sum(x[i] for i in I) <= limits[2])
    @constraint(m, transpose(W)*x <= limits[3])
    @constraint(m, sum(x[j] for j in J) <= 150000)
    @constraint(m, sum(p_1.*(r*(c_oil.*c_yield.*x)) + p_2.*([0 0 0 0 1]*x)) >= demand_bio)
    return m, x
end