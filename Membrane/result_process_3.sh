#!bin/bash
#Combining all csv file seperatly of gyrate,rmsd,rmsf and sasa

#change the path according to the path to the files located in your computer
path="/media/ws01/Bioinformatics/MD_simulation/"


#Processing of gyrate files
cp -a ${path}/gyrate/*.csv ${path}
paste *.csv > gyrate_1.csv
sed "s/\s/,/g" gyrate_1.csv > gyrate_2.csv
cut -d , -f3,5,7,9,11,13,15,17 --complement gyrate_2.csv > gyrate.csv
rm -f gyrate_*.csv gyrate_*.csv
mv ${path}/gyrate.csv ${path}/gyrate


#Processing of rmsd files
cp -a ${path}/rmsd/*.csv ${path}
paste *.csv > rmsd_1.csv
sed "s/\s/,/g" rmsd_1.csv > rmsd_2.csv
cut -d , -f3,5,7,9,11,13,15,17 --complement rmsd_2.csv > rmsd.csv
rm -f rmsd_*.csv rmsd_*.csv
mv ${path}/rmsd.csv ${path}/rmsd


#Processing of rmsf files
cp -a ${path}/rmsf/*.csv ${path}
paste *.csv > rmsf_1.csv
sed "s/\s/,/g" rmsf_1.csv > rmsf_2.csv
cut -d , -f3,5,7,9,11,13,15,17 --complement rmsf_2.csv > rmsf.csv
rm -f rmsf_*.csv rmsf_*.csv
mv ${path}/rmsf.csv ${path}/rmsf


#Processing of sasa files
cp -a ${path}/sasa/*.csv ${path}
paste *.csv > sasa_1.csv
sed "s/\s/,/g" sasa_1.csv > sasa_2.csv
cut -d , -f3,5,7,9,11,13,15,17 --complement sasa_2.csv > sasa.csv
rm -f sasa_*.csv sasa_*.csv
mv ${path}/sasa.csv ${path}/sasa

mv ${path}/gyrate/gyrate.csv ${path}
mv ${path}/rmsd/rmsd.csv ${path}
mv ${path}/rmsf/rmsf.csv ${path}
mv ${path}/sasa/sasa.csv ${path}


