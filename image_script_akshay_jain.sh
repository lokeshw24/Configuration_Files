#This script converts size of image to whatever extent.

#HOW TO USE :
  #Replace 'After_Haldi' with the folder-name that contains all images to be reduced.
	#Replace 'Size_reduced' with the folder-name where you want to put all the reduced images.
	#Reducing '25%' with any other number. 25% means if original images' size is 100M then now it will be 25M.

#!/bin/sh
cd After_Haldi
a=`ls`
echo "Reducing image size..."
for i in $a; 
do 
	convert $i -resize 25% ../Size_reduced/$i
done
