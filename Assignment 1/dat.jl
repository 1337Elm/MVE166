I = 1:3 #Seed-types
J = 4 #Methanol
K = 1:5 #Materials to use

c_yield = [2.6*10^3; 1.4*10^3; 0.9*10^3; 1; 1] #Yield for materials, standard 1 for methanol and diesel Petrol
c_oil = [0.178; 0.216; 0.433; 1; 1] #Oil content for materials, standard 1 for methanol and diesel petrol

W = [5.0; 4.2; 1.0; 0; 0] #Water demand for all materials 0 for methanol and petrol diesel

r = [1/0.9; 1/0.9; 1/0.9; 1/0.2; 0] #Recipe 1/0.9 for vegetable oil and 1/0.2 for methanol and 0 for diesel in order to create 1L of biofuel

p_1 = [0.05; 0.3; 1] #Procentage of biofuel
p_2 = [1; 1; 1] - p_1 #Procentage of petrol diesel

P = [1.43*(1-0.2); 1.29*(1-0.05); 1.16] #Taxed prices

limits = [150000 1600 5000] #Diesel available L, land available ha, Water available ML

c = [0 0 0 1.5 1] #Cost for Seed 1, Seed 2, Seed 3, Methanol, Petrol Diesel

demand_bio = 280000