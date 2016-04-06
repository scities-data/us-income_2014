# Author: Remi Louf <remilouf@sciti.es>
# Date:   24/03/2016
#
# Download all the data necessary to analyse the income of households
# Using the ACS 2014 data
#

### Decompress income data
data/income/us/ACS_14_5YR_B19001.csv:
	mkdir -p $(dir $@)
	gzip -d data/gz/$(notdir $@)
	mv data/gz/$(notdir $@) $@
	
### Reconstitute 2000 census MSA
data/gz/List1.xls:
	mkdir -p $(dir $@)
	curl "http://www.census.gov/population/metro/files/lists/2013/$(notdir $@)" -o $@.download
	mv $@.download $@


## Download census block-groups
data/gz/tl_2014_%_bg.zip:
	mkdir -p $(dir $@)
	curl 'http://www2.census.gov/geo/tiger/TIGER2014/BG/$(notdir $@)' -o $@.download
	mv $@.download $@

data/shp/state/%/blockgroups.shp: data/gz/tl_2014_%_bg.zip
	rm -rf $(basename $@)
	mkdir -p $(basename $@)
	unzip -d $(basename $@) $<
	for file in $(basename $@)/*; do chmod 644 $$file; mv $$file $(basename $@).$${file##*.}; done
	rmdir $(basename $@)
	touch $@

download_blockgroups: data/shp/state/01/blockgroups.shp data/shp/state/02/blockgroups.shp data/shp/state/04/blockgroups.shp data/shp/state/05/blockgroups.shp data/shp/state/06/blockgroups.shp data/shp/state/08/blockgroups.shp data/shp/state/09/blockgroups.shp data/shp/state/10/blockgroups.shp data/shp/state/11/blockgroups.shp data/shp/state/12/blockgroups.shp data/shp/state/13/blockgroups.shp data/shp/state/15/blockgroups.shp data/shp/state/16/blockgroups.shp data/shp/state/17/blockgroups.shp data/shp/state/18/blockgroups.shp data/shp/state/19/blockgroups.shp data/shp/state/20/blockgroups.shp data/shp/state/21/blockgroups.shp data/shp/state/22/blockgroups.shp data/shp/state/23/blockgroups.shp data/shp/state/24/blockgroups.shp data/shp/state/25/blockgroups.shp data/shp/state/26/blockgroups.shp data/shp/state/27/blockgroups.shp data/shp/state/28/blockgroups.shp data/shp/state/29/blockgroups.shp data/shp/state/30/blockgroups.shp data/shp/state/31/blockgroups.shp data/shp/state/32/blockgroups.shp data/shp/state/33/blockgroups.shp data/shp/state/34/blockgroups.shp data/shp/state/35/blockgroups.shp data/shp/state/36/blockgroups.shp data/shp/state/37/blockgroups.shp data/shp/state/38/blockgroups.shp data/shp/state/39/blockgroups.shp data/shp/state/40/blockgroups.shp data/shp/state/41/blockgroups.shp data/shp/state/42/blockgroups.shp data/shp/state/44/blockgroups.shp data/shp/state/45/blockgroups.shp data/shp/state/46/blockgroups.shp data/shp/state/47/blockgroups.shp data/shp/state/48/blockgroups.shp data/shp/state/49/blockgroups.shp data/shp/state/50/blockgroups.shp data/shp/state/51/blockgroups.shp data/shp/state/53/blockgroups.shp data/shp/state/54/blockgroups.shp data/shp/state/55/blockgroups.shp data/shp/state/56/blockgroups.shp data/shp/state/60/blockgroups.shp data/shp/state/66/blockgroups.shp data/shp/state/69/blockgroups.shp data/shp/state/72/blockgroups.shp data/shp/state/78/blockgroups.shp 



## Download census tracts
data/gz/tl_2014_%_tract.zip:
	mkdir -p $(dir $@)
	curl 'http://www2.census.gov/geo/tiger/TIGER2014/TRACT/$(notdir $@)' -o $@.download
	mv $@.download $@

data/shp/state/%/tracts.shp: data/gz/tl_2014_%_tract.zip
	rm -rf $(basename $@)
	mkdir -p $(basename $@)
	unzip -d $(basename $@) $<
	for file in $(basename $@)/*; do chmod 644 $$file; mv $$file $(basename $@).$${file##*.}; done
	rmdir $(basename $@)
	touch $@

download_tracts: data/shp/state/01/tracts.shp data/shp/state/02/tracts.shp data/shp/state/04/tracts.shp data/shp/state/05/tracts.shp data/shp/state/06/tracts.shp data/shp/state/08/tracts.shp data/shp/state/09/tracts.shp data/shp/state/10/tracts.shp data/shp/state/11/tracts.shp data/shp/state/12/tracts.shp data/shp/state/13/tracts.shp data/shp/state/15/tracts.shp data/shp/state/16/tracts.shp data/shp/state/17/tracts.shp data/shp/state/18/tracts.shp data/shp/state/19/tracts.shp data/shp/state/20/tracts.shp data/shp/state/21/tracts.shp data/shp/state/22/tracts.shp data/shp/state/23/tracts.shp data/shp/state/24/tracts.shp data/shp/state/25/tracts.shp data/shp/state/26/tracts.shp data/shp/state/27/tracts.shp data/shp/state/28/tracts.shp data/shp/state/29/tracts.shp data/shp/state/30/tracts.shp data/shp/state/31/tracts.shp data/shp/state/32/tracts.shp data/shp/state/33/tracts.shp data/shp/state/34/tracts.shp data/shp/state/35/tracts.shp data/shp/state/36/tracts.shp data/shp/state/37/tracts.shp data/shp/state/38/tracts.shp data/shp/state/39/tracts.shp data/shp/state/40/tracts.shp data/shp/state/41/tracts.shp data/shp/state/42/tracts.shp data/shp/state/44/tracts.shp data/shp/state/45/tracts.shp data/shp/state/46/tracts.shp data/shp/state/47/tracts.shp data/shp/state/48/tracts.shp data/shp/state/49/tracts.shp data/shp/state/50/tracts.shp data/shp/state/51/tracts.shp data/shp/state/53/tracts.shp data/shp/state/54/tracts.shp data/shp/state/55/tracts.shp data/shp/state/56/tracts.shp data/shp/state/60/tracts.shp data/shp/state/66/tracts.shp data/shp/state/69/tracts.shp data/shp/state/72/tracts.shp data/shp/state/78/tracts.shp 


## Download census counties
data/gz/tl_2012_us_countyec.zip:
	mkdir -p $(dir $@)
	curl 'http://www2.census.gov/geo/tiger/TIGER2014/COUNTYEC/$(notdir $@)' -o $@.download
	mv $@.download $@

data/shp/us/counties.shp: data/gz/tl_2012_us_countyec.zip
	rm -rf $(basename $@)
	mkdir -p $(basename $@)
	unzip -d $(basename $@) $<
	for file in $(basename $@)/*; do chmod 644 $$file; mv $$file $(basename $@).$${file##*.}; done
	rmdir $(basename $@)
	touch $@

download_counties: data/shp/us/counties.shp






##################
## Prepare data ##
##################

# Crosswalks
## Crosswalk Counties and CBSA | CBSA names
data/names/cbsa_names.txt data/crosswalks/cbsa_county.txt:
	mkdir -p data/names
	mkdir -p data/crosswalks
	python2 bin/crosswalks/cbsa_county.py

## Crosswalk Tracts and CBSA
data/crosswalks/cbsa_tract:
	mkdir -p $(dir $@)
	python2 bin/crosswalks/cbsa_tract.py

## Crosswalk Blockgroups and CBSA
data/crosswalks/cbsa_blockgroup:
	mkdir -p $(dir $@)
	python2 bin/crosswalks/cbsa_blockgroup.py



# Income per CBSA
## Blockgroup level 
income_blockgroup:
	mkdir -p data/income/cbsa
	python2 bin/income/income_blockgroup.py

## Tract level
income_tract:
	mkdir -p data/income/cbsa
	python2 bin/income/income_tract.py

## County level
income_county:
	mkdir -p data/income/cbsa
	python2 bin/income/income_county.py



# Shapefiles for MSAs
## Blockgroups
shapefile_blockgroup:
	mkdir -p data/shp/cbsa
	python2 bin/shp/cbsa_blockgroup.py

## Tracts
shapefile_tract:
	mkdir -p data/shp/cbsa
	python2 bin/shp/cbsa_tract.py

## Counties
shapefile_county:
	mkdir -p data/shp/cbsa
	python2 bin/shp/cbsa_county.py



# Adjacency between areal units
## Blockgroups
adjacency_blockgroup:
	mkdir -p  data/adjacency/cbsa
	python2 bin/adjacency/blockgroups.py

## Tracts
adjacency_tract:
	mkdir -p  data/adjacency/cbsa
	python2 bin/adjacency/tracts.py

## Counties
adjacency_county:
	mkdir -p  data/adjacency/cbsa
	python2 bin/adjacency/counties.py



# Compute the surface area of areal units
## Blockgroups

## Tracts

## Counties



# Compute the total population
## Per CBSA
data/counts/cbsa_households.txt:
	mkdir -p $(dir $@)
	python2 bin/counts/cbsa_population.py

## In the entire US
data/counts/us_households.txt:
	mkdir -p $(dir $@)
	python2 bin/counts/us_population.py

