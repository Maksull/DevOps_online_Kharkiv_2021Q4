SCRIPT_A
---------

<details><summary>script_a code</summary>

```
#!/bin/bash

function find_open_ports() {
        ss -ant | sed '1d' | awk '{print $4}' | awk -F "([A-Za-z]|[0-9]|\]):" 'BEGIN {print "PORT"} {print $2}' | sort -n | uniq
}

function check_install_nmap() {
        test -e /usr/bin/nmap
        if [ "$?" == "false" ]
        then
                echo "nmap is NOT installed. Start installind"
                sudo apt install nmap
        fi
}

function find_ip() {
        addr=$1
        nmap -sP $addr | sed '$d' | awk 'BEGIN {print "HOSTNAME\tIP"} NR%2 == 0 {n=n+1; print $5"\t" $6} END {print "TOTAL: ", n}' | column -t
}


if [ "$#" == "0" ]
then
        echo -e "\033[31m$0""\033[0m has 2 keys:"
        echo "The --all key displays the IP adresses and symblic names of all hosts in the current subnet"
        echo "The --target key displays a list of open system TCP ports"
elif [ "$1" == "--all" ]
then
        echo -e "\033[32mNext ports are opened:\033[0m"
        find_open_ports
elif [ "$1" == "--target" ]
then
        check_install_nmap
        echo -e "\033[32mThey are such hosts in the network:\033[0m"
        find_ip $2
else
        echo -e "There is\033[31m no \033[0m$1 key"
fi

exit 0
```
![script_a](screenshots/script_a.png)

-------

</details>

```$#``` - contains amount of command-line argument passed to the shell script  
```\033[31m``` - a set of special characters that *change* the color of text to the ***red***  
```\033[0m``` - a set of special characters that *reset* settings of collor to ***defaults*** 
   
```ss -ant``` - display opened ports  
```sed '1d'``` - delete *the first line*  
```awk '{print $4}'``` - print only *the fourth column*  
```awk -F "([A-Za-z]|[0-9]|\]):" 'BEGIN {print "PORT"} {print $2}'``` - print only ports and add **BEGIN** at the beginning of output  
```sort -n``` - sort the ports by numbers  
```uniq``` - remove *duplicate*  
  
```test -e``` - check for file existence  
```$?``` - the exit *status of the last executed command*  
```nmap -sP $addr``` - displays the IP adresses and symbolic names of all hosts in the subnet **$addr**  
```sed '$d'``` - delete the last line  
```awk 'BEGIN {print "HOSTNAME\tIP"} NR%2 == 0 {n=n+1; print $5"\t" $6} END {print "TOTAL: ", n}'``` - add **HOSTNAME IP** in the beginning of the output, 
print every second line and count them(n=n+1),  add **TOTAL** and numbers of **IP adresses** in the end of the output  
```column -t``` - formats its input into multiple columns. ```-t --table``` - create a table  
  
**The result**:  
![script_a result](screenshots/script_a_result.png)

SCRIPT_B
---------

<details><summary>script_b code</summary>

```
#!/bin/bash

function mrip() {
	if [ -z $2 ]
	then
		cat $1 | awk '{print $1}' | sort | uniq -c | sort -nr |  awk 'BEGIN {print "\033[32mNN IP COUNT\033[0m"} {print FNR, $2, $1}' | column -t
	else
		cat $1 | awk '{print $1}' | sort | uniq -c | sort -nr | head -n $2 | awk 'BEGIN {print "\033[32mNN IP COUNT\033[0m"} {print FNR, $2, $1}' | column -t 
	fi
}

function mrpa() {
	if [ -z $2 ]
	then
		cat $1 | awk '{print $7}' | sort | uniq -c | sort -nr | awk 'BEGIN {print "\033[32mNN PAGE COUNT\033[0m"} {print FNR, $2, $1}' | column -t
	else
		cat $1 | awk '{print $7}' | sort | uniq -c | sort -nr | head -n $2 | awk 'BEGIN {print "\033[32mNN PAGE COUNT\033[0m"} {print FNR, $2, $1}' | column -t
	fi
}

function non_existent_pages_visited() {
        if [ -z $2 ]
        then
                cat $1 | grep error | awk '{print $1 $7}' | awk -F "/" '{print $1"\t"$2}' | sort | uniq -c | sort -nr | awk 'BEGIN {print "\033[32mNN IP ERROR COUNT\033[0m"} {print FNR, $2, $3, $1}' | column -t
        else
                cat $1 | grep error | awk '{print $1 $7}' | awk -F "/" '{print $1"\t"$2}' | sort | uniq -c | sort -nr | head -n $2 | awk 'BEGIN {print "\033[32mNN IP ERROR COUNT\033[0m"} {print FNR, $2, $3, $1}' | column -t
        fi
}

function mrt() {
	if [ -z $2 ]
        then
                cat $1 | awk '{print $4"]"}' | sort | uniq -c | sort -nr | awk 'BEGIN {print "\033[32mNN TIME COUNT\033[0m"} {print FNR, $2, $1}' | column -t
        else
		cat $1 | awk '{print $4"]"}' | sort | uniq -c | sort -nr | head -n $2 | awk 'BEGIN {print "\033[32mNN TIME COUNT\033[0m"} {print FNR, $2, $1}' | column -t        
	fi
}

function search_bot_request() {
	if [ -z $2 ]
        then
                cat $1 | grep bot | awk -F "\"" '{print $6}' | awk -F "//" '{print $2}' | awk 'NF' | awk -F ")" '{print $1}'  | sort | uniq -c | sort -nr | awk 'BEGIN {print "\033[32mNN BOT COUNT\033[0m"} {print FNR, $2, $1}' | column -t
        else
                cat $1 | grep bot | awk -F "\"" '{print $6}' | awk -F "//" '{print $2}' | awk 'NF' | awk -F ")" '{print $1}'  | sort | uniq -c | sort -nr | head -n $2 | awk 'BEGIN {print "\033[32mNN BOT COUNT\033[0m"} {print FNR, $2, $1}' | column -t
	fi
}

if [ "$#" == "0" ]
then
	echo -e "\033[31m$0""\033[0m has 5 keys:"
	echo "The --mrip the most requested IP adresses"
        echo "The --mrpa the most requested pages"
	echo "The --non-existent-pages-visited IP adresses that got error"
	echo "The --mrt the time site was most requested"
	echo "The --searchbot-request what searchbots requested the site"
	exit 0
elif [ -z $2 ]
then
        echo -e "ERROR. You have to choose an apache_log"
        exit 1
else
	log_name=$2
	search_size=$3
fi

if [ "$1" == "--mrip" ]
then
	mrip $log_name $search_size
elif [ "$1" == "--mrpa" ]
then
	mrpa $log_name $search_size
elif [ "$1" == "--non-existent-pages-visited" ]
then
	non_existent_pages_visited $log_name $search_size
elif [ "$1" == "--mrt" ]
then
	mrt $log_name $search_size
elif [ "$1" == "--searchbot-request" ]
then
	search_bot_request $log_name $search_size
else
	echo -e "There is\033[31m no \033[0m$1 key"
	exit 1
fi

exit 0
```

</details>


**The result:**  
![script_b_mrip](screenshots/script_b_mrip.png)  
![script_b_mrpa ](screenshots/script_b_mrpa.png)  
![script_b_non_existent_pages_visited](screenshots/script_b_non_existent_pages_visited.png)  
![script_b_mrt](screenshots/script_b_mrt.png)  
![script_b_searchbot_request](screenshots/script_b_searchbot_request.png)  



