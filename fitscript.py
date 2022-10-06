import numpy as np

import matplotlib.pyplot as plt
#from mpl_toolkits.mplot3d import Axes3D

#Load the data
some_file = 'raw_points.txt'

data = np.loadtxt(some_file)
x = data[:,0]
y = data[:,1]
z = data[:,2]
zpoints = np.arange(0,200,1)

#Fit a 4th order polynomial
fitxz = np.polyfit(z, x, 6)
fityz = np.polyfit(z, y, 6)

xzpoints = np.polyval(fitxz, zpoints)
yzpoints = np.polyval(fityz, zpoints)

plt.figure(figsize=(20, 10))
ax = plt.axes(projection='3d')

ax.scatter(xzpoints, yzpoints, zpoints, zdir='z', c= 'red')

for i in zpoints:
    print('[', xzpoints[i], ',', yzpoints[i], ',', zpoints[i], ']',',')
    
#for i in np.arange(0,24,1):
#    print('[', data[i,0], ',', data[i,1], ',', data[i,2], ']',',')