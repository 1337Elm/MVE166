# Parameters
Y = Dict("Soybeans" => 2.6, "Sunflower" => 1.4, "Cotton" => 0.9)
W = Dict("Soybeans" => 5.0, "Sunflower" => 4.2, "Cotton" => 1.0)
O = Dict("Soybeans" => 0.178, "Sunflower" => 0.216, "Cotton" => 0.433)
P = Dict("B5" => 1.43, "B30" => 1.29, "B100" => 1.16)
pi = Dict("B5" => 0.05, "B30" => 0.30, "B100" => 1)
tax = Dict("B5" => 0.20, "B30" => 0.05, "B100" => 0.72)

M = 1.5  # Methanol price
D = 1  # Diesel price
A = 1600 # Available area in hectares
W_max = 5000 # Maximum available water in megalitres
D_max = 150000 # Maximum available diesel
D_total = 280000 # Total demand
V_oil_to_biodiesel = 0.9
V_methanol_to_biodiesel = 0.2

# Sets
I = ["B5", "B30", "B100"]
J = ["Soybeans", "Sunflower", "Cotton"]
