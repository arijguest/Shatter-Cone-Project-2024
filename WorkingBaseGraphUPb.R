library(IsoplotR)

# Read the csv file
data <- read.csv("A:/UPb Steinheim Data/UPb-Steinheim_IsoplotR_test.csv", 
  header = TRUE # dataset has a header
)
data <- as.matrix(data)# Convert the data to a matrix

# Rename column names
colnames(data) <- c("X=38/06", "err[X]", "Y=07/06", "err[Y]", "(C)", "(comment)")

# Read the data using IsoplotR
sc <- read.data(data, 
  method = 'U-Pb', # U-Pb analysis type
  format = 2, # csv header format for 238/206 207/206
  ierr = 4, # 2sigma% errors
)

# Define colour series (colourblind friendly)
col <- data[, "(C)"]
#col <- c("#56B4E9", "#D55E00", "#E69F00", "#009E73")

# Define sample name
id <- data[, "(comment)"]

# Define colour series (colourblind friendly)
col <- data[, "(C)"]

# Create a named vector of colors for each sampleid
color_vector <- setNames(col, id)

# Plot the Concordia diagram
concordia(
  sc, # dataset
  tlim = NULL, # concordia line age limits
  xlim=c(0, 80), # x axis limits
  ylim=c(0, 1), # y axis limits
  type = 2, # Tera-Wasserburg
  levels = color_vector, # use the color_vector for levels
  show.numbers = TRUE,
  clabel = "Key", # color legend label
  ellipse.fill = NA,
  #ellipse.stroke = NA, # error elipse line colour
  concordia.col = "black", # concordia line colour
  exterr = FALSE, # show decay constant uncertainties?
  show.age = 2, # see documentation
  oerr = 2, # 2sigma% errors
  sigdig = 2, # age sig figs
  common.Pb = 0, # no common lead projection
  ticks = c(140, 350, 700, 1400, 3500), # vector including desired tick ages
  anchor = 0, # do not fix isochron
  omit = NA, # Add data to omit here if needed
  omit.fill = NA,
  omit.stroke = "red"
)
