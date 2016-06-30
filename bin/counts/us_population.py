"""us_population.py

Script to compute the total number of households there are in the US.
"""
import csv


## Import the list of MSA
cbsa = {}
with open('data/misc/cbsa_names.txt', 'r') as source:
    reader = csv.reader(source, delimiter='\t')
    reader.next()
    for rows in reader:
        cbsa[rows[0]] = rows[1]


## Get the total number of households per MSA
households = {}
for city in cbsa:
    households[city]=0
    with open('data/income/cbsa/%s/blockgroups.txt'%city, 'r') as source:
        reader = csv.reader(source, delimiter='\t')
        reader.next()
        for rows in reader:
            households[city] += sum(map(int, rows[1:]))


us_households = sum(households.values())



## Save the data
with open('data/counts/us.txt', 'w') as output:
    output.write('Number of households\n')
    output.write('%s'%us_households)
