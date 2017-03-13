#!/usr/bin/env python
#-*- coding:utf-8 -*-

# import matplotlib.pyplot as plt
# import numpy as np
# import math
# import pylab
# x = np.arange(1,10,.1)
# y = np.arange(1,10,.1)
# z = [[math.cos(a)*math.sin(b) for b in y] for a in x]

# # only coutour color
# c = plt.contour(x,y,z,np.linspace(-1,1,100))
# cbar = plt.colorbar(c,orientation='vertical',ticks=np.arange(-1,1,.1))
# cbar.set_label('colorbar')
# plt.show()



# contour line, too
from pylab import *
def gaussfunc(x,y,a,b):
    return exp(-a*(x)*(x)-b*(y)*(y))

dx, dy = 0.05, 0.05
x = arange(-3.0, 3.0, dx)
y = arange(-3.0, 3.0, dy)
X,Y = meshgrid(x, y)
Z = gaussfunc(X, Y,1.0,0.5)*(Y*X+X+Y)
im = imshow(Z,origin='lower' ,alpha=.9)

cset = contour(Z, arange(-2.0,2.0,0.1), origin='lower')

clabel(cset,inline=1,fmt='%1.1f',fontsize=10)
hot()
colorbar()
show()

# Local Variables:
# quickrun-option-cmdopt:   "-MScalar::Util=looks_like_number -Mutf8"
# quickrun-option-args: "765 IdleM@ster 72"
# End:
