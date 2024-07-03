#!/bin/bash
#Convert xvg to csv

cat gyrate.xvg | sed 1,27d | tr -s ' '  | cut -c2- | sed 's/ /,/g' | cut -d',' -f1,2 > gyrate.csv
cat rmsd.xvg | sed 1,18d |  tr -s ' '  | sed 's/ /,/g'  | cut -c2- > rmsd.csv
cat rmsf.xvg |sed 1,17d | tr -s ' '  | sed 's/ /,/g'  | cut -c2- > rmsf.csv
cat sasa.xvg | sed 1,24d | tr -s ' '  | sed 's/ /,/g'  | cut -c2-  > sasa.csv
