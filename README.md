# Code for analysis in "Emergent climate change signals within Antarctic sea ice and associated ecosystems"

Processing and plotting scripts for manuscript on Antarctic ecosystem Time of Emergence project, in *Nature Climate Change*

## Directories within this repository folder:

### environment
	* Includes yaml file for creating the Python environment used in this analysis
	

### plotting_notebooks

	* Includes notebooks for making all the figures in the manuscript (including Extended data figures)

### processing_notebooks

	* For users who will be starting with raw CESM2-LE output
	* These notebooks pre-process CESM2-LE output generating what is in the `ToE_saved_data` directory


## Code dependences

Install python environment using `environment/Krumhardt_NCC_conda_env.yml`

See specific instructions for conda installation [here](https://docs.conda.io/en/latest/)


##  Instructions for running the analysis

#### If you are using raw CESM2-LE output:

1. Publicly accessible here: https://gdex.ucar.edu/datasets/d651056/

2. Run processing scripts (`processing_notebooks/*.ipynb`) on CESM2-LE output


#### Making manuscript figures

1. All plotting notebooks are located (`plotting_notebooks/*.ipynb`)
2. Update paths at the top of the notebooks to match your directory structure.
3. Run notebooks using the `Krumhardt_NCC_conda_env` Python environment