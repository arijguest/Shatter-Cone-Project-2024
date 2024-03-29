library(IsoplotR)

# Read the csv file
data <- read.csv("A:\Geochron Data LAICPMS\Shatter-Cone-Project-2024\Santa-Fe\Santa-Fe-Data\UPb-SantaFe_IsoplotR_input.csv", 
  header = TRUE # dataset has a header
)
data <- as.matrix(data) # Convert the data to a matrix

# Rename column names after import (IsoplotR takes a specific format)
colnames(data) <- c("X=38/06", "err[X]", "Y=07/06", "err[Y]")

# Read the data using IsoplotR
sf <- read.data(data, 
  method = 'U-Pb', # U-Pb analysis type
  format = 2, # csv header format for 238/206 207/206
  ierr = 4, # 2sigma% errors
)

# Plot the first T-W diagram
#1777/112 Ma, n = 18, MSWD = 0.77, p = 0.72
#Omit: 2, 3, 18, 26, 21, 15, 27, 13, 7
#d1777 <- concordia(
  sf, # dataset, set header format
  tlim = NULL, # concordia line age limits
  xlim = c(0,2.5), # x axis limits
  ylim = c(0, 1), # y axis limits
  type = 2, # Tera-Wasserburg
  #levels = col, # supposed to set series colours - doesn't work!
  show.numbers = FALSE, # display row number of the sample?
  #clabel = "Key", # color legend label
  ellipse.fill = topo.colors(n=100,alpha=0.3),
  ellipse.stroke = "#9370DB", # error elipse line colour
  #concordia.col = "black", # concordia line colour
  exterr = FALSE, # show decay constant uncertainties?
  show.age = 2, # see documentation, Tera-Wasserburg
  oerr = 2, # 2sigma errors
  sigdig = 2, # age sig figs
  common.Pb = 0, # no common lead projection
  #ticks = , # vector including desired tick ages
  anchor = 0, # do not fix isochron
  #hide = c(21, 15, 27, 13, 7), # Add data to hide here if needed
  omit = c(2, 3, 18, 26, 21, 15, 27, 13, 7), #1777/112 Ma, n = 18, MSWD = 0.77, p = 0.72
  omit.fill = NA,
  omit.stroke = "yellow"
)

# Plot second T-W diagram
#1132/217 Ma, n=17, MSWD = 0.65, p = 0.84
#Omit: 2, 3, 15, 26, 18, 27, 13, 7, 12, 5
d1132 <- concordia(
  sf, # dataset, set header format
  tlim = NULL, # concordia line age limits
  xlim = c(0,2.5), # x axis limits
  ylim = c(0, 1), # y axis limits
  type = 2, # Tera-Wasserburg
  #levels = col, # supposed to set series colours - doesn't work!
  show.numbers = FALSE, # display row number of the sample?
  #clabel = "Key", # color legend label
  ellipse.fill = topo.colors(n=100,alpha=0.3),
  ellipse.stroke = "#9370DB", # error elipse line colour
  #concordia.col = "black", # concordia line colour
  exterr = FALSE, # show decay constant uncertainties?
  show.age = 2, # see documentation, Tera-Wasserburg
  oerr = 2, # 2sigma errors
  sigdig = 2, # age sig figs
  common.Pb = 0, # no common lead projection
  #ticks = , # vector including desired tick ages
  anchor = 0, # do not fix isochron
  #hide = c(21, 15, 27, 13, 7), # Add data to hide here if needed
  omit = c(2, 3, 13, 15, 18, 26, 27, 12, 5, 7), # 1132/217 Ma, n=17, MSWD = 0.65, p = 0.84
  omit.fill = NA,
  omit.stroke = "yellow"
)

