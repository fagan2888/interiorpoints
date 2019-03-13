#!/bin/bash

location=$(dirname $0)/..
locSAS=${location}/data/SAS
locStata=${location}/data/Stata
locCSV=${location}/data/CSV

for files in $(cd $locSAS; ls *sas7bdat)
do
  file=$(basename $files .sas7bdat)
  CSVfile=$locCSV/$file.csv
  if [[ -f $CSVfile ]]
  then
    echo "Skipping - $CSVfile exists"
  else
    echo "libname mylib '$locSAS';
proc export data=mylib.$file dbms=csv file='$CSVfile' replace;run;" |  sas -stdio
  fi
done

