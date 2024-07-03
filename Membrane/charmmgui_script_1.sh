#!/bin/csh
gmx grompp -f step6.0_minimization.mdp -o step6.0_minimization.tpr -c step5_input.gro -r step5_input.gro -p topol.top -n index.ndx -maxwarn -1
gmx mdrun -v -deffnm step6.0_minimization 
gmx grompp -f step6.1_equilibration.mdp -o step6.1_equilibration.tpr -c step6.0_minimization.gro -r step5_input.gro -p topol.top -n index.ndx
gmx mdrun -v -deffnm step6.1_equilibration
gmx grompp -f step6.2_equilibration.mdp -o step6.2_equilibration.tpr -c step6.1_equilibration.gro -r step5_input.gro -p topol.top -n index.ndx
gmx mdrun -v -deffnm step6.2_equilibration
gmx grompp -f step6.3_equilibration.mdp -o step6.3_equilibration.tpr -c step6.2_equilibration.gro -r step5_input.gro -p topol.top -n index.ndx
gmx mdrun -v -deffnm step6.3_equilibration
gmx grompp -f step6.4_equilibration.mdp -o step6.4_equilibration.tpr -c step6.3_equilibration.gro -r step5_input.gro -p topol.top -n index.ndx
gmx mdrun -v -deffnm step6.4_equilibration
gmx grompp -f step6.5_equilibration.mdp -o step6.5_equilibration.tpr -c step6.4_equilibration.gro -r step5_input.gro -p topol.top -n index.ndx
gmx mdrun -v -deffnm step6.5_equilibration
gmx grompp -f step6.6_equilibration.mdp -o step6.6_equilibration.tpr -c step6.5_equilibration.gro -r step5_input.gro -p topol.top -n index.ndx
gmx mdrun -v -deffnm step6.6_equilibration
gmx grompp -f step7_production.mdp -o step7_production.tpr -c step6.6_equilibration.gro -p topol.top -n index.ndx
gmx mdrun -v -deffnm step7_production
echo "Congratulations! Your simulation has finished successfully!"
