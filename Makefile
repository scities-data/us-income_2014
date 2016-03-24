# Author: Remi Louf <remilouf@sciti.es>
# Date:   24/03/2016
#
# Download all the data necessary to analyse the income of households
# Using the ACS 2014 data
#

### Decompress income data
#data/income/us/household_incomes.csv:
	#gzip -d $@

### Reconstitute 2000 census MSA
#data/crosswalks/msa_county.csv data/names/msa.csv: data/gz/99mfips.txt
	#mkdir -p data/crosswalks
	#mkdir -p data/names	
	#python bin/data_prep/crosswalk_msa_county.py

#data/gz/99mfips.txt:
	#mkdir -p $(dir $@)
	#curl "http://www.census.gov/population/metro/files/lists/historical/$(notdir $@)" -o $@.download
	#mv $@.download $@


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
data/gz/tl_2014_us_county.zip:
	mkdir -p $(dir $@)
	curl 'http://www2.census.gov/geo/tiger/TIGER2014/COUNTY/$(notdir $@)' -o $@.download
	mv $@.download $@

data/shp/us/counties.shp: data/gz/tl_2014_us_county.zip
	rm -rf $(basename $@)
	mkdir -p $(basename $@)
	unzip -d $(basename $@) $<
	for file in $(basename $@)/*; do chmod 644 $$file; mv $$file $(basename $@).$${file##*.}; done
	rmdir $(basename $@)
	touch $@

download_counties: data/shp/us/counties.shp
