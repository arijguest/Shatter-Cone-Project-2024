import pandas as pd
import os
import locale
locale.setlocale(locale.LC_NUMERIC, "en_DK.UTF-8")

''' --- import file --- '''
#file = "A:\RamanHyperspec\RawData\Ari Guest_12.04.24\SC3-3\qz-map\quartz_map.txt"
file = "A:\RamanHyperspec\RawData\SC2-1-AP10x-MAP.txt"
file = file.rsplit('.',1)[0]
# import RAW .txt file into dataframe
_df = pd.read_csv(file+'.txt', sep='\t', index_col=False, decimal=',',header=None)
_df = _df.replace(',','', regex=True)
# set origin to zero
_df[0] = _df[0].sub(_df[0].min())
_df[1] = _df[1].sub(_df[1].min())

''' --- background reduction --- '''
# If the background reduced files exist, load them. Else, perform background reduction.
from raman_hypmap import hyprocess
if os.path.exists(file+'_bgr.csv') and os.path.exists(file+'_raw.csv'):
    _df_bgr = pd.read_csv(file+'_bgr.csv', sep=',', index_col=False,header=None)
    _df_raw = pd.read_csv(file+'_raw.csv', sep=',', index_col=False,header=None)
else:
    _df_bgr = hyprocess.bgr_process(_df,file)

''' --- mineral filter --- '''
#window_location = "A:\RamanHyperspec\RawData\Ari Guest_12.04.24\SC3-3\qz-map\_window_ranges.csv"
window_location = "A:\RamanHyperspec\RawData\_window_ranges.csv"
hyprocess.filter_window(_df_bgr,file+'_bgr',window_location)

''' --- interactive hyperspectral map --- '''
_df_filtered = pd.read_csv(file+'_bgr_w_filter.csv', sep=',', index_col=False)
hyprocess.hypmap_plot(_df_filtered,_df_raw,file)

exit()