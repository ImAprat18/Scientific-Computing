#CODE TO FIND THE DEEPEST LEVEL FILE IN A TAR ARCHIVE
#!/usr/bin/bash
#mm22b018
tarfile=$1
#The following conditional statement ensures that a null value hasn't been provided as argument by the user
if [ ! -z "$tarfile" ]
then
	tar -xvf $tarfile > tarextract.txt
	awk -F"/" '{print NF}' tarextract.txt > depthlevel.txt
	maxdepth=`awk -v curmax=0 '{if ($1>curmax){dep=$1; curmax=$1}} END{print dep}' depthlevel.txt`
	deepfile=`cut -d "/" -f $maxdepth tarextract.txt | grep "[[:alnum:]]"`
	echo $deepfile
	rm tarextract.txt
	rm depthlevel.txt
else
	echo "ERROR! No argument provided. Please run the script again and enter a file name."
fi
#End of code, thank you!

