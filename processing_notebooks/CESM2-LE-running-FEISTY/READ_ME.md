### Running FEISTY on the CESM2 Large Ensemble

1. Prepare all data using the scripts in the `preprocessing4feisty` directory of this repo. 5 variables are needed to force FEISTY: mesozoo biomass, mesozoo loss rate, top 100m mean temperature, bottom temperature, and POC flux to ocean floor.

2. Clone the [python FEISTY repo](https://github.com/marbl-ecosys/feisty)

3. Put `LENS_driver.sh` and `feisty-config.CESM2_LENS.yml` in `feisty/examples/`

4. Run the shell script `LENS_driver.sh` like this: `qsub -v "ENS_MEMBER=1301.008,START_YEAR=1850" < LENS_driver.sh"

5. Convert daily FEISTY zarr files (raw output) to monthly and annual using the scripts in `feisty_postprocessing`.
