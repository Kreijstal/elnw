import pandas as pd
import scipy.io
import numpy as np

mat=scipy.io.loadmat('../../Vorgabe Messwerte/ELNW_PR_05_Vorgabe_Messwerte.mat')

mat = {k:v for k, v in mat.items() if k[0] != '_'}
data = pd.DataFrame({k: np.array(v).flatten() for k, v in mat.items()})


print(data)
