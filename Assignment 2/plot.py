import matplotlib.pyplot as plt

#a)
timeSteps = [50,70,90,110,130,150,200]
times = [0.08100008964538574, 0.1940000057220459,1.8250000476837158,\
        4.876000165939331,59.151000022888184,410.9429998397827,3600.1349999904633 ]

times = [0.14, 0.29, 1.97, 7.26,60.88, 611, 70000]
plt.figure()
plt.plot(timeSteps,times,'b-.o')
plt.yscale("log")
plt.ylabel("Solve time [s]")
plt.xlabel("Time steps [n]")
plt.title("Solve time for different time steps")
plt.savefig("Assignment 2/solve_time_x_relaxed.png")



timeSteps_both_relaxed = [50,100,200,300,400,500,600,700]
times_both_relaxed = [0.10800004005432129,0.7979998588562012,\
        6.917999982833862,16.378000020980835,35.73099994659424,54.83500003814697,\
        86.96200013160706,170.50400018692017]
plt.figure()
plt.plot(timeSteps_both_relaxed,times_both_relaxed,'b-o')
plt.yscale("log")
plt.ylabel("Solve time [s]")
plt.xlabel("Time steps [n]")
plt.title("Solve time for different time steps")
plt.savefig("Assignment 2/solve_time_both_relaxed.png")

plt.figure()
plt.plot(timeSteps,times,'b-.o',label="MILP")
plt.plot(timeSteps_both_relaxed,times_both_relaxed,'b-o',label="LP")
plt.yscale("log")
plt.ylabel("Solve time [s]")
plt.xlabel("Time steps [n]")
plt.legend()
plt.title("Solve time for different time steps")
plt.savefig("Assignment 2/solve_time_both.png")


#b)

T_int = [50, 70, 90, 110, 130, 150, 170, 200]
times_int = [0.028, 0.062, 0.277, 1.398, 4.795, 37.917, 82.565, 721.279]

T_relax = [50, 100, 200, 300, 400, 500, 600, 700]
times_relax = [0.0089, 0.042, 0.192, 0.4859, 0.7999, 0.992, 1.391, 1.937]


plt.figure()
plt.plot(timeSteps,times,'b-.o',label="Model 2, MILP")

plt.plot(T_int,times_int,'r-.o',label="Model 1, MILP")



#plt.xlim([50, 700])
plt.yscale("log")
plt.ylabel("Solve time [s]")
plt.xlabel("Time steps [n]")
plt.legend()
plt.title("Solve time for different time steps")
plt.savefig("Assignment 2/comparison_MILP.png")


plt.figure()
plt.plot(timeSteps_both_relaxed,times_both_relaxed,'b-o',label="Model 2, LP")
plt.plot(T_relax,times_relax,'r-o',label="Model 1, LP")
plt.yscale("log")
plt.ylabel("Solve time [s]")
plt.xlabel("Time steps [n]")
plt.legend()
plt.title("Solve time for different time steps")
plt.savefig("Assignment 2/comparison_LP.png")