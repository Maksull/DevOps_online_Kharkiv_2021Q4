The structure of the /etc/passwd file:  
1. Username: It is used when user logs in. It should be between 1 and 32 characters in length.
2. Password: A x character indicates that encrypted password is stored in /etc/shadow file. A * character means that this account is temporarily disabled. A set of random characters and numbers - indicate the user's password in encrypted form.
3. User ID (UID): Each user must be assigned a user ID (UID). UID 0 (zero) is reserved for root and UIDs 1-99 are reserved for other predefined accounts. Further UID 100-999 are reserved by system for administrative and system accounts/groups.
4. Group ID (GID): The primary group ID (stored in /etc/group file)
5. User ID Info (GECOS): The comment field. It allow you to add extra information about the users such as user’s full name, phone number etc. This field use by finger command.
6. Home directory: The absolute path to the directory the user will be in when they log in.
7. Command/shell: The absolute path of a command or shell (/bin/bash).  
  
The structure of the /etc/group file:  
1. group_name: It is the name of group. 
2. Password: Generally password is not used, hence it is empty/blank. It can store encrypted password. 
3. Group ID (GID): Each user must be assigned a group ID.
4. Group List: It is a list of user names of users who are members of the group.  
  
***Pseudousers*** have UID from 100 till 999.
Pseudousers example:
• daemon - Used by system service processes
• bin - Gives the right to own executable command files
• sys - Owns system files
  
***UID*** - an unique user ID within the system. UID the user can be found in the / etc / passwd file.  
UID 1-500 is usually reserved for system users. In Ubuntu I The Fedora UID for new users starts at 1000.   
The Linux UID and GID are ***0 reserved for the root user***.
You can define it using ```id command``` or ```the /etc/passwd```  
  
***GID*** - is an unique identifier of the group within the system to which it belongs user.
You can define it using ```the /etc/passwd, the /etc/group``` or ```id command```
  
To define the users of group use ```the /etc/group```. ***The fourth point*** is the users included in the group.

They are two commands to ***add a new user***:
```
useradd
  -p - set a password
  -d - set a home dir
  -g - set a group which the user will belong to
adduser
```
The key difference between adduser and useradd is that *adduser is used to add users with setting up* account's home folder and other settings 
while *useradd is a low-level utility command* to add users.
  
The ```usermod``` command modifies the system account files to reflect the changes that are specified on the command line.  
*-l* The name of the user will be changed from LOGIN to NEW_LOGIN.
  
```The /etc/skel``` directory *contains files and directories that are automatically copied over to a new user's home directory* when such user is created by the useradd program.
```The /etc/defualt/useradd``` is *the file which defines the skel directory*. You can change the default location /etc/skel to any other location.  
The /etc/default/useradd: 
```
GROUP=100
HOME=/home
INACTIVE=-1
EXPIRE=
SHELL=/bin/bash
SKEL=/etc/skel
CREATE_MAIL_SPOOL=yes
```


