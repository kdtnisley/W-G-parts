import numpy as np

import matplotlib.pyplot as plt
#from mpl_toolkits.mplot3d import Axes3D

#Load the data
some_file = 'raw_points.txt'

data = np.loadtxt(some_file)
x = data[:,0]
y = data[:,1]
z = data[:,2]
xpoints = np.arange(0,200,1)

#Fit a 4th order polynomial
fitxy = np.polyfit(x, y, 4)
fitxz = np.polyfit(x, z, 4)

xypoints = np.polyval(fitxy, xpoints)
xzpoints = np.polyval(fitxz, xpoints)

plt.figure(figsize=(20, 10))
ax = plt.axes(projection='3d')

ax.scatter(xpoints, xypoints, xzpoints, zdir='z', c= 'red')