import sys
import csv

with open(sys.argv[1], 'r+',encoding='utf-8' ) as f:
    with open('result.csv','w', encoding='utf-8', newline='') as f_n:
        wr = csv.writer(f_n)
        for line in f.readlines():
            x = line.split()
            #print(x)
            wr.writerow(x)
            
 