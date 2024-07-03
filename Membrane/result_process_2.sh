#!/usr/bin/env bash
#Copy all csv into gyrate rmsd rmsf and sasa folder

mkdir -p -v rmsd rmsf gyrate sasa 

cp */rmsd_*.csv ./rmsd/
cp */rmsf_*.csv ./rmsf/
cp */gyrate_*.csv ./gyrate/
cp */sasa_*.csv ./sasa/
