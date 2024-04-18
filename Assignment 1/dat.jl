I = 1:3 #Fuel-types
J = 1:3 #Seed-types


crop_data = [2.6 5.0 0.178;
             1.4 4.2 0.216;
             0.9 1.0 0.433] #crop_data[i,j] i seed, j -> yield t/ha, water demand ML/ha, oil content L/kg



fuel_data = [5 1.43 20;
             30 1.29 5;
             100 1.16 0] #fuel_data[i,j] i fuel, j->biodiesel %, price euro/L, tax %

limits = [150000, 1600, 5000] #Diesel available L, land available ha, Water available ML

c = [1.5, 1] #Methanol, Petrol Diesel

demand_bio = 280000