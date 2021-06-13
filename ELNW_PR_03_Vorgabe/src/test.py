import pandas as pd
import scipy.io
import numpy as np

mat=scipy.io.loadmat('../Vorgabe Messwerte/ELNW_PR_03_Vorgabe_Messwerte_20V.mat')

mat = {k:v for k, v in mat.items() if k[0] != '_'}
data = pd.DataFrame({k: np.array(v).flatten() for k, v in mat.items()})

data['I']=data['u_Rpp']/57
data['Z']=(data['u_Epp']/data['I']/1000)
data['I']=data['I']*1000
data['f']=data['f']/1000

print(data[0:21].to_latex(index=False,header=False,decimal=","))
print(data[21:].to_latex(index=False,header=False,decimal=","))
