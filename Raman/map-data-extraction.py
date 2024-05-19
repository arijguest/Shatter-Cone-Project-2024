import os
import pandas as pd
from raman_hypmap import hyprocess

# Load the hyperspectral map
file = "A:\\RamanHyperspec\\RawData\\Ari Guest_12.04.24\\SF3\\map\\SF3_map.txt"
file = file.rsplit('.',1)[0]
_df = pd.read_csv(file+'.txt', sep='\t', index_col=False, decimal=',',header=None)
_df = _df.replace(',','', regex=True)

# Create a new directory to save the spectra
new_dir = "A:\\RamanHyperspec\\RawData\\SF3MapSpectra"
os.makedirs(new_dir, exist_ok=True)

# Get the base name of the file
base_file = os.path.basename(file)

# Get the Raman shift values
raman_shift = _df.iloc[0, 2:]

# Iterate over the map
for i in range(1, len(_df)):
    row = _df.iloc[i]
    # Skip the first column (y coordinates)
    spectra = row[2:]
    
    # Create a DataFrame for the spectra
    spectra_df = pd.DataFrame({
        'Raman Shift': raman_shift,
        'Intensity': spectra
    })
    
    # Create a filename that includes the pixel coordinates and the name of the original map
    filename = f'{new_dir}/{base_file}_x{row[0]}_y{i}.csv'
    
    # Save the spectra to a file
    spectra_df.to_csv(filename, index=False)
