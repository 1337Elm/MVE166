using JuMP      #load the package JuMP
using Clp       #load the package Clp (an open linear-programming solver)
#using Gurobi   #The commercial optimizer Gurobi requires installation

#The ? can be put infront of commands, variables, and functions to get more information.
#Note that is applied on the main object, hence to ask about an element in an array do:
#element = array[5]
#?element

#Build the model and get variables and constraints back (see intro_mod.jl)
include("model.jl")

m, x,demands = build_model("dat.jl")
print(m) # prints the model instance

set_optimizer(m, Clp.Optimizer)
set_optimizer_attribute(m, "LogLevel", 1)
#set_optimizer(m, Gurobi.Optimizer)
optimize!(m)