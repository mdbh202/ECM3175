import pandas as pd
import os

dir_path = 'data/simulations/angular-acc/'
for f in sorted(os.listdir(dir_path)):
    if f.endswith('.xlsx') or f.endswith('.xls'):
        try:
            if f.endswith('.xlsx'):
                df = pd.read_excel(os.path.join(dir_path, f))
            else:
                df = pd.read_csv(os.path.join(dir_path, f), sep='\t')
            
            # Print file name and column names
            print(f"{f}: {list(df.columns)}")
            
            # Check for any column with 'rad/s' or 'angular'
            cols = [c for c in df.columns if 'rad/s' in str(c) or 'angular' in str(c).lower()]
            if cols:
                print(f"  FOUND {cols}")
        except Exception as e:
            pass
