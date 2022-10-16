import numpy as np

import matplotlib.pyplot as plt
#from mpl_toolkits.mplot3d import Axes3D

#Load the data
some_file = 'raw_points.txt'

data = np.loadtxt(some_file)
x = data[:,0]
z = data[:,1]

xpoints =np.linspace(-55, 55, num=111)

#Fit a n order polynomial
fitxz = np.polyfit(x, z, 6)

zpoints = np.polyval(fitxz, xpoints)

plt.figure(figsize=(10, 20))
ax = plt.axes()
ax.scatter(xpoints, zpoints, c= 'red')


#make the swoop
x2 = [-10, -9, -1, 0, 1, 9, 10]
y2 = [-10, -5, 0, 0, 0, -5, -10]
swoop = np.polyfit(x2,y2,7)
x2points = np.linspace(-10,10,81)
y2points = np.polyval(swoop,x2points)
plt.figure(figsize=(10, 20))
ax = plt.axes()
ax.scatter(x2points, y2points, c= 'red')

y2points = y2points + 10
y2points = np.pad(y2points,(15,15),'constant',constant_values=(0, 0))


plt.figure(figsize=(10, 10))
ax = plt.axes(projection='3d')
ax.scatter(xpoints, y2points, zpoints, zdir='z', c= 'red')

for i in np.arange(0,110,1):
    print('[', xpoints[i], ',', y2points[i], ',', zpoints[i], ']',',')



