#!/bin/bash

location=$(dirname $0)/..
locSAS=${location}/data/SAS
locStata=${location}/data/Stata
locCSV=${location}/data/CSV

for files in $(cd $locSAS; ls *sas7bdat)
do
  file=$(basename $files .sas7bdat)
  echo "libname mylib '$locSAS';
proc export data=mylib.$file dbms=dta file='$locStata/$file.dta' replace;run;" |  sas -stdio
done

