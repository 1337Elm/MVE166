import matplotlib.pyplot as plt

# Solve times for large data
T_int = [50, 70, 90, 110, 130, 150, 170, 190, 200]
times_int = [0.028, 0.062, 0.277, 1.398, 4.795, 37.917, 82.565, 115.397, 721.279]

T_relax = [50, 100, 150, 200, 250, 300, 350, 400, 450, 500, 550, 600, 650, 700]
times_relax = [0.0089, 0.042, 0.0769, 0.192, 0.2489, 0.4859, 0.7599, 0.7999, 1.1059, 0.992, 1.493, 1.391, 1.8959, 1.937]

plt.figure()
plt.plot(T_int, times_int)
plt.yscale('log')
plt.title('Model 1 with binary variables')
plt.xlabel('T')
plt.ylabel('solve time (s)')
plt.savefig('model1_binary.png')
plt.show()

plt.figure()
plt.plot(T_relax, times_relax)
plt.yscale('log')
plt.title('Model 1 with relaxed variables')
plt.xlabel('T')
plt.ylabel('solve time (s)')
plt.savefig('model1_relaxed.png')
plt.show()