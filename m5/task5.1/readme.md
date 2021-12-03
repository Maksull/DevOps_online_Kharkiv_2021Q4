# PART 1
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



