#!/bin/bash
echo
echo
echo
echo
echo
echo ========================
echo Generating progress plot
echo ========================

#size=$(pdftools --analyze thesis.pdf  | grep "size" | awk '{print $6}')
#pages=$(pdftools --countpages thesis.pdf | grep "pages in total" | awk '{print $3}')
size=$(pdfinfo thesis.pdf | grep File | awk '{print $3}')
pages=$(pdfinfo thesis.pdf | grep Pages | awk '{print $2}')
time=$(date +%s)
#make temp text file
pdftotext thesis.pdf temp.txt
words=$(cat temp.txt | wc -w)
chars=$(cat temp.txt | wc -c)
rm temp.txt
echo $time $pages $size $words $chars >> progress.dat
gnuplot 'makeProgress.gnu'