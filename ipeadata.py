# -*- coding: utf-8 -*-
"""verx.ipynb

Automatically generated by Colab.

Original file is located at
    https://colab.research.google.com/drive/1Zqsy4gL-2XJxp7jGCks4zBjqd_sr9BXp
"""

!pip install ipeadatapy
!pip install --upgrade ipeadatapy
!pip install pandas
!pip install requests

#https://github.com/luanborelli/ipeadatapy/blob/master/notebooks/Ipeadatapy%20Usage%20Demonstration.ipynb

import ipeadatapy
import pandas as pd

# Fetch data from IPEA (Example: GDP data)
data = ipeadatapy.timeseries('PAN12_IPCAG12')
data = data.rename(columns={'VALUE ((% a.a.))': 'VALUE'})

# output_file = r"C:\caminho\para\pasta\IPCA.txt"
# Save data to a TXT file
output_file = "C:\\Users\\vitor-pc\\Desktop\\Verx\\IPCA.txt"
data.to_csv(output_file, sep=';', index=False)  # Tab-separated format

#print(f"Data saved to {output_file}")

from google.colab import files
files.download(output_file)

import ipeadatapy
import pandas as pd

# Fetch data from IPEA (Example: GDP data)
data = ipeadatapy.timeseries('BM12_PIB12')

# Save data to a TXT file
data = data.rename(columns={'VALUE (R$)': 'VALUE'})
output_file = "C:\\Users\\vitor-pc\\Desktop\\Verx\\PIB.txt"
data.to_csv(output_file, sep=';', index=False)  # Tab-separated format

#print(f"Data saved to {output_file}")

from google.colab import files
files.download(output_file)

import ipeadatapy
import pandas as pd

#idpy.list_series(code="WEO_DESEMWEOBRA")
#idpy.list_series(name="Brasil - taxa de desemprego")
data = ipeadatapy.timeseries('WEO_DESEMWEOBRA')
data = data.rename(columns={'VALUE ((%))': 'VALUE'})

# Save data to a TXT file
output_file = "C:\\Users\\vitor-pc\\Desktop\\Verx\\taxaDesemprego.txt"
data.to_csv(output_file, sep='\t', index=False)  # Tab-separated format

#print(f"Data saved to {output_file}")

from google.colab import files
files.download(output_file)