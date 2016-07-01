# Household income for 2014 Core Based Statistical Areas

The code in this repository allows to extract the income data for households as
given by the 5-YEAR estimate of the 2014 American Community Survey for census
geographies (blockgroups, tracts, counties) for each CBSA.

Data were obtained from the 2014 American Community Survey. Details about the data are
accessible [on the Census Bureau's website](http://www.census.gov/programs-surveys/acs/methodology/design-and-methodology.html).

# Use

To install the necessary python libraries, type

```bash
(sudo) pip install -r requirements.txt
```

Then, to obtain 2014 household income data for, say blockgroups, type

```bash
make blockgroups
```

Typing `make` will prepare income data for counties, tracts and blockgroups.


# License

The code is distributed under the BSD license. See the LICENSE file for details.

```
Copyright (c) Scities
Rémi Louf <remi@sciti.es>
```
