Last edited:  March 2026

# Nutritional content of winter phytoplankton communities under ice

Authors: Michael F. Meyer, Stephanie E. Hampton, Matthew R. Brousil, Joshua A. Culpepper, Hilary A. Dugan, Aaron W.E. Galloway, Noah R. Lottig, Stephen M. Powers, Sapna Sharma, Kirill Shchapov

Points of Contact: Michael Meyer (mfmeyer@usgs.gov) and Stephanie Hampton (sehampton@ucdavis.edu)

Repository Type: R scripts supporting publication

Year of Origin: 2025 (Original Publication)

Year of Version: 2025

Digital Object Identifier (DOI): TBD

USGS Information Product Data System (IPDS) no.: TBD (internal agency tracking)

## Respository Contents 

This repository contains scripts for the associated manuscript 
"Nutritional content of winter phytoplankton communities in a varying under-ice light environment".
The goal of the scripts contained within this repository is to support the main analyses 
presented in the manuscript. 

The repository is meant to contain all scripts, data, and figures
relating to the project. The authors structured the project with a few
components that they hope will allow for others to be able to work most
efficiently, but they recognize that this may not be realized. If you
have suggestions for improvements, please feel free to send them over
email to Michael (mfmeyer@usgs.gov).

The manuscript uses data from the [Ecology Under Lake Ice](https://doi.org/10.5063/F12V2D1V), 
the [North Temperate Lakes LTER](https://lter.limnology.wisc.edu/core-datasets/), and 
[characteristic fatty acid profiles](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0130053#sec015). 

The directories for this analysis need to be structured according to the tree:
```
├───Data
│   └───PLoS_supp
├───Figures
└───Scripts
```
where data are read from and written to `Data`. 

The ultimate goal of the analysis is to ask:
1. How lake ice and snow cover influence the under-ice light environment,
2. How lake ice and snow cover influence under-ice algal productivity,
3. How lake ice cover is associated with characteristic algal communities, 
4. How algal communities under ice are associated with particular fatty acid profiles. 

## Repository Organization

- `Scripts/map_revised.R`: This script takes locational data from the Ecology Under Lake Ice (EULI) and North Temperate Lakes Long Term Ecology Research (NTL-LTER) and plots them on a map. 
    - `Inputs`: Locational data from EULI and NTL-LTER 
    - `Outputs`: A png of all locations on a map. 
- `Scripts/par_chla_plts.R`: This script takes data from NTL-LTER and runs a series of plotting and statistical modeling functions. 
    - `Inputs`: PAR, Snow, Chlorophyll, and Ice Quality data from NTL-LTER to produce a series of plots and statistical models for characterizing the under-ice environment.  
    - `Outputs`: 3 pngs of core analyses for the manuscript.  
- `Scripts/mult_lin_reg.R`: This script produces linear models for the associated relationships established in `par_chla_plts.R`
    - `Inputs`: Aggregated CSVs generated from `par_chla_plts.R`. 
    - `Outputs`: None.
- `Scripts/euli_fa_seasonal_analysis_other-rm.R`: This script performs analyses of under-ice phytoplankton fatty acid profiles from the Ecology Under Ice records.  
    - `Inputs`: EULI dataset as well as characteristic fatty acid profiles 
    - `Outputs`: Several pngs and CSVs of targeted fatty acid analyses.  
- `Scripts/lter_fa_seasonal_analysis.R`: This script performs analyses of under-ice phytoplankton fatty acid profiles from the NTL-LTER records.  
    - `Inputs`: NTL phytoplankton community assemblages for Lakes Mendota and Monon as well as characteristic fatty acid profiles 
    - `Ouputs`: Several pngs and CSVs of targeted fatty acid analyses.
- `Scripts/post_review_fa_ice_quality.R`: This script performs analyses of under-ice fatty acid compositions with the percentage of white ice. 
    - `Inputs`: Fractional white ice data as well as aggregated fatty acid data. 
    - `Outputs`: Tables that summarize linear models. 
- `Data`: All input data and derived outputs with a tabular structure should be contained here. 
- `Figures`: All figures should be output here. 
- `.gitignore`: A file specifying which files should not be tracked in the git repository. 

## Setup and Package Installation

The scripts contained herein were run using R version 4.4.2.

Necessary Packages to run this codebase include:
- [tidyverse](https://cran.r-project.org/web/packages/tidyverse/index.html)
- [vegan](https://cran.r-project.org/web/packages/vegan/index.html)
- [RColorBrewer](https://cran.r-project.org/web/packages/RColorBrewer/index.html)
- [grid](https://cran.r-project.org/src/contrib/Archive/grid/)
- [gridExtra](https://cran.r-project.org/web/packages/gridExtra/index.html)
- [lubridate](https://cran.r-project.org/web/packages/lubridate/index.html)
- [boot](https://cran.r-project.org/web/packages/boot/index.html)
- [ggpubr](https://cran.r-project.org/web/packages/ggpubr/index.html)
- [janitor](https://cran.r-project.org/web/packages/janitor/index.html)
- [oslrr](https://cran.r-project.org/web/packages/olsrr/index.html)
- [ggpmisc](https://cran.r-project.org/web/packages/ggpmisc/index.html)
- [rgdal](https://cran.r-project.org/src/contrib/Archive/rgdal/)
- [broom](https://cran.r-project.org/web/packages/broom/index.html)
- [ggrepel](https://cran.r-project.org/web/packages/ggrepel/index.html)
- [viridsLite](https://cran.r-project.org/web/packages/viridisLite/index.html)

## Running the code

This code has been organized in piecemeal scripts. Providing that the end user has downloaded the data, they can be run in the order detailed above. 

## Built With

-   [R](https://www.r-project.org/about.html) - data formatting and processing

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on the process for submitting pull requests to us. Please read [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) for details on adhering by the [USGS Code of Scientific Conduct](https://www2.usgs.gov/fsp/fsp_code_of_scientific_conduct.asp).

## Code run time

All scripts can be run within ~10 minutes on high speed laptop. 

## Expertise required

This code assumes the end user is familiar with both R and limnological expertise. However, much of the domain expertise can be gleaned from the main associated manuscript. 

A main limitation with domain expertise comes when considering winter limnology and fatty acid of phytoplakton. A primer on these topics for those working with this repository can be found via the references below:
- Galloway, A. W. E., and M. Winder. 2015. Partitioning the Relative Importance of Phylogeny and Environmental Conditions on Phytoplankton Fatty Acids. PLOS ONE 10: e0130053. doi:10.1371/journal.pone.0130053
- Hampton, S. E. and others. 2017. Ecology under lake ice J. Grover [ed.]. Ecology Letters 20: 98–111. doi:10.1111/ele.12699

## Authors

- [Michael F Meyer](https://www.usgs.gov/staff-profiles/michael-f-meyer) - U.S. Geological Survey
- [Stephanie E Hampton](https://tahoe.ucdavis.edu/people/stephanie-hampton) - Tahoe Environmental Research Center
- [Matthew R Brousil](https://rossyndicate.com/author/matt-brousil-he/him/) - Colorado State University
- [Joshua A Culpepper](https://sharmalab.wordpress.com/people/) - York University
- [Hilary A Dugan](https://integrativebiology.wisc.edu/staff/dugan-hilary/) - University of Wisconsin-Madison
- [Aaron WE Galloway](https://cas.uoregon.edu/directory/natural-sciences/all/agallow3) - University of Oregon
- [Noah Lottig](https://limnology.wisc.edu/staff/lottig-noah/) - University of Wisconsin-Madison
- [Stephen M Powers](https://biology.artsandsciences.baylor.edu/person/steve-powers-phd) - Baylor University
- [Sapna Sharma](https://sharmalab.wordpress.com/people/) - York University
- [Kirill Shchapov](https://www.cawthron.org.nz/our-people/kirill-shchapov/) - Cawthron Institute

## License

This project is licensed under the Creative Commons CC0 1.0 Universal License - see the [LICENSE.md](LICENSE.md) file for details.

## Suggested Citation

In the spirit of open source, please cite any re-use of the source code stored in this repository. Below is the suggested citation:

Meyer, MF, S. E. Hampton, and others. 2025. Nutritional content of winter phytoplankton communities under ice. U.S. Geological Survey software release. Reston, VA. TBD.

# Disclaimer
This software is preliminary or provisional and is subject to revision.
It is being provided to meet the need for timely best science. The
software has not received final approval by the U.S. Geological Survey
(USGS). No warranty, expressed or implied, is made by the USGS or the
U.S. Government as to the functionality of the software and related
material nor shall the fact of release constitute any such warranty. The
software is provided on the condition that neither the USGS nor the U.S.
Government shall be held liable for any damages resulting from the
authorized or unauthorized use of the software.
