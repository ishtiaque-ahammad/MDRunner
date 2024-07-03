#!/bin/bash

echo "SASA calculation has finished. Before H-bond analysis, we need to create a new index file namded index_protein_ligand.ndx. 
When prompted, choose type 1 | 13 and then q. Make sure it makes an index of Protein_ligand format"
sleep 5s

gmx make_ndx -f step6.0_minimization.gro -o index_protein_ligand.ndx
echo "New index file has been created. We will now run the actual H-bond analysis. 
When prompted, choose group 1 (Protein) and then group 13 (Ligand)"
sleep 3s
#Hbond calculation
gmx hbond -s step7_production.tpr -f step7_production_corrected.xtc -n index_protein_ligand.ndx -num hbond.xvg

xmgrace ./result_graphs/hbond.xvg
