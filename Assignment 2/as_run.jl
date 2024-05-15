using JuMP
#using Cbc
using Gurobi
using SparseArrays
using Plots

function cost3d(U, s, t, Components, c, d,T)
    c_3d = zeros(Float64, length(Components), length(s), length(t))
    for i in Components
        for s_ind in 1:length(s)
            for t_ind in 1:length(t)-1
                if t_ind - s_ind <= U[i]
                    c_3d[i, s_ind, t_ind] = c[i, t_ind]
                else
                    c_3d[i, s_ind, t_ind] = T*(maximum(d) + maximum(Components) * maximum(c)) + 1
                end
            end
        end
    end
    return c_3d
end

#include("as_dat_large.jl")
include("as_mod.jl")

Times = [50,100,150,200]    #number of timesteps
Components = 1:10 # 10 components

time = Array{Float64,1}()
for i in Times
    T = i
    d = ones(1,T)*20      #cost of a maintenance occasion
    c = [34 25 14 21 16  3 10  5  7 10]'*ones(1,T)     #costs of new components
    U = [42 18 90 94 49 49 34 90 37 11]     #lives of new components
    
    s = 1:T+1
    t = 2:T+2
    c_3d = cost3d(U,s,t,Components,c,d,T)
    println(c_3d)
    m, x, z = build_model(T,c_3d,d,s,t,true,false)
    set_optimizer(m, Gurobi.Optimizer)
    #set_optimizer_attributes(m, "MIPGap" => 2e-2, "TimeLimit" => 3600)
"""
Some useful parameters for the Gurobi solver:
    SolutionLimit = k : the search is terminated after k feasible solutions has been found
    MIPGap = r : the search is terminated when  | best node - best integer | < r * | best node |
    MIPGapAbs = r : the search is terminated when  | best node - best integer | < r
    TimeLimit = t : limits the total time expended to t seconds
    DisplayInterval = t : log lines are printed every t seconds
See http://www.gurobi.com/documentation/8.1/refman/parameters.html for a
complete list of valid parameters
"""
    t1 = time()
    optimize!(m)
    #unset_binary.(x)
    unset_binary.(z)
    optimize!(m)
    used_time = time()-t1
    push!(time,used_time)
end
println(time)
plot(Times,time,yscale=:log,title = "Plot of solve time",xlabel="Time step [s]",
    ylabel="Solve time [s]")
savefig("plot_x_relaxed_time.png")
"""
Some useful output & functions
"""
# obj_ip = objective_value(m)
# unset_binary.(x)
# unset_binary.(z)
# optimize!(m)
# obj_lp = objective_value(m)
# println("obj_ip = $obj_ip, obj_lp = $obj_lp, gap = $(obj_ip-obj_lp) ")

# println(solve_time(m))

# x_val = sparse(value.(x.data))
# z_val = sparse(value.(z))

#println("x  = ")
#println(x_val)
#println("z = ")
#println(z_val)

#add_cut_to_small(m)
