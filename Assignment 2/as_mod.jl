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
    @variable(m, x[Components, 1:T+1,2:T+2] >= 0)
  else
    @variable(m, x[Components, 1:T+1,2:T+2] >= 0, Bin)
  end
  if relax_z
      @variable(m, z[1:T] <= 1)
  else
      @variable(m, z[1:T] <= 1, Bin)
  end
  cost_3d = zeros(Float64,length(Components),T+2,T+2)

  for i in Components
      for s in 1:T+1
          for t in 1:T+1
              if t - s <= U[i]
                  cost_3d[i,s,t] = c[i,t]
              else
                  cost_3d[i,s,t] = T*(maximum(d) + length(Components)*maximum(c)) + 1
              end
          end
      end
  end
  cost = @objective(m, Min, sum(d[t]*z[t] for t in 1:T) + 
  sum(sum(cost_3d[i,s,t]*x[i,s,t] for s in 1:T+1, t in 2:T+2) for i in Components))

  ReplaceOnlyAtMaintenance = @constraint(m, [i in Components, t in 2:T],
  sum(x[i,s,t] for s in 1:T+1) <= z[t])

  SameInterval = @constraint(m, [i in Components, t in 2:T],
  sum(x[i,s,t] for s in 1:t)  == sum(x[i,t,r] for r in t+1:T+1))

  MaintenanceAtStart = @constraint(m, [i in Components],
  sum(x[i,1,t] for t in 2:T+2) == 1)

  return m, x, z
end
"""
  Adds the constraint:  z[1] + x[1,2] + x[2,2] + x[1,3] + x[2,3] + z[4] >= 2
  which is a VI for the small instance
"""
function add_cut_to_small(m::Model)
  @constraint(m, z[1] + x[1,2] + x[2,2] + x[1,3] + x[2,3] + z[4] >= 2)
end
