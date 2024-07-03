#!/bin/csh
gmx grompp -f step4.0_minimization.mdp -o step4.0_minimization.tpr -c step3_input.gro -r step3_input.gro -p topol.top -n index.ndx -maxwarn -1
gmx mdrun -v -deffnm step4.0_minimization
gmx grompp -f step4.1_equilibration.mdp -o step4.1_equilibration.tpr -c step4.0_minimization.gro -r step3_input.gro -p topol.top -n index.ndx
gmx mdrun -v -deffnm step4.1_equilibration
gmx grompp -f step5_production.mdp -o step5_production.tpr -c step4.1_equilibration.gro -p topol.top -n index.ndx
gmx mdrun -v -deffnm step5_production
echo "Congratulations! Your simulation has finished successfully!"
