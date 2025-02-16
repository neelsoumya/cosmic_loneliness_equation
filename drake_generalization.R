#########################################
# script for drake equation extension
#########################################

library(ggplot2)

# equation generalization

# variables
# The diameter of the Milky Way is 185000 light years
# https://beltoforion.de/en/drake-equation/drake-equation.php#idRef7
R_M = 46250 # light years

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
  

######################################
# TODO: Monte-Carlo
# TODO: create function to return L
######################################

i_num_simulations = 10000 # number of simulations

# Monte-Carlo technique
# f_p = 0.1   #  - Proportion of stars with planets
# Beta distribution (rbeta) for probabilities (since probabilities are between 0 and 1).
list_f_p = stats::rbeta(n = i_num_simulations, shape1 = 2, shape2 = 8) # skewed towards lower values
hist(list_f_p)

# n_e = 0.001 #  - Average number of planets per star on which life is possible
# After observations of exoplanets with the Kepler Space Telescope, researchers estimate that there may be 40 billion Earth-like planets in the Milky Way in the habitable zone of Sun-like stars or red dwarfs. This suggests that the product of 
# and  is about 0.4:
# Using rlnorm for extremely small probabilities (f_i, f_c) because these values likely span multiple orders of magnitude
list_n_e = stats::rlnorm(n = i_num_simulations, meanlog = log10(0.4),sdlog = 0.5)
hist(list_n_e)

# f_l = 0.1 #  - Proportion of planets that could support life and on which life actually develops.
list_f_l = stats::rbeta(n = i_num_simulations, shape1 = 2, shape2 = 20)
hist(list_f_l)

# f_i = 0.0000000001 #  - Proportion of planets with life on which intelligent life develops.
list_f_i = stats::rlnorm(n = i_num_simulations, meanlog = log10(1e-10), sdlog = 1.5)
hist(list_f_i)

# f_c = 0.0000000001#  - Proportion of civilizations that send detectable signals into space.
list_f_c = stats::rlnorm(n = i_num_simulations, meanlog = log10(1e-10), sdlog = 1.5)
hist(list_f_c)

# calculate lifetimes
list_L = R_M^(3/4) / ( (list_f_p * list_n_e * list_f_l * list_f_i * list_f_c)^(1/4) )

# plot distribution
hist(list_L, main = "Frequency distribution of lifetime of advanced civilizations")
hist(log10(list_L), main = "Frequency distribution of lifetime of advanced civilizations")

# ggplot

# convert to dataframe
df_L = data.frame(list_L = list_L)

df_L$list_L

ggplot(data = df_L, aes(x = list_L) )
ggplot(data = df_L, aes(x = list_L) ) + geom_histogram()

plt_hist = ggplot(data = df_L, aes(x = list_L))
plt_hist = plt_hist + geom_histogram()
# plt_hist = plt_hist + scale_x_log10()
plt_hist = plt_hist + labs(x = "Lifetime of advanced civilizations (years)", y = "Frequency")
#plt_hist = plt_hist + theme_minimal(base_size = 16) +  # Publication-ready theme
#  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())

plt_hist


plt_hist = ggplot(data = df_L, aes(x = list_L))
plt_hist = plt_hist + geom_histogram()
plt_hist = plt_hist + scale_x_log10()
plt_hist = plt_hist + labs(x = "Log10 lifetime of advanced civilizations (years)", y = "Frequency")
#plt_hist = plt_hist + theme_minimal(base_size = 16) +  # Publication-ready theme
#  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
plt_hist
