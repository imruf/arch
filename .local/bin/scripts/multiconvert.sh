#!/bin/sh
#num=$1
#i=0
#while (( i++ < "$num" )); do
#    ps2pdf "cindy$i.ps" "cindy$i.pdf"
#done
num=1
while (($num <=23)) 
do 
pdftohtml -enc UTF-8 -noframes cindy$num.pdf cindy$num.html
((num++))
done
