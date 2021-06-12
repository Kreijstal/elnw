import pandas as pd
import scipy.io
import numpy as np

mat=scipy.io.loadmat('../Vorgabe Messwerte/ELNW_PR_03_Vorgabe_Messwerte.mat')
mat = {k:v for k, v in mat.items() if k[0] != '_'}
data = pd.DataFrame({k: np.array(v).flatten() for k, v in mat.items()})

#data['u_R']=data['u_E']-data['u_C']
#data['i']=data['u_R']
#data['t_tat']=a['ttat']
print(data)
#print(data.reindex(
#    columns=['t_mess','t_tat','u_E','u_C','u_R','i'])
#    .to_latex(index=False,header=False))