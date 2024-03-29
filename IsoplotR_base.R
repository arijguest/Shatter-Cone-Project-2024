library(IsoplotR)

# Read the csv file
data <- read.csv("A:/UPb Steinheim Data/UPb-Steinheim_IsoplotR_test.csv", 
  header = TRUE # dataset has a header
)
data <- as.matrix(data)# Convert the data to a matrix

# Rename column names after import (IsoplotR takes a specific format)
colnames(data) <- c("X=38/06", "err[X]", "Y=07/06", "err[Y]", "(C)", "(comment)")

# Read the data using IsoplotR
sc <- read.data(data, 
  method = 'U-Pb', # U-Pb analysis type
  format = 2, # csv header format for 238/206 207/206
  ierr = 4, # 2sigma% errors
)

# Plot the Concordia diagram
concordia(
  sc, # dataset, set header format
  tlim = NULL, # concordia line age limits
  xlim=c(0,80), # x axis limits
  ylim=c(0, 1), # y axis limits
  type = 2, # Tera-Wasserburg
  #levels = col, # supposed to set series colours - doesn't work!
  show.numbers = TRUE, # display row number of the sample?
  clabel = "Key", # color legend label
  #ellipse.fill = NA,
  #ellipse.stroke = col, # error elipse line colour
  concordia.col = "black", # concordia line colour
  exterr = FALSE, # show decay constant uncertainties?
  show.age = 2, # see documentation, Tera-Wasserburg
  oerr = 2, # 2sigma errors
  sigdig = 4, # age sig figs
  common.Pb = 0, # no common lead projection
  ticks = c(140, 350, 700, 1400, 3500), # vector including desired tick ages
  anchor = 0, # do not fix isochron
  #hide = c(53, 50, 28, 27, 26, 25, 14, 24, 23, 21, 20, 18, 13, 19, 12),
  #hide = c(1, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 35, 36, 37, 39, 40, 41, 42, 43, 44, 45, 46, 50, 51, 53, 56), # Add data to omit here if needed
  omit = c(1, 11, 15, 16, 17, 22, 35, 36, 37, 39, 40, 41, 42, 43, 44, 45, 46, 48, 51, 56), 
  omit.fill = NA,
  omit.stroke = "red"
)
