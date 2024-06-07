"""
  Construct and returns the model of this assignment.
"""

function build_model(relax_x::Bool = false, relax_z::Bool = false)
  #Components - the set of components
  #T - the number of time steps in the model
  #d[1,..,T] - cost of a maintenance occasion
  #c[Components, 1,..,T] - costs of new components
  #U[Components] - lives of new components
  #s 1:T+1
  #t 2:T+2
  
  m = Model()
  if relax_x
    @variable(m, x[Components, I] >= 0)
  else
    @variable(m, x[Components, I] >= 0, Bin)
  end
  if relax_z
      @variable(m, z[1:T] <= 1)
  else
      @variable(m, z[1:T] <= 1, Bin)
  end

  cost = @objective(m, Min, sum(d[t]*z[t] for t in 1:T) + 
  sum(cost_3d[i][s+1,t+1]*x[i,(s,t)] for i in Components, (s,t) in I))

  ReplaceOnlyAtMaintenance = @constraint(m, [i in Components, t in 1:T],
  sum(x[i,(s,t)] for s in 0:t-1) <= z[t])

  StartEnd = @constraint(m, [i in Components, t in 1:T],
  sum(x[i, (s,t)] for s in 0:t-1)  == sum(x[i,(t,r)] for r in (t+1):(T+1)))

  MaintanenceAll = @constraint(m, [i in Components],
  sum(x[i,(0,t)] for t in 1:T+1) == 1)

  return m, x, z
end
"""
  Adds the constraint:  z[1] + x[1,2] + x[2,2] + x[1,3] + x[2,3] + z[4] >= 2
  which is a VI for the small instance
"""
function add_cut_to_small(m::Model)
  @constraint(m, z[1] + x[1,2] + x[2,2] + x[1,3] + x[2,3] + z[4] >= 2)
end
