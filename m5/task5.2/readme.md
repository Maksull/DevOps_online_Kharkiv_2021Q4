/etc/passwd and /etc/group
-------------
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
  
PSEUDOUSERS
-------------
***Pseudousers*** have UID from 100 till 999.
Pseudousers example:  
• daemon - Used by system service processes  
• bin - Gives the right to own executable command files  
• sys - Owns system files  
  
UID and GID
-------------
***UID*** - an unique user ID within the system. UID the user can be found in the / etc / passwd file.  
UID 1-500 is usually reserved for system users. In Ubuntu I The Fedora UID for new users starts at 1000.   
The Linux UID and GID are ***0 reserved for the root user***.
You can define it using ```id command``` or ```the /etc/passwd```  
  
***GID*** - is an unique identifier of the group within the system to which it belongs user.
You can define it using ```the /etc/passwd, the /etc/group``` or ```id command```
  
To define the users of group use ```the /etc/group```. ***The fourth point*** is the users included in the group. Or you can use ```groups``` command.

----------
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
  
SKELL_DIR
-------------
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
  
DELETE AN USER
-------------
To delete a user use ```deluser``` or ```userdel```.   
The Linux ```userdel``` command can be used ***to delete user accounts***. This command ***can only be used by root users***. ```userdel``` can delete user accounts and related files. If no parameters are added, only *the user account will be deleted*, and the *related files will not be deleted*. The ```-r``` option means to delete the user’s home directory while deleting the user.  
The ```deluser``` command can be used ***to delete users***. ```deluser``` has richer options and more powerful functions than ```userdel```. There are more options to specify when deleting a user:  
```
--remove-home       delete the user’s home directory and mailbox  
--remove-all-files  delete all files owned by the user  
--backup            Back up files before deleting.  
--backup-to<DIR>    The destination directory of the backup. The default is the current directory.  
``` 
    
Delete a user from the system wtih all files:  
```
deluser --remove-all-files NAME
userdel -r NAME
```
Delete a user from a group:
```
deluser USER_NAME GROUP_NAME
```
  
PASSWD COMMAND
-------------
The ```passwd``` command ***changes passwords*** for user accounts. A normal user may only change the password for their own account, while the superuser may change the password for any account. 
```
Passwd -S name - View user status
Passwd -l name - Block user
Passwd -u name - Unlock User
Passwd -d username - Delete user password
P - password set, L - user locked, NP - no password
```
  
ACCESS RIGHTS
-------------
***Read*** - allows you to receive the contents of the file, but not writable. For
directory allows you to get a list of files and directories located in him;  
***Write*** - allows you to write new data to a file or change existing ones, and
also allows you to create and modify files and directories;  
***Execution*** - you cannot execute a program if it does not have one execution flag. This attribute is set for all programs and scripts, 
it is with its help the system can understand that this the file must be run as a program.  
- ```---``` - no rights at all;
- ```--x``` - only executing a file as a program is allowed but not modifying and notreading;
- ```-w-``` - only writing and modifying a file is allowed;
- ```-wx``` - change and execution is allowed, but in the case of a directory, you are not you can see its contents;
- ```r--``` - read-only rights;
- ```r-x``` - read and execute only;
- ```rw-``` - read and write rights only;
- ```rwx``` - all rights;
- ```--s``` - set SUID or SGID bit, the first is displayed in the field for the owner, the second for the group;
- ```--t``` - sticky-bit is set, which means users can't delete it this file.
 
-----------
  
To see the rights of an user to a file you can use ```ls``` with ```-l``` key.

To change the owner of a file use:  
```
chown user:group file
```
To change the access rights of a file use:
```
chmod rights file
```
  
UMASK
-------------
The ```umask``` utility ***sets the file creation mode mask*** in the current shell environment to the value specified by the mask operand. *This mask affects the initial value of the permissions bits* of all files or directories that are created next. When creating any file, ***the operating system asks for a rights mask*** and calculates the mask based on it. The **default mask is 0002**. The first digit does not affect anything and is a relic of the C language syntax. Further, the numbers are similar to the access rights in Linux: *the first is the owner*, *the second is the group*, and *the third is all the rest users*. The default access rights for the file will be 666 - 002 = 664, and for the directory - 777 - 002 = 775.  
***You are not able to allow the execution of files using a mask***. The x flag can be masked only for directories. Since *file permissions are calculated based on permissions 666*, in which execution is already disabled rw-rw-rw, the mask cannot do anything here. But everything works for *directories, because 777 rights are used*.
To change the mask use:
```
umask -keys mask_in_octal_form
```
- ```-p``` After executing will display current mask in ***octal form***
- ```-S``` After executing will display current mask in ***u=rwx, g=rwx, o=rwx form***  
  
STICKY BIT
-------------
Sticky bit - additional attribute for files and directories for which set this bit, deleting and / or renaming files could do only their owners or privileged user.

-------------
For command scripts must be present read(r) and execute(x) attributes:  
```
chmod +rx file_name
```



