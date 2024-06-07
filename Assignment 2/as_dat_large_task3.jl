# Sets
Components = 1:10 # 10 components
I = [(s,t) for s in 0:T for t in (s+1):(T+1)]


# Parameters
T = 110  #number of timesteps
U = [42 18 90 94 49 49 34 90 37 11]     #lives of new components
d = ones(1,T)*20      #cost of a maintenance occasion

cost_3d = [begin
        matrix = fill(r, T+1, T+1)  # Create a T x T matrix filled with the value r
        padded_matrix = zeros(T + 2, T + 2)  # Create a larger matrix with padding
        padded_matrix[1:(T+1), 1:(T+1)] = matrix  # Copy the smaller matrix into the center of the padded matrix
        padded_matrix
    end
    for r in [34 25 14 21 16  3 10  5  7 10]]

        for i in Components
    for s in 0:T
        for t in (s+U[i]+1):(T+1)
            cost_3d[i][s+1,t+1] = T*(20+10*34) + 1
        end
    end
end
