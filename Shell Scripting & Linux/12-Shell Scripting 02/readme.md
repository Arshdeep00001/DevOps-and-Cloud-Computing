# Shell Script Syntax
A shell script must start with the shebang followed by the executable to be used. Then we must mention the metadata of the script such as Author, Date, Title, Version etc.

Also, you can use 'set -x' to run the script in debug mode. On executing the script, in the console it will show the exact output of each of the commands used inside the script. If we don't want to show the commands that we used to the end user then we can remove this command.

Also, you can use 'set -e' to exit or abort the script in case of errors. This command is useful because if there are errors in some code of the script then there is no point to run the remaining code or the complete script.
Now, if we use a pipe after a code, then even if the code before pipe has error, . you need to use 'set -o pipefail' to abort the script in case of errors.

# Shell script to monitor node health:-

#!/bin/bash
set -x
set -e
set -o pipefail
df-h
free -g
nproc
ps - ef | grep amazon | awk -F " " '{print $2}'

-----

ps - ef | grep amazon | awk -F " " '{print $2}'

This command is written to print just all the process ids.
Here ps - ef, this command prints all the processes. 
| , here pipe is used to provide the output of the first command to the second command. 
grep amazon, this command prints all the lines  having the keyword amazon out of all the processes listed previously.
awk -F " " '{print $2}' , this command prints only the second column i.e. the process ids from all the lines  having the keyword amazon out of all the processes listed previously..

----

# Interview Question:- 
Q:- For the below command, why does the pipe not provide the output of the first command to the second command ?
Date | echo "today is"
Ans:-  The difference between  the ps or  script.sh  commands and the Date command is that Date is a default shell command and it sends the output to stdin. In any system there are 2 channels/log flows such as stdin, stdout, stderr. Pipe command only receives the information from the output typed from any command but if any command sends information to stdin, then pipe cannot redirect the output of that command to the second command. 

# Devops Use case :- 
How to search for errors in log files ?
If the logfile is in the current directory then use -
- 'cat logfile.txt | grep error'

If the logfile is stored remotely on internet or google storage etc then use -
- 'curl <url link> | grep error'

Whenever we need to reach out to a service we use endpoint. So, in linux we use curl command. It is similar to API requests in Postman and requests module in Python.

If we need to get the details of any API, we use
- curl -x GET <api url>

find / -name filename  //to search or find any file in the system 
Eg.- find / -name pam

We append any command with sudo if we want to run it as a root user or to run it with root user privileges.
Eg.- sudo find / -name pam

sudo su - //to switch to the root user
Sudo means Substitute user do. 
Su means switch user. Using su command we can switch to any user.
Eg.- su arsh       //It switches user and opens in root folder 
or Eg.- su - arsh


# If and if-else condition :-

a=4
b=10

if [ $a > $b] 
then
      echo "a is greater than b
else
      echo "b is greater than a"
fi


# For loops :-
Eg:-
for i in {1..100}; do echo $i; done


# Interview Question :- 
What is a Trap command ?
Trap command:- Trap command is used to trap signals which means as the admin of Linux on our system, we can trap any signals and make them work as per our requirements. Eg, we can set up a trap signal for ctrl+C so that whenever someone tries to terminate a running script using ctrl+C, the script will not terminate or an email will be sent to some particular users through SMTP or echo statement will be printed etc.

Eg.- trap "echo don't use ctrl+c" SIGINT


What are signals ?
To kill a process in Java, we use "kill -9 java" or "kill -9 11111" where 11111 is the process ID. So, what is happening behind the scenes is that when we execute these commands, there is a signal passed to Linux saying that kill the particular process. 

Also, whenever a Script is running, to terminate the script, we use ctrl+C. Now, how does a Linux machine know that it has to stop the execution of the running script ? So, whenever we run any commands, there is a signal passed to Linux which tells what action needs to be taken based upon the command.
 
In Linux, there are multiple signals. Eg., the signal to kill a process is SIGKILL.
