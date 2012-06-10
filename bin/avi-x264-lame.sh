#!/bin/bash

# Licence: GNU/GPL 2.0

if [ -z $1 ]; then
# Help
	echo -e "--- Help for avi-x264-lame.sh ---\n";
	echo -e "This skript is for encoding video.";
	echo -e "Mencoder is needed to run this script.";
	echo -e "Video-codec: x264";
	echo -e "Audio-codec: lame";
	echo -e "Mutimedia-contejner: avi";

	echo -e "\n  --Syntax:"
	echo -e "avi-x264-lame <infile> <outfile> [other parametrs for mencoder]\n";
	echo -e "For other parametrs for mencoder view a manual page of mplayer/mencoder\n";
else
#program
	#check of needed programs
	for PROGRAM in mencoder; do
		echo "Checking $PROGRAM:"
		{ which $PROGRAM && [ -x $(which $PROGRAM) ]; } || { 
			echo -e "***\n Can't find program $PROGRAM\n Exit\n***"
			exit 2
			}
		echo -e "*"
	done
	INFILE=$1 
	shift
	OUTFILE=$1
	shift

	if [ -z $OUTFILE ]; then
		echo "Please enter <outfile>"
		exit 1
	fi


	echo -e "\n Enter AUDIO mode:"
	select CHOISE in "stereo" "joint-stereo" "dualchannel" "mono"; do
		echo "You have chosen "$REPLY", it is: $CHOISE"
		echo -n 'Continue? [Y/n] ' && read YESNO
		if [ -z $YESNO ] || [ $YESNO = y ] || [ $YESNO = Y ]; then 
			case $REPLY in
				1) AUDIOMODE=0; break;; 
				2) AUDIOMODE=1; break;; 
				3) AUDIOMODE=2; break;; 
				4) AUDIOMODE=3; break;; 
				*) echo "Bad enter. Please chose 1-4.";;
				esac;
			fi
		done;

		echo -e "\n Enter AUDIO bitrate:"
		select CHOISE in "224 kbps" "192 kbps" "160 kbps" "128 kbps" "96 kbps" "80 kbps" "64 kbps" "48 kbps"; do
			echo "You have chosen "$REPLY", it is: $CHOISE"
			echo -n 'Continue? [Y/n] ' && read YESNO
			if [ -z $YESNO ] || [ $YESNO = y ] || [ $YESNO = Y ]; then 
				case $REPLY in
					1) AUDIOBITRATE=224; break;; 
					2) AUDIOBITRATE=192; break;; 
					3) AUDIOBITRATE=160; break;; 
					4) AUDIOBITRATE=128; break;; 
					5) AUDIOBITRATE=96; break;; 
					6) AUDIOBITRATE=80; break;; 
					7) AUDIOBITRATE=64; break;; 
					8) AUDIOBITRATE=48; break;;
					*) echo "Bad enter. Please chose 1-8.";;
				esac;
			fi
		done;

#	echo -e "\n Enter ASPECT RATIO:"
#	select CHOISE in "4:3" "16:9"; do
#		echo "You have chosen "$REPLY", it is: $CHOISE"
#		echo -n 'Continue? [Y/n] ' && read YESNO
#		if [ -z $YESNO ] || [ $YESNO != n ]; then 
#			case $REPLY in
#				1|2) ASPECT=$CHOISE; break;; 
#				*) echo "Bad enter. Please chose 1 or 2.";;
#			esac;
#		fi
#	done;

		echo -e "\nEnter number of passes for encoding:"
		select CHOISE in "1 passes -- for speed" "2 passes -- for high quality " "3 passes -- for experts"; do
			echo "You have chosen "$REPLY", it is: $CHOISE"
			echo -n 'Continue? [Y/n] ' && read YESNO
			if [ -z $YESNO ] || [ $YESNO = y ] || [ $YESNO = Y ]; then 
				case $REPLY in
					1) PASS=1; ONEPASSOUTFILE=$OUTFILE; break;; 
					2) PASS=2; ONEPASSOUTFILE="/dev/null";PASSTURBO="pass=1:turbo=1:"; break;; 
					3) PASS=3; ONEPASSOUTFILE="/dev/null";PASSTURBO="pass=1:turbo=1:"; break;; 
					*) echo "Bad enter. Please chose 1 to 3.";;
				esac;
			fi
		done;

		echo -e "\nEnter encoding mode:"
		select CHOISE in "Quick encoding" "High quality" "Very high quality -- slow endoding"; do
			echo "You have chosen "$REPLY", it is: $CHOISE"
			echo -n 'Continue? [Y/n] ' && read YESNO
			if [ -z $YESNO ] || [ $YESNO = y ] || [ $YESNO = Y ]; then 
				case $REPLY in
#                    1) ENCOPTS="frameref=1:bframes=2:subq=4:me=dia:b_pyramid:weight_b";break;; 
#                    2) ENCOPTS="frameref=3:bframes=3:subq=5:me=hex:b_pyramid:weight_b:partitions=all:8x8dct";break;; 
#                    3) ENCOPTS="frameref=5:bframes=4:subq=6:me=umh:b_pyramid:weight_b:partitions=all:8x8dct";break;; 
					1) ENCOPTS="frameref=1:bframes=2:subq=4:me=dia:weight_b";break;; 
					2) ENCOPTS="frameref=3:bframes=3:subq=5:me=hex:weight_b:partitions=all:8x8dct";break;; 
					3) ENCOPTS="frameref=5:bframes=4:subq=6:me=umh:weight_b:partitions=all:8x8dct";break;; 
					*) echo "Bad enter. Please chose 1 to 3.";;
				esac;
			fi
		done;

		echo -e "\n This is a choise for rescale filter\nEnter RESOLUTION of encoding video:"
		select CHOISE in "768x576   (4:3) -- Full-PAL"\
		"640x480   (4:3)"\
		"512x384   (4:3)"\
		"384x288   (4:3) -- Half PAL"\
		"256x192   (4:3)"\
		"1024x576 (16:9)"\
		"768x432  (16:9)"\
		"512x288  (16:9)"\
		"256x144  (16:9)"\
		"No change, no rescale. Aspect ratio is 4:3"\
		"No change, no rescale. Aspect ratio is 16:9"; do
			echo "You have chosen "$REPLY", it is: $CHOISE"
			echo -n 'Continue? [Y/n] ' && read YESNO
			if [ -z $YESNO ] || [ $YESNO = y ] || [ $YESNO = Y ]; then 
				case $REPLY in
					1) SCALE="scale=768:576";ASPECT="4:3"; break;; 
					2) SCALE="scale=640:480";ASPECT="4:3"; break;; 
					3) SCALE="scale=512:384";ASPECT="4:3"; break;; 
					4) SCALE="scale=384:288";ASPECT="4:3"; break;;
					5) SCALE="scale=256:192";ASPECT="4:3"; break;;
					6) SCALE="scale=1024:576";ASPECT="16:9"; break;;
					7) SCALE="scale=768:432";ASPECT="16:9"; break;;
					8) SCALE="scale=512:288";ASPECT="16:9"; break;;
					9) SCALE="scale=256:144";ASPECT="16:9"; break;;
					10) ASPECT="4:3"; break;; 
					11) ASPECT="16:9"; break;; 
					*) echo "Bad enter. Please chose 1-11.";;
				esac;
		fi
	done;



	YESNO="n"
	while [ $YESNO ] && { [ $YESNO = n ] || [ $YESNO = N ];}; do 
		echo -e "\n Enter VIDEO bitrate: (500 to 2500 kbps)"  
		read VIDEOBITRATE
		echo -en "Bitrate is $VIDEOBITRATE\n Continue? [Y/n] " && read YESNO
	done

	
	# Others x264 chois
	ENCOPTS="qcomp=0.8:${ENCOPTS}"
	

	echo -en " "
	echo -en "\nForce no frames skipping. This is good if you have problems with A-V synchronization." 
	echo -en "\nForce no frames skipping? [y/N] " && \
	read SKIP
	if [ $SKIP ] && { [ $SKIP = y ] || [ $SKIP = Y ];} ; then 
		SKIP="-mc 0 -noskip"		
	else
		SKIP=""
	fi
	
	echo -en "\nDo you want to use deinterlacing filter? [y/N] " && \
	read YESNO
	if [ $YESNO ] && { [ $YESNO = y ] || [ $YESNO = Y ];}; then 
		DEINTERLACE="pp=lb"		
	else
		DEINTERLACE=""
	fi
	

	echo -en "\nDo you want to use denoise filter? [y/N] " && \
	read YESNO
	if [ $YESNO ] && { [ $YESNO = y ] || [ $YESNO = Y ];}; then 
		echo "  ---> --->"
		echo -en "\t Enter spatial luma strength (default: 4) " && \
		read luma
		if [ -z $luma ]; then luma=4; fi
		echo -en "\n\t Enter spatial chroma strength (default: 3) " && \
		read chroma
		if [ -z $chroma ]; then chroma=3; fi
		echo -en "\n\t Enter temporal strength (default: 6) " && \
		read time
		if [ -z $time ]; then time=6; fi
		DENOISE="hqdn3d=$luma:$chroma:$time"		
		echo "  <--- <---"
	else
		DENOISE=""
	fi

	# filter togather
	for I in $DEINTERLACE $DENOISE $SCALE; do 
		if [ $FILTERS ]; then 
			FILTERS="${FILTERS},$I"
		else
			FILTERS="$I"
		fi
	done
	if [ $FILTERS ]; then 
		FILTERS="-vf $FILTERS"
	fi

#	if [ $DEINTERLACE$SCALE ]; then 
#		FILTERS="-vf"
#		if [ $DEINTERLACE ]; then 
#			FILTERS="$FILTERS $DEINTERLACE"
#			if [ $SCALE ]; then 
#				FILTERS="$FILTERS","$SCALE"
#			fi
#		else
#			FILTERS="$FILTERS $SCALE"
#		fi
#	fi
	
	echo -e "\n Comands:"
	echo "**      1. PASS         **"
	echo mencoder $INFILE -o $ONEPASSOUTFILE $@ -oac mp3lame -lameopts cbr:br="$AUDIOBITRATE":mode="$AUDIOMODE":aq=0 -ovc x264 -x264encopts bitrate=${VIDEOBITRATE}:${PASSTURBO}${ENCOPTS} $FILTERS $SKIP -aspect "$ASPECT"
	if [ $PASS != "1" ]; then 
		echo "**     2/3. PASS        **"
		echo mencoder $INFILE -o $OUTFILE $@ -oac mp3lame -lameopts cbr:br="$AUDIOBITRATE":mode="$AUDIOMODE":aq=0 -ovc x264 -x264encopts bitrate=${VIDEOBITRATE}:pass=${PASS}:${ENCOPTS} $FILTERS $SKIP -aspect "$ASPECT"
	fi
	echo -en "\nContinue? [Y/n] " && read CONTINUE
	if [ $CONTINUE ] && { [ $CONTINUE = n ] || [ $CONTINUE = N ];}; then 
		exit 0
	fi

	STARTDATE=$(date);

	echo -e " \n**************************"
	echo "**      1. PASS         **"
	echo "**************************"
	mencoder $INFILE -o $ONEPASSOUTFILE $@ -oac mp3lame -lameopts cbr:br="$AUDIOBITRATE":mode="$AUDIOMODE":aq=0 -ovc x264 -x264encopts bitrate=${VIDEOBITRATE}:${PASSTURBO}${ENCOPTS} $FILTERS $SKIP -aspect "$ASPECT"
	ONE=$?
	if [ $PASS = "1" ]; then 
		exit $ONE
	fi


	if [ $ONE = 0 ]; then   	
		echo "**************************"
		echo "**      2. PASS         **"
		echo "**************************"
		mencoder $INFILE -o $OUTFILE $@ -oac mp3lame -lameopts cbr:br="$AUDIOBITRATE":mode="$AUDIOMODE":aq=0 -ovc x264 -x264encopts bitrate=${VIDEOBITRATE}:pass=${PASS}:${ENCOPTS} $FILTERS $SKIP -aspect "$ASPECT"
		TWO=$?
		if [ $TWO = 0 ] && [ $PASS = 3 ]; then
			echo "**************************"
			echo "**      3. PASS         **"
			echo "**************************"
			mencoder $INFILE -o $OUTFILE $@ -oac mp3lame -lameopts cbr:br="$AUDIOBITRATE":mode="$AUDIOMODE":aq=0 -ovc x264 -x264encopts bitrate=${VIDEOBITRATE}:pass=${PASS}:${ENCOPTS} $FILTERS $SKIP -aspect "$ASPECT"
			TWO=$?
		fi

	else
		echo "First pass failed. Exit."
		exit 1
	fi

	if [ $TWO = 0 ]; then   	
		echo "**************************"
		echo "**      FINISHED        **"
		echo "**************************"
	else
		echo "Second pass failed. Exit."
		exit 1
	fi
	
	echo "Start date: $STARTDATE"
	echo " End  date: $(date)"

fi

