function build_model(T,c_3d,d,s,t,relax_x::Bool = false, relax_z::Bool = false)
  #Components - the set of components
  #T - the number of time steps in the model
  #d[1,..,T] - cost of a maintenance occasion
  #c[Components, 1,..,T] - costs of new components
  #U[Components] - lives of new components
  m = Model()
  if relax_x
    @variable(m, x[Components, s,t] >= 0)
  else
    @variable(m, x[Components, s,t] >= 0, Bin)
  end
  if relax_z
      @variable(m, z[t] <= 1)
  else
      @variable(m, z[t] <= 1, Bin)
  end
  cost = @objective(m, Min,
  sum(d[k] * z[k] for k in 1:T) + sum(c_3d[i, s_ind, t_ind] * x[i, s_ind, t_ind] for i in Components, s_ind in s, t_ind in t))


  #ReplaceWithinLife = @constraint(m,
  #  [i in Components, ell in 0:(T-U[i]); T >= U[i]],
  #  sum(x[i,t] for t in (ell .+ (1:U[i]))) >= 1)

  ReplaceOnlyAtMaintenance = @constraint(m, [i in Components,t_ind in 1:T, s_ind in 1:t_ind- 1],
  sum(x[i,s_ind,t_ind])<= z[t_ind])
  
  ReplaceAtStart = @constraint(m, sum(x[i,1,t_ind] for i in Components for t_ind in t)== 1)

  ReplaceNotInBetween = @constraint(m, 
  sum(x[i, s_ind, t_ind] for i in Components for t_ind in 1:T for s_ind in 1:t_ind-1) ==
  sum(x[i, t_ind, r] for i in Components for t_ind in 1:T for r in t_ind+1:T+1))


  return m, x, z
end
"""
  Adds the constraint:  z[1] + x[1,2] + x[2,2] + x[1,3] + x[2,3] + z[4] >= 2
  which is a VI for the small instance
"""
function add_cut_to_small(m::Model)
  @constraint(m, z[1] + x[1,2] + x[2,2] + x[1,3] + x[2,3] + z[4] >= 2)
end
