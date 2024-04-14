#########################################
# script for drake equation extension
#########################################

library(ggplot2)

# equation generalization

# variables
# The diameter of the Milky Way is 185000 light years
# https://beltoforion.de/en/drake-equation/drake-equation.php#idRef7
R_M = 92500 # light years

###################
# scenario 1
###################

f_p = 1   #  - Proportion of stars with planets
n_e = 0.4 #  - Average number of planets per star on which life is possible
# After observations of exoplanets with the Kepler Space Telescope, researchers estimate that there may be 40 billion Earth-like planets in the Milky Way in the habitable zone of Sun-like stars or red dwarfs. This suggests that the product of 
# and  is about 0.4:
f_l = 0.1 #  - Proportion of planets that could support life and on which life actually develops.
f_i = 0.001 #  - Proportion of planets with life on which intelligent life develops.
f_c = 0.1#  - Proportion of civilizations that send detectable signals into space.


L = R_M^(3/4) / ( (f_p * n_e * f_l * f_i * f_c)^(1/4) )

print(L)
print("Scenario 1  \n")
print(L)
print("  years \n ")


##########################
# Scenario 2: Optimistic
##########################

f_p = 1   #  - Proportion of stars with planets
n_e = 0.4 #  - Average number of planets per star on which life is possible
# After observations of exoplanets with the Kepler Space Telescope, researchers estimate that there may be 40 billion Earth-like planets in the Milky Way in the habitable zone of Sun-like stars or red dwarfs. This suggests that the product of 
# and  is about 0.4:
f_l = 1 #  - Proportion of planets that could support life and on which life actually develops.
f_i = 0.5 #  - Proportion of planets with life on which intelligent life develops.
f_c = 0.5#  - Proportion of civilizations that send detectable signals into space.


L = R_M^(3/4) / ( (f_p * n_e * f_l * f_i * f_c)^(1/4) )

print(L)
print("Scenario 2  \n")
print(L)
print("  years \n ")

# Even in the optimistic scenario, it will take us approximately 10000 years to detect intelligent life



##########################
# Scenario 3: Pessimistic
##########################

f_p = 0.1   #  - Proportion of stars with planets
n_e = 0.001 #  - Average number of planets per star on which life is possible
# After observations of exoplanets with the Kepler Space Telescope, researchers estimate that there may be 40 billion Earth-like planets in the Milky Way in the habitable zone of Sun-like stars or red dwarfs. This suggests that the product of 
# and  is about 0.4:
f_l = 0.1 #  - Proportion of planets that could support life and on which life actually develops.
f_i = 0.0000000001 #  - Proportion of planets with life on which intelligent life develops.
f_c = 0.0000000001#  - Proportion of civilizations that send detectable signals into space.


L = R_M^(3/4) / ( (f_p * n_e * f_l * f_i * f_c)^(1/4) )

print(L)
print("Scenario 3  \n")
print(L)
print("  years \n ")

#Approximately 9 billion years
#9432054457 years Our civilization needs to be very long-lived in order to detect
#intelligent life in the Galaxy
  

#############################
# TODO: Monte-Carlo
#############################
