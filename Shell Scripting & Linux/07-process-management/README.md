# Process Management in Linux

## Introduction to Process Management
A process is an instance of a running program. Linux provides multiple utilities to monitor, manage, and control processes effectively. Each process has a unique **Process ID (PID)** and belongs to a parent process. Eg. a running Python Application or a running web/application server or executing a shell script is a process.

## Index of Commands Covered

### Viewing Processes
- `ps aux` – View all running processes (it also shows CPU and Memory utilisation).
Output :- User - who initiates/triggers the process.
PID - every process has a unique Process ID, to identify the process and take any action on it.
%CPU - CPU utilisation
%MEM - Memory utilisation
START - Start Time of the process
COMMAND - with which command the process has started

- `ps` – View processes
- `ps aux | nl` – View all running processes along with a line number
- `ps aux | wc -l` – to get a word count of all the running processes
- `ps -ef` – View all running processes (it shows CPU utilisation but doesn't show Memory utilisation)
- `ps aux | grep java` – to search for a process running Java (or you can mention any other keyword you wish to search).
The above command will show atleast one line output which will show the process for the above command with java keyword even if there is no process that is running java. So, to avoid that, we can use the below command
- `ps aux | grep java | grep -v grep` – here -v grep removes the grep word. -v is used to remove/ignore something
 
- `ps -u username` – View processes for a specific user
- `ps -C processname` – Show a process by name
- `pgrep processname` – Find a process by name and return its PID
- `pidof processname` – Find the PID of a running program

### Managing Processes
- `kill PID` – Terminate a process by PID.
Q. Why do we kill a process ?
A. When a heavy application or a process consumes a lot of CPU and Memory resources such that it slows the working of the other processes or hangs the entire system, then we need to kill that particular process.

- `pkill processname` – Terminate a process by name
- `kill -9 PID` – Force kill a process (this is used when even after killing a process using `kill PID` the process doesn't get killed)
- `pkill -9 processname` – Kill all instances of a process
- `kill -STOP PID` – Stop a running process
- `kill -CONT PID` – Resume a stopped process.
 
Developer asks DevOps Engineer - Can you share the Thread Dumps of the Process (Threads are all the internal sub-processes of the Java Application) i.e. the logs ?
 - `kill -3 PID` – To get the Thread Dumps (especially for Java Applications) 

- `renice -n 10 -p PID` – Lower priority of a process
- `renice -n -5 -p PID` – Increase priority of a process (requires root).
Use the renice commands very carefully, only if you are confident and fully aware of the running Applications and the Server.
Using renice commands, the priority of the CPU processes is set from -20 to 19, where -20 is the highest priority and 19 is the lowest priority. So, in the above commands, 10 will lower the priority and -5 will increase the priority.

  
### Background & Foreground Processes
- `command &` – Run a command in the background
- `jobs` – List background jobs
- `fg %jobnumber` – Bring a job to the foreground
- `Ctrl + Z` – Suspend a running process
- `bg %jobnumber` – Resume a suspended process in the background

### Monitoring System Processes
- `top` – Interactive process viewer
- `htop` – User-friendly process viewer (requires installation)
- `nice -n 10 command` – Run a command with a specific priority
- `renice -n -5 -p PID` – Change priority of an existing process

### Daemon Process Management
There are special processes on the Linux servers known as services. They are background running processes which start at the time of booting of the server. If your Linux server goes down, the processes (like Python application) that you're running will obviously go down and it doesn't automatically start, Whereas services (like web server) are special kind of process which runs in background and when your server goes down, during the restart of your server, these services come up automatically.

- `systemctl list-units --type=service` – List all system daemons/services
- `systemctl start service-name` – Start a daemon/service
- `systemctl stop service-name` – Stop a daemon/service
- `systemctl enable service-name` – Enable a service at startup

## Viewing Process Details
### Using `ps`
Show processes for a specific user:
```bash
ps -u username
```
Show a process by name:
```bash
ps -C processname
```

### Using `pgrep`
Find a process by name and return its PID:
```bash
pgrep processname
```

### Using `pidof`
Find the PID of a running program:
```bash
pidof processname
```

## Managing Processes
### Killing Processes
To terminate a process by PID:
```bash
kill PID
```
To terminate using process name:
```bash
pkill processname
```
Force kill a process:
```bash
kill -9 PID
```
Kill all instances of a process:
```bash
pkill -9 processname
```

### Stopping & Resuming Processes
Stop a running process:
```bash
kill -STOP PID
```
Resume a stopped process:
```bash
kill -CONT PID
```

### Changing Process Priority
View process priorities:
```bash
top  # Look at the NI column
```
Change priority of a running process:
```bash
renice -n 10 -p PID  # Lower priority (positive values)
renice -n -5 -p PID  # Higher priority (negative values, root required)
```

### Running Processes in the Background
Run a command in the background:
```bash
command &
```
List background jobs:
```bash
jobs
```
Bring a job to the foreground:
```bash
fg %jobnumber
```
Send a running process to the background:
```bash
Ctrl + Z  # Suspend process
bg %jobnumber  # Resume in background
```

## Monitoring System Processes
### Using `top`
Interactive process viewer:
- Press `k` and enter a PID to kill a process.
- Press `r` to renice a process.
- Press `q` to quit.

### Using `htop`
A user-friendly alternative to `top`:
```bash
htop
```
Allows mouse-based interaction for process management.

### Using `nice` & `renice`
Run a command with a specific priority:
```bash
nice -n 10 command
```
Change the priority of an existing process:
```bash
renice -n -5 -p PID
```

## Daemon Processes
Daemon processes run in the background without user intervention.
List all system daemons:
```bash
systemctl list-units --type=service
```
Start a daemon:
```bash
systemctl start service-name
```
Stop a daemon:
```bash
systemctl stop service-name
```
Enable a service at startup:
```bash
systemctl enable service-name
```

## Conclusion
Process management is crucial for system performance and stability. By using tools like `ps`, `top`, `htop`, `kill`, and `nice`, you can efficiently control and monitor Linux processes.
