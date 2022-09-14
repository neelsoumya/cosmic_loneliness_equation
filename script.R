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


###########################
# basic calculations
###########################
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
N_samples = 1000 # number of samples
p_log_MIN = log10(1e-30) # minimum value of p on log scale
p_log_MAX = log10(1e-3)  # maximum value of p on log scale
p_dist_log = runif(n = N_samples, min = p_log_MIN, max = p_log_MAX)
p_dist = 10^p_dist_log

d = 1/320 # stellar density in our neighbourhood

# cosmic loneliness equation
L_dist = ( (3 * pi ) / ( 4 * p_dist * d ) )^(1/3)

L_dist

# plot L log
ggplot2::qplot( log10( L_dist), 
                xlab = 'log10 lifetime of human civilization',
                ylab = 'Frequency'
                )

summary( (L_dist)  )

ggplot2::qplot(x = p_dist_log, y = L_dist)

ggplot2::qplot(y = p_dist_log, x = L_dist, 
               xlab = 'Lifetime of human civilization',
               ylab = 'log10 probability of advanced civilization')

# ggplot2::qplot(y = log10(p_dist_log + 0.1), x = log10(L_dist + 0.1) )
ggplot2::qplot(y = p_dist_log, x = log10(L_dist), 
               xlab = 'log10 lifetime of human civilization',
               ylab = 'log10 probability of advanced civilization
               ')

