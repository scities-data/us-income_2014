# Author: Remi Louf <remi@sciti.es>
# Date:   24/03/2016
#
# Download all the data necessary to analyse the income of households
# Using the ACS 2014 data


all: 

blockgroups:
tracts:
counties:


###########################
# METROPOLITAN AREAS DATA #
###########################

# Download shapefile and crosswalks from MSA

# Crosswalk blockgroups
# Crosswalk tracts
# Crosswalk counties

data/gz/master.zip:
	curl -sL https://github.com/scities-data/metro-atlas_2014/archive/$(notdir $@).zip -o  $@.download
	mv $@.download $@

#data/crosswalks/cbsa_blockgroups.txt:



###############
# INCOME DATA #
###############



# Decompress income data
data/income/us/ACS_14_5YR_B19001.csv:
	mkdir -p $(dir $@)
	gzip -d data/gz/$(notdir $@)
	mv data/gz/$(notdir $@) $@





# Income per CBSA
## Blockgroup level 
income_blockgroup:
	mkdir -p data/income/cbsa
	python2 bin/income/blockgroups.py

## Tract level
income_tract:
	mkdir -p data/income/cbsa
	python2 bin/income/tracts.py

## County level
income_county:
	mkdir -p data/income/cbsa
	python2 bin/income/counties.py





# Compute the total population
## Per CBSA
data/counts/cbsa_households.txt:
	mkdir -p $(dir $@)
	python2 bin/counts/cbsa_population.py

## In the entire US
data/counts/us_households.txt:
	mkdir -p $(dir $@)
	python2 bin/counts/us_population.py




#
# Clean
#
clean:

