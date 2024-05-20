import matplotlib.pyplot as plt

#a)
timeSteps = [50,70,90,110,130,150,200]
times = [0.30299997329711914, 0.7769999504089355,3.569999933242798,\
        14.918999910354614,108.63700008392334,1576.1059999465942,3600 ]
plt.figure()
plt.plot(timeSteps,times)
plt.yscale("log")
plt.ylabel("Solve time [s]")
plt.xlabel("Time steps [n]")
plt.title("Solve time for different time steps")
plt.savefig("Assignment 2/solve_time_x_relaxed.png")



timeSteps = [50,100,200,300,400,500,600,700]
times = [0.10800004005432129,0.7979998588562012,\
        6.917999982833862,16.378000020980835,35.73099994659424,54.83500003814697,\
        86.96200013160706,170.50400018692017]
plt.figure()
plt.plot(timeSteps,times)
plt.yscale("log")
plt.ylabel("Solve time [s]")
plt.xlabel("Time steps [n]")
plt.title("Solve time for different time steps")
plt.savefig("Assignment 2/solve_time_both_relaxed.png")


#b)
timeSteps = [50,70,90,110,130,150,200]
obj_ip = [405,510,670,815,951,1082.0,1442]
obj_lp = [397.5,506,650,789.666666666,901,1017.0000000000025,1346.999999999999]
gap = [7.5,4,19.99999999999,25.333333333333333333,49.999999999999,64.9999999999975,95]



plt.figure()
plt.plot(timeSteps,obj_ip,label="Objective value, ip")
plt.plot(timeSteps,obj_lp,label="Objective value, lp")
plt.yscale("log")
plt.ylabel("Solve time [s]")
plt.xlabel("Time steps [n]")
plt.legend()
plt.title("Solve time for different time steps")
plt.savefig("Assignment 2/comparison.png")


plt.figure()
plt.plot(timeSteps,gap,label="Gap")
plt.yscale("log")
plt.ylabel("Solve time [s]")
plt.xlabel("Time steps [n]")
plt.legend()
plt.title("Solve time for different time steps")
plt.savefig("Assignment 2/gap.png")

