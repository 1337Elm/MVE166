
function build_model(data_file::String)
    include(data_file)
    
    m = Model()
    @variable(m,x[K] >= 0)
    
    @objective(m, Max, P.*(p_1.*(transpose(r)*(c_oil.*c_yield.*x)) + p_2.*([0 0 0 0 1].*x)) - c.*x)

    demands = Array{Float64}(undef,4)
    #@constraint(m, demands[1], sum(x[i] for i in I) <= limits[2])
    #@constraint(m, demands[2], transpose(W)*x <= limits[3])
    #@constraint(m, demands[3], sum(x(j) for j in J) <= 150000)
    #@constraint(m, demands[4], sum(p_1.*(transpose(r)*(c_oil.*c_yield.*x)) + p_2.*([0 0 0 0 1].*x)) >= demand_bio)
    return m, x,demands
end