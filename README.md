# MDRunner
MDRunner is an automated pipeline for running molecular dynamics simulations using CHARMM-GUI and GROMACS.


<p align="center">
<img src="https://github.com/ishtiaque-ahammad/MDRunner/assets/99262870/f3c331df-f5ce-41b7-952f-4736e5718e19" alt="MDRunner" />
</p>


## Dependencies

* [gromacs](https://www.gromacs.org/)

## Usage

### Clone the repository
``` git clone https://github.com/ishtiaque-ahammad/MDRunner ```

## Scripts

### Simulation and Result Generation Scripts

charmmgui_script_1.sh: Performs energy minimization, equilibration and production steps of the simulation.

charmmgui_script_2.sh: Continues halted simulation.

charmmgui_script_3.sh: Corrects the trajectory and performs RMSD, RMSF, SASA, Gyrate, H-Bond analysis.

### Result Processing Scripts

result_process_1.sh: Converts .xvg files to .csv files.

result_process_2.sh: Organizes the results of RMSD, RMSF, SASA, Gyrate, H-Bond analysis into respective directories.

result_process_3.sh: Merges seperate .csv files for each sample for RMSD, RMSF, SASA, Gyrate, H-Bond into a single .csv file.

## License
This project is licensed under the GPL-3.0 license.
