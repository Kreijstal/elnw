import pandas as pd
import scipy.io
a=pd.read_csv('3_Messwerte.csv', sep=';', decimal=",")


b=scipy.io.loadmat('ELNW_PR_02_Vorgabe_Messwerte.mat')
print(b)