import sys
import csv
result = (sys.argv[1])[:-3] + 'csv'
with open(sys.argv[1], 'r+',encoding='utf-8' ) as f:
    with open(result,'w', encoding='utf-8', newline='') as f_n:
        wr = csv.writer(f_n)
        for line in f.readlines():
            x = line.split()
            #print(x)
            wr.writerow(x)
            
 