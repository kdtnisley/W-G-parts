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
x2 = [-5, -4, 0, 4, 5]
y2 = [-10, -5,  0 , 5, 10]
swoop = np.polyfit(x2,y2,5)
x2points = np.linspace(-5,5,21)
y2points = np.polyval(swoop,x2points)
plt.figure(figsize=(10, 20))
ax = plt.axes()
ax.scatter(x2points, y2points, c= 'red')





#ax = plt.axes(projection='3d')
#ax.scatter(xzpoints, yzpoints, zpoints, zdir='z', c= 'red')

for i in np.arange(0,110,1):
    print('[', xpoints[i], ',', 0, ',', zpoints[i], ']',',')
    
#for i in np.arange(0,24,1):
#    print('[', data[i,0], ',', data[i,1], ',', data[i,2], ']',',')