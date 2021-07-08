from math import floor

# minN = 8
# maxN = 100
n = 19
minM = n+1
maxM = 2*n-6
distances = []
numSteps = 2000
foldersExtension = f'_n{n}_{numSteps}'

for m in range(minM, maxM+1):
  # m = n+2
  sigma1= lambda k: (k-1)*(12*m-18*k+10*m*k*k-7*m*m*k-10*n*k*k-n*n*k+12*k*k+2*m*m*k*k+2*n*n*k*k-26*m*k+11*n*k+6*m*m+8*m*n*k-4*m*n*k*k+6)/(1.0*6.0)
  k=floor((n-2)/(m-n+2)+2)
  distances.append(2*int(sigma1(k))-1)

with open('geng.sub','w') as file:
  file.write('Executable = geng\n')
  file.write('Universe = vanilla\n')
  for i, m in enumerate(range(minM, maxM+1)):
    file.write(f'Arguments = "-C {n} {m} $(Step)/{numSteps} -T{distances[i]}"\n')
    file.write(f'Output = out{foldersExtension}/{n}_{m}_$(Step).out\n')
    file.write(f'Log = log{foldersExtension}/{n}_{m}_$(Step).log\n')
    file.write(f'Error = err{foldersExtension}/{n}_{m}_$(Step).err\n')
    file.write(f'Queue {numSteps}\n\n')