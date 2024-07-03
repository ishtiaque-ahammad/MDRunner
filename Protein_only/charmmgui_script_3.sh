#!/bin/bash
#Trajectory correction
echo "Welcome to MD simulation result analysis! Firstly, we will correct the trajectory of the simulation. When prompted, 
select 1 (Protein) as the group to be centered and 0 (System) for output"
sleep 3s
gmx trjconv -s step5_production.tpr -f step5_production.xtc -o step5_production_corrected.xtc -pbc mol -center
echo "The trajectory has been corrected. We will generate the RMSD graph now. 
When prompted, choose 4 (Backbone) for both the least-squares fit and the group"
sleep 3s

#RMSD graph generation
gmx rms -s step5_production.tpr -f step5_production_corrected.xtc -o rmsd.xvg -tu ns
echo "The RMSD graph has been generated. We will generate the RMSF graph now. 
When prompted, choose group 3 (C-alpha) for analysis."
sleep 3s

#RMSF graph generation
gmx rmsf -s step5_production.tpr -f step5_production_corrected.xtc -o rmsf.xvg -res
echo "The RMSF graph has been generated. We will generate the radius of gyration graph now. 
When prompted, choose group 1 (Protein) for analysis."
sleep 3s

#Radius of gyration graph generation
gmx gyrate -s step5_production.tpr -f step5_production_corrected.xtc -o gyrate.xvg
echo "The radius of gyration graph has been generated. We will do SASA calculation now. 
When prompted, choose group 1 (Protein) for analysis."
sleep 3s

#sasa calculation
gmx sasa -s step5_production.tpr -f step5_production_corrected.xtc -o sasa.xvg

#Create a result_graph folder
mkdir result_graphs
cp *.xvg ./result_graphs/
rm /result_graphs/area.xvg

echo $(tput setaf 9)"The simulation has finished successfully! 
RMSD, RMSF, radius of gyration, SASA graphs have all been generated as well!
Let's take a look!"
sleep 3s

#Opening of the RMSD and Radius of gyration graphs
xmgrace ./result_graphs/rmsd.xvg
xmgrace ./result_graphs/rmsf.xvg
xmgrace ./result_graphs/gyrate.xvg
xmgrace ./result_graphs/sasa.xvg