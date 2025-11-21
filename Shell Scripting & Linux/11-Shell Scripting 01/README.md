## Shell Scripting
Used for automating the manual tasks.
- Eg Task :- write number from 1 to 10,000.
- Eg Task :- Create 100 new files on your linux machine 


## Commands :-

- `touch first-shell-script.sh` – create empty file

- `mkdir folder1` – to create a folder 

- `ls` – list all the files in the current directory 

- `ls -ltr` – list all the files in the current directory along with the timestamps (when the files were created), who created the files, what are all the permissions to the file, which are the groups they belong to.

- `man ls` – Linux provides a manual used to get complete details or information of every command. 

- `vim filename or vi filename` – to open a file. vim needs to be installed in some linux distributions whereas vi is by default present in all linux distributions.

Using tools like Putty, we can ssh to the linux virtual machine.

In automation script, we use touch command and we cannot use vim or vi commands in a script as they will open a file but we just want to create a file. If 1000s of multiple files get opened simultaneously on the system, the system will get crashed. Also, an open file will not get closed automatically and if we want to close a process that uses this file, then the system doesn't allow that, and will ask to close the file first to close the process.

- `#!` – It is called shebang
It can be followed by '/bin/bash' or '/bin/sh' or '/bin/ksh' or 'bin/dash' i.e. the different executables of the shell script that we are using depending on the type of linux machine. This is the first line of every shell script. The purpose of using shebang is to specify the linux kernal about the specific executable that we are using to execute the shell script. All the executables have slight difference in the syntax. For eg., the syntax of a for loop is different in '/bin/bash' as compared to '/bin/dash'. 

The '/bin/sh' indirectly links to '/bin/dash'. Previously '/bin/sh' was indirectly linking to '/bin/bash' but then some of the operating systems decided to use dash as the default executable. So, if we have a script with '#!/bin/bash', but the operating systems uses dash as the default executable, then our script will not work.
The most widely used executable is '/bin/bash'.

- `echo "my name is arsh"` – used to print something 

- `cat filename` – to view the contents of a file 

- `sh first-shell-script.sh` – to run a shell script 

- `./first-shell-script.sh` – used to run any kind of script whether python script or shell script or any executable file 

- `history` – used to get the list of all the commands used previously 

- `#` – used to provide comments 

- `rm` –

- `rm -rf` –

- `Ctrl+c` – to stop a running shell script 

How to trap a signal in Linux ?

## Role of shell scripting in Devops :-
1. Infra maintainance and automation - Writting shell scripts that run daily(using cronjobs) or on adhoc basis to monitor node health of 1000s of machine in the organisation. This activity is required to take necessary care of the systems performance, running processes, CPU utilisation, memory utilisation etc before hand and to get alerts in case of any issues. 
Shell scripts can also be used to monitor any particular tools.
2. Code management using git repository - Storing and managing shell scripts and other code files in git repository using shell scripting.
3. Configuration management using Ansible(writting shell scripts for automation of cronjobs, switching to dir where scripts are present)
