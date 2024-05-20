# Sets
Components = 1:10 # 10 components


# Parameters
T = 200  #number of timesteps
d = ones(1,T)*20      #cost of a maintenance occasion
c = [34 25 14 21 16  3 10  5  7 10]'*ones(1,T+1)     #costs of new components
U = [42 18 90 94 49 49 34 90 37 11]     #lives of new components


cost_3d = zeros(Float64,length(Components),T+2,T+2)

for i in Components
    for s in 0:T
        for t in 1:T+1
            if t - s <= U[i]
                cost_3d[i,s+1,t+1] = c[i,t]
            else
                cost_3d[i,s+1,t+1] = T*(maximum(d) + length(Components)*maximum(c)) + 1
            end
        end
    end
end