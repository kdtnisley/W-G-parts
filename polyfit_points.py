import numpy as np

#Load the data
some_file = 'raw_points.txt'

data = np.loadtxt(some_file)
x = data[:,0]
y = data[:,1]
z = data[:,2]

#Fit a 4th order polynomial
fitxy = np.polyfit(x, y, 4)
fitxz = np.polyfit(x, z, 4)