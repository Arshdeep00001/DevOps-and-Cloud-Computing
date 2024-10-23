Q. List some of the commonly used shell commands ?
A. Tell about the commands that you use on day to day basis. Eg :- ls, cp, mv, mkdir, cat, vim, touch, grep, find, df, top, sar,  etc. 
You can also tell about the advanced commands such as netcat, route, traceroute etc but you can avoid telling about them in the first place because these are the commands which you use only when you are into issues and when you want to debug something.

Q. Write a simple shell script to list all the processes.
A. The purpose of asking this question is to check if you regularly work on a Linux machine or not.
So to identify the list of processes, we use :
ps -ef
//It will list all the processes and it will also provide information of all the processes.
 
It provides a lot of information but if we want to list all the process ID (i.e. we need to print the second string or column), then we use :
ps -ef | awk -F” ” ‘{print $2}’
//It will print all the process IDs
 
//awk is basically used to filter the output of a specific line or a specific uh file
//-F” ” denotes a space field separator because white space is separating a string from a string

Q. Write a script to print only errors from a remote log.
A. Let's say all your logs are getting stored in a Google storage or in an S3 bucket, so you can get the entire logs using the API call. Also, you can retrieve logs or any information from a remote server or a remote machine in shell script using the Curl command. Using curl you can get the entire output of the file. If you want to only print the error message, use :
Curl <log file Url> | grep <specific Error type>
Eg :- Curl https://github.com/iam-veeramalla/sandbox/blob/main/log/dummylog01122022.log| grep TRACE
(You can get a Dummy log File from here https://github.com/iam-veeramalla/sandbox/blob/main/log/dummylog01122022.log )
You will get all the trace entries and you can simply copy this into a file and you can share this output to your colleagues or requestor.
Sp, we will say you can achieve this by using curl pipe and grep commands. curl is retrieving the output or curl is getting your entire log file, grep is only getting a section of output that you want like if you want error then it is only getting error and pipe is combining the curl command with grep command. pipe will send the output of your entire First Command to the second command and without pipe we will not get the desired output.

Q. Write a shell script to print numbers divided by 3 and 5 and not 15.
OR print even numbers -> i.e. divisible by 2
OR print odd numbers -> i.e. not divisible by 2
OR print numbers divisible by 3 
OR print prime number
A. Firstly, break the question into multiple parts and finally put this into a shell script. So, we need to print all the numbers that are divisible by 3 and print all the numbers that are divisible by 5 but exclude the multiples of 15. You need to ask the interviewer or how much range do you want me to print i.e. 1 to 100 or 1 to 1000 etc or a custom range of numbers. Firstly, explain your approach to the Interviewer and then start writing the script. 
 
Sample Script :
 

Q. Write a script to print number of s in Mississippi.
A. We will write the below Script :
 
//-o stands for only, wc stands for word count

Q. How will you debug the shell script ?
A. Whenever you start writing your shell script, start the script with “set –x” (it should be the first line of your Script). Then your shell script will run in debug mode or you can able to troubleshoot your shell script.

Q. What is crontab in Linux? Can you provide an example of usage ?
A. Let's say you are a Linux administrator, so as a Linux admin your job or roles and responsibilities are every day at 6 PM you have to send a report. You have to send the report of node health i.e. how your node is performing or what is the CPU usage, what is the RAM usage, etc. Instead of logging in and executing a specific script every day at 6 pm, you can make use of cron tab which is like an alarm, so every day you just set your crontab to 6 pm and Linux will automatically execute your script at 6 pm and give you the output whether you want to store it in S3 bucket or you want to store in a specific folder of a file you can do that using crontab.

Q. How do you open a file in a read-only mode ?
A. cat <fine_name>
Vim -r <fine_name>

Q. What is the difference between soft and hard link ?
A. In Linux there are two links one is softlink and one is hard link. Let's say that you create a file and save a file, then it will get saved in the memory or on the disk. No, if you want to reuse this file multiple times or you want to create a copy of this file, in such cases you can use hard links. Using hard links you can create copy or you can mirror a specific file and even if your original file gets deleted then still the copy will be available. We use hard links to copy some secret files or important documents. Softlinks are like shortcut files i.e. they are like a copy but not exact copy of a file and they point to the original file. Another example is .python files which refer/point to some Python file. So, In Soft links if your original file gets deleted then the file copy will have no data or it will not be pointing to any file and it will not work.

Q. What is the difference between break and continuous statements in a loop ?
A. Break means breaking the execution and continue means continuing the execution of the loop. The continue comes with a special condition called skip which means skip this and continue the next. 
Eg:- We need to print the number that is divisible by 3 and the number that is divisible by 5 but if the number is divided by 3 and 5 or f it is a multiple of 3 and 5 i.e.  15, then  you have to ignore the number. So, to ignore the numbers divisible by 15, we will use continue. Similarly break can be used to break the loop when when the number is more than 100, so as to print the number upto 100 with the above condition.

Q. What are the disadvantages of shell scripting ?
A. Try to explain your real-time use cases like whenever you are writing shell script what are the disadvantages that you find.
 
Also, it's not statically typed. You can just declare a variable and even if you are not using it or even though there are n number of Undeclared variables, still your shell script will not complain or your compiler will not complain.

Q. What are different kinds of loops and when to use ? 
A. For, while and do-while loops and explain the purpose/use case of each of the loops. 

Q. Is bash dynamically or statically typed ?
A. The modern day programming languages are usually statically typed such as golang but the programming language like python or shell are the scripting language and they are dynamically typed.
So, in Python or Shell, we can declare a variable or an integer without specifying its type, thus it is dynamically typed i.e. it will take up the data type as per the value we will provide.
Eg:- x=5
X=”Arsh”
On the other hand, in a statically typed programming language like golang, we need to specify the data type at the time of declaring the variable.
Eg:- we provide, var x string
Then if pass the value of x as an Integer then during compilation the complier or golang interpreter will throw an error stating that x is declared as a string and cannot have an integer value. We will not face any such issues using a dynamically typed programming language.

Q. Explain about a network troubleshooting utility.
A. The recommend tool is traceroute which you can use for your Network debugging. For eg., if you want to see why your network is slow, then usually you will go to your internet and you will find some networking tools and you will try to understand why is it slow but the classic way of doing, which even these modern day tools also use these kind of shell commands or the Linux commands underneath, you can simply say traceroute or traceroute followed by google.com so what I am trying to do is I'm trying to reach the google.com. Let us see what are the number of hops in between your trace route and google.com that is from your laptop it goes to your router from your router it goes to your internet service provider router from there it will take multiple Hops and finally reach google.com so this command will explain you what are the different Hops and how much each hop is taking time.
 
So firstly it shows your IP address, after that it will go to a specific act corporation that you using, after that it goes to a different IP address (which cannot be shown for security purpose), after that it goes to your internet service provider and finally it will reach google.com.
Similarly, there is one more command called tracepath. tracepath is also efficient command because using tracepath also you can identify these things and tracepath does not require root privileges 

Q. How will you sort list of names in a file ?
A. Whenever you are explaining your interviewer,  always talk about the easiest way and then you can say so sort comes with the nature of time complexity (O)n2. You can say that I can improve the efficiency but first of all the easy way of doing is to use the sort command. So Linux natively has a command called sort.

Q. How will you manage logs of a system that generates Huge lot files every day ?
A. This is very very important question for Linux administrators and also devops Engineers because as a Linux admin you manage a lot of applications, so each of these applications will definitely omit logs and if your application is a real-time customer facing application then  it will emit n number of logs. So, how do you preserve all of these logs. If you keep storing of all these logs then your disk size gets on increasing. So for that reason there is an efficient way on Linux that is called logrotate. So using logrotate you can efficiently manage your Linux machine’s logs or application logs. So the logrotate command can be used as “logrotate (gzip, zip)” and you can define like for how many days you want to rotate these logs, let's say for every day once end of your 24 hours you can say that once 24 hours is done just zip this log you can also Define the format like you can say gzip or you can say zip or you can say tar. Create a compressed version of this ZIP file and say that okay after 30 days if the 30 days has happened just delete the log.




