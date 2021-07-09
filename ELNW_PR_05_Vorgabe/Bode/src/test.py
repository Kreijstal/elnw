import pandas as pd
import scipy.io
import numpy as np

mat=scipy.io.loadmat('../../Vorgabe Messwerte/ELNW_PR_05_Vorgabe_Messwerte.mat')

mat = {k:v for k, v in mat.items() if k[0] != '_'}
data = pd.DataFrame({k: np.array(v).flatten() for k, v in mat.items()})
data["absH"]=20*np.log10(data.U_App/data.U_Epp)
data["arg"]=360*data.f*data.dt
data["dt"]=data.dt*10e6

print(data.reindex(
    columns=['f','U_Epp','U_App','dt','absH','arg'])
    .to_latex(index=False,header=False,decimal=","))