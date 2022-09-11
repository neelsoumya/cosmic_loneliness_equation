#################################################
# Code to calculate the minimum value 
# of the lifetime of an advanced civilization
# so that it can detect the presence of another
# advanced radio transmitting civilization
##################################################

###########################
# load libraries
###########################
library(ggplot2)


c = (240 * pi)^(1/3)


(240 * pi)^(1/3)


p = 1e-12

L = c/ ( p^(1/3)  )

L

#####################
# general equation
#####################

d = 1/320

p = 1e-12

L = ( (3 * pi ) / ( 4 * p * d ) )^(1/3)

L


d = 1/320

p = 1e-15

L = ( (3 * pi ) / ( 4 * p * d ) )^(1/3)

L


############################
# sample p, d and plot L
############################

# sample from uniform distribution for log10(p)
p_dist_log = runif(n = 1000, min = log10(1e-30), max = log10(1e-3))
p_dist = 10^p_dist_log

d = 1/320

L_dist = ( (3 * pi ) / ( 4 * p_dist * d ) )^(1/3)

L_dist

# plot L log
ggplot2::qplot( log10( L_dist) )

