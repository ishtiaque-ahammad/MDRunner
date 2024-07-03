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
echo "SASA calculation has finished. Before H-bond analysis, we need to create a new index file namded index_protein_ligand.ndx. 
When prompted, choose type 1 | 13 and then q. Make sure it makes an index of Protein_ligand format"
sleep 5s

gmx make_ndx -f step4.0_minimization.gro -o index_protein_ligand.ndx
echo "New index file has been created. We will now run the actual H-bond analysis. 
When prompted, choose group 1 (Protein) and then group 13 (Ligand)"
sleep 3s
#Hbond calculation
gmx hbond -s step5_production.tpr -f step5_production_corrected.xtc -n index_protein_ligand.ndx -num hbond.xvg

#Create a result_graph folder
mkdir result_graphs
cp *.xvg ./result_graphs/

echo $(tput setaf 9)"The simulation has finished successfully! 
RMSD, RMSF, radius of gyration, SASA, H-bond graphs have all been generated as well!
Let's take a look!"
sleep 3s

#Opening of the RMSD and Radius of gyration graphs
xmgrace ./result_graphs/rmsd.xvg
xmgrace ./result_graphs/rmsf.xvg
xmgrace ./result_graphs/gyrate.xvg
xmgrace ./result_graphs/sasa.xvg
xmgrace ./result_graphs/hbond.xvg
