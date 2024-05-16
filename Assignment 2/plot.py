import matplotlib.pyplot as plt

timeSteps = [50,100,200,300,400,500,600,700]
times = [0.04900002479553223, 0.24500012397766113,0.7730000019073486,\
         1.8269999027252197,3.325000047683716,5.329999923706055,7.788000106811523,10.478000164031982]
plt.plot(timeSteps,times)
plt.yscale("log")
plt.ylabel("Solve time [s]")
plt.xlabel("Time steps [n]")
plt.title("Solve time for different time steps")
plt.savefig("solve_time_both_relaxed.png")