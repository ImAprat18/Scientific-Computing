#CODE TO RENAME A WRONGLY NAMED FILE BASED ON ITS TYPE
#!/usr/bin/bash
#mm22b018
filename=$1
#The following conditional statement ensures the user doesn't provide null values, and error is shown in case the user provides no arguments.
if [ ! -z "$filename" ]
then
	echo $filename > filepath.txt
	basefile=`basename $filename`
	filenum=`echo $basefile | cut -d "-" -f 3 | cut -d "." -f 1`
	colofx=`grep '\bx-column' $filename | cut -d " " -f 3`
	colofy=`grep '\by-column' $filename | cut -d " " -f 3`
	valofa=`grep '\bz' $filename | cut -d " " -f 4`
	valofb=`grep '\bz' $filename | cut -d " " -f 8`
	valofc=`grep '\bz' $filename | cut -d " " -f 12`
	grep ^[^#] $filename > inputfile.txt
	awk 'BEGIN { FS="[#&;:,\" \"]"; varx='"$colofx"'; vary='"$colofy"'; } { print $'"varx"' " " $'"vary"' " "  }' inputfile.txt > subsidiaryfile.txt
	awk 'BEGIN { FS=" "; vara='"$valofa"'; varb='"$valofb"'; varc='"$valofc"'; } {print $1 " " $2 " " vara*$1+varb*$2+varc }' subsidiaryfile.txt > data-output-"$filenum".txt
	echo data-output-"$filenum".txt
	rm filepath.txt
	rm inputfile.txt
	rm subsidiaryfile.txt
else 
	echo "ERROR! No argument provided. Please run the script again and input a file name."
fi
#End of code, thank you!

