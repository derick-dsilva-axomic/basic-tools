count.csv
count=0
count2=0

for i in `ls OpenAsset_Images/`; do 
	count1=$count2
	#echo "and count = $count1"
	if [ "$i" == 'Projects' ]; then
		for j in `ls OpenAsset_Images/Projects/`; do ls OpenAsset_Images/Projects/$j/*.{jpg,pdf,png,gif,tif} 2>/dev/null | wc -l >> count.csv ; done;
	else
		ls OpenAsset_Images/$i/*.{jpg,pdf,png,gif,tif} 2>/dev/null | wc -l >> count.csv
	fi
	count2=`awk '{ sum += $1 } END { print sum }' count.csv`
	count3=$((count2-count1))
	echo "$i count = $count3"
	#echo "Im here for $i"
done
count=`awk '{ sum += $1 } END { print sum }' count.csv`
echo "Image count =$count"
echo "Note: This would include deleted images"

