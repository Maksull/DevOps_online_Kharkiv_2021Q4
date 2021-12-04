<details><summary>PART 1</summary>
  
Log in into the system as root:  
```
sudo su - root
```
***su*** allows commands to be run with a substitute user and group ID.  
Change the root password:  
```
passwd
```
If run ***passwd*** command without option you will be changing current user's password.  
-S Display account status information  
-d Delete a user's password  
-x Set the maximum number of days a password remains valid  
1. Secure user account information /etc/shadow  
2. User account information /etc/passwd  
3. PAM configuration for passwd /etc/pam.d/passwd  
Display the information about a user:  
```
who 
finger 
```
![Who and finger](screenshots/who_finger.png)  
To check what command they execute you can use:  
```
ps -u | grep maksym
top 
htop
```
![Ps -u](screenshots/ps_user.png)  
Change personal information about a user:  
```
chfn maksym
```
![CHFN](screenshots/chfn_maksym.png)  
***chfn*** is used to change your finger information. This information is stored in the */etc/passwd* file, and is displayed by the ***finger***   
program. The Linux ***finger*** command will display four pieces of information that can be changed by ***chfn***  
  
  
***man*** is the system's manual pager.  Each page argument given to ***man*** is normally the name of a program, utility or function.  
*The manual page* associated with each of these arguments is then found and displayed.  
***Man*** examples:  
```
man chfn
man ps
```
![man chfn](screenshots/man_chfn.png)  
![man ps](screenshots/man_ps.png)  
Using ps,chfn with keys:  
```
chfn -r 9 maksym
chfn -h 111 maksym
```
![chfn + option](screenshots/chfn_example.png)  
```
ps -a
ps -d
```
![ps + option](screenshots/ps_example.png)  
To see the content of a file you can use ***more*** or ***less***. To see the documentation about these commands, I used:  
```
man more
man less
```
***more*** - is a filter for paging through text one screenful at a time.  
***less*** - is a program similar to more(1), but which allows backward movement in the file as well as forward movement.  
*more and less* have the option to view multiple files at once. *more* allows us to view them as a single file separated by lines, and *less* allows us to switch between them.
However, both *more and less* display all the opened files with the same options.  
![more](screenshots/more.png)  
![less](screenshots/less.png)  
To display a content of the home directory, I used ***ls*** command with some keys:  
```
ls -lah
```
*-a* - do not ignore entries starting with  
*-h* - make the output more readable for people  
*-l* - use a long listing format  
![ls](screenshots/ls.png)  

</details>

<details><summary>PART 2</summary>

Tree command + grep:  
```
tree -L 2 | grep c
```
*-L* - Max display depth of the directory tree  
![Tree](screenshots/tree.png)  
To determine ***the type of files***, I used:  
```
file * 
```
![File](screenshots/file.png)  
To navigate in the system you can use:  
```
cd [path]
pwd 
```
***pwd*** to check the position  
![Cd](screenshots/cd.png)  
To check a content of a directory, I used:
```
ls
ls -a
ls -la
``` 
***ls*** - list directory contents  
*-a* - do not ignore entries starting with .  
*-l* - use a long listing format  
![ls](screenshots/ls_command.png)  
In order to create a directory, I used:  
```
mkdir [directory_name]
```
![mkdir](screenshots/mkdir.png)  
To redirect an output, I used **>** symbol:  
```
ls / > test_dir/file.txt
```
***>*** - creates file if it doesn't exist and overwrite if it exist  
![mkdir](screenshots/mkdir.png)  
To copy the file, I used:  
```
cp [SOURCE] [DESTIONATION]
```
To remove the file, I used:  
```
rm [FILE]
```
![cp rm](screenshots/cp_rm_command.png)  
To remove a directory you can use ***rm*** with ***-r key***:  
```
rm -r test_dir
```
![rm -r](screenshots/rm_r_directory.png)  
Copy .bash_history to the test directory while changing its nam to labwork2:  
```
mkdir test
cp .bash_history test/labwork2
```
![cp bash_history](screenshots/cp_bash_history.png)  
Create a soft link and hard link to the labwork2:
```
ln -s labwork2 s_link
ln labwork h_link
```
***ln -s*** - create a soft link  
***ln*** - create a hard link
A *symbolic or soft link* is an actual **link to the original file**, whereas a *hard link* is a mirror **copy of the original file**.  
![ln](screenshots/create_link.png)  
To rename the links use ***mv***:
```
mv s_link symb_lnk_labwork2
mv h_link hard_lnk_labwork2
```
![mv](screenshots/rename_link.png)  
Delete the origin:  
```
rm labwork2
```
After that ***the soft link doesn't work***, but ***the hard link works***, because the second creates the copy, while the first one is just link to the origin  
![rm](screenshots/rm_labwork2.png)  
Use ***locate*** command:  
```
locate squid
locate traceroute
```
![locate](screenshots/locate.png)  
Determine mounted partitions:  
```
ls -la /dev | grep sd
```
***b*** symbol means block devices 
***sd*** - device connected by SCSI
The letter immediately after ***sd*** signifies the order in which it was first found.  
***The number after that signifies*** the partition on the device.  
![dev](screenshots/dev.png)  
To count the lines with the symbol, I used ***grep + wc***:  
```
cat .gitconfig | grep e | wc -l
```
![grep + wc](screenshots/grep_wc.png)  
Using find command to find all files in the /etc directory containing the host character sequence:  
```
sudo find -name host
```
![find](screenshots/find_host.png)  
List all objects in /etc that contain the ss character sequence using ***ls + grep***:  
```
ls -la | grep ss
```
![ls + grep](screenshots/ls_grep.png)  
Organize screen-by-screen print of the content of the /etc directory using ***pipeline and less***:  
```
ls -la | less
```
![pipeline less](screenshots/etc_less.png)  
In UNIX, and therefore Linux, ***there are two types of devices***: *block devices* direct access (such as disks) and *symbolic devices* such as
tape drives and serial ports), some of which may be consistent, and some with direct access. The ***'b'*** - denote linux block devices, and the symbol ***'c'*** - symbolic (character).
```
ls -la /dev | grep cr
ls -la /dev | grep br
```
![der cr](screenshots/dev_cr.png)  
![der br](screenshots/dev_br.png)  
You can determine the file type using the ***file*** command.  
There are three types of files in linux:
1. Catalog (directory)
2. Binary
3. Text (ASCII text)
List the first 5 directory file that were recently accessed in the /etc directory:  
```
ls -lta | head -n 6
```
***-t*** - sort by time, newest first
![ls -t + head](screenshots/ls_head.png)  


</details>











