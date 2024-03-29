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

# Define sample name
id <- data[, "(comment)"]

# Create a factor from the 'id' vector
id_factor <- factor(id, levels = unique(id)) # Reorder the levels to match the order of the 'id' vector

# Define colour series (colourblind friendly)
#col <- unlist(c("#56B4E9", "#D55E00", "#E69F00", "#009E73")) # Add this line if you want to specify your own colors
col <- c('#56B4E9', '#D55E00', '#D55E00', '#D55E00', '#D55E00', '#D55E00', '#D55E00', '#D55E00', '#D55E00', '#D55E00', 
         '#D55E00', '#E69F00', '#E69F00', '#E69F00', '#E69F00', '#E69F00', '#E69F00', '#E69F00', '#E69F00', '#E69F00', 
         '#E69F00', '#E69F00', '#E69F00', '#E69F00', '#E69F00', '#E69F00', '#E69F00', '#E69F00', '#E69F00', '#E69F00', 
         '#E69F00', '#E69F00', '#E69F00', '#E69F00', '#E69F00', '#E69F00', '#E69F00', '#E69F00', '#009E73', '#009E73', 
         '#009E73', '#009E73', '#009E73', '#009E73', '#009E73', '#009E73', '#009E73', '#009E73', '#009E73', '#009E73', 
         '#009E73', '#009E73', '#009E73', '#009E73', '#009E73', '#009E73')

# Create a named vector of colors for each level of 'id_factor'
color_vector <- setNames(col, levels(id_factor))

# Plot the Concordia diagram
concordia(
  sc, # dataset
  tlim = NULL, # concordia line age limits
  xlim=c(0, 80), # x axis limits
  ylim=c(0, 1), # y axis limits
  type = 2, # Tera-Wasserburg
  levels = col, # use the color_vector for levels
  show.numbers = TRUE,
  clabel = "Key", # color legend label
  ellipse.fill = NA,
  ellipse.stroke = col, # use the color_vector for ellipse.stroke
  concordia.col = "black", # concordia line colour
  exterr = FALSE, # show decay constant uncertainties?
  show.age = 2, # see documentation
  oerr = 2, # 2sigma absolute errors
  sigdig = 2, # age sig figs
  common.Pb = 0, # no common lead projection
  ticks = c(140, 350, 700, 1400, 3500), # vector including desired tick ages
  anchor = 0, # do not fix isochron
  omit = NA, # Add data to omit here if needed
  omit.fill = NA,
  omit.stroke = "red"
)

