Q: Can you explain the CICD process in your current project ? or Can you talk about any CICD process that you have implemented ?

A: In your organization you are using a programming language Java. In the current project we use the following tools orchestrated with Jenkins to achieve CICD.
   - Maven, Sonar, AppScan, ArgoCD, Helm and Kubernetes
   
   Coming to the implementation, the entire process takes place in 8 steps :
    1. Code Commit: Developers commit code changes to a Git repository hosted on GitHub. In our current organization we are using GitHub as source code repository.
    2. Jenkins Build: When any developer X commits the code into the source code repository then Jenkins Pipeline is triggered and it pulls the code from the source code repository to build the code using Maven. Maven builds the code and runs unit tests. (If you are using any other programming language at this point of time you have to change from Maven to different build language)
    3. Code Analysis: Sonar is used to perform static code analysis to identify any code quality issues, security vulnerabilities, and bugs.
    4. Security Scan: AppScan is used to perform a security scan on the application to identify any security vulnerabilities. (to perform SAST or DAST)
    5. Deploy to Dev Environment: If the build and scans pass, Jenkins deploys the code to a development environment managed by Kubernetes.
    6. Continuous Deployment: ArgoCD is used to manage continuous deployment. ArgoCD watches the Git repository and automatically deploys new changes to the development environment as soon as they are committed.
    7. Promote to Production: When the code is ready for production, it is manually promoted using ArgoCD to the production environment.
    8. Monitoring: The application is monitored for performance and availability using Kubernetes tools and other monitoring tools.
   
[Refer : https://github.com/iam-veeramalla/Jenkins-Zero-To-Hero/blob/main/python-jenkins-argocd-k8s/Jenkinsfile ]

Q: What are the different ways to trigger jenkins pipelines ?
A: This can be done in multiple ways, below is a briefly explaination about the different options :
   ```
     - Poll SCM: Jenkins can periodically check the repository for changes and automatically build if changes are detected. 
                 This can be configured in the "Build Triggers" section of a job.
                 
     - Build Triggers: Jenkins can be configured to use the Git plugin, which allows you to specify a Git repository and branch to build. 
                 The plugin can be configured to automatically build when changes are pushed to the repository.
                 
     - Webhooks: A webhook can be created in GitHub to notify Jenkins when changes are pushed to the repository. 
                 Jenkins can then automatically build the updated code. This can be set up in the "Build Triggers" section of a job and in the GitHub repository settings.
(Web hooks is a way that whenever a developer is making any code change on GitHub, then GitHub will send a payload (payload is a Json format of information which contains everything like who is the code committer, what is the pull request number that has been created, who is the assignee, who has to verify this, etc  all the information is provided by Jenkins in a Json format) and GitHub notifies Jenkins using the API and the payload and Jenkins pipeline get executed and you have to configure that webhook in the GitHub settings section.
   ```
(The better way to trigger a Jenkins Pipelines is using web hooks. Both Poll SCM and Build Triggers can be configured for every minute as well but the problem with Build Triggers is that they are very costly processes because for every minute Jenkins will check for a new commit at GitHub and it will perform some git fetch commands to understand if there are any changes in the git repository from the previous cache that Jenkins has stored. The problem with Poll SCM or any Cron Job is that it will only execute during the specific run time that you have provided but if developer has committed a code commit at 6am and your Cron job runs at 11 am then there is a 5 hours of lag.)
(If you are using GitHub actions then GitHub actions takes place on event that you are providing it is part of your GitHub application so it can trigger automatically)

Q: How to backup Jenkins ?
A: There are devops engineer who take care of Jenkins Administration as well, whether it is on AWS, On premise or any other cloud provider.
Backing up Jenkins is a very easy process, there are multiple default and configured files and folders in Jenkins that you might want to backup.
```  If you just want Jenkins backup you can just take the backup of .jenkins folder. (If you have installed Jenkins using Jenkins user or by default Jenkins is installed and there is a user called ‘Jenkins’. But let's say you did not do the default installation, you did using some scripts and you install Jenkins then go to the home directory of the user where you install Jenkins then there is a folder called “.Jenkins”. It is a hidden folder that's why it's called .Jenkins, so inside .Jenkins there are pipeline jobs that are running, logs and configuration information)
  - Configuration: The `~/.jenkins` folder. You can use a tool like rsync to backup the entire directory to another location. (rsync is a shell command that will recursively sync the dot Jenkins folder onto any backup system such as EBS volume or any backup system that you configure)
    - Plugins: Backup the plugins installed in Jenkins by copying the plugins directory located in JENKINS_HOME/plugins to another location.
    - Jobs: Backup the Jenkins jobs by copying the jobs directory located in JENKINS_HOME/jobs to another location.
    - User Content: If you have added any custom content, such as build artifacts, scripts, or job configurations, to the Jenkins environment, make sure to backup those as well.
    - Database Backup: If you are using a database to store information such as build results, you will need to backup the database separately. This typically involves using a database backup tool, such as mysqldump for MySQL, to export the data to another location.
(If you are using Jenkins predominantly for 100s of teams then it is very difficult to store all of the information of Jenkins into one disk, so that's why they use some external database)
```
One can schedule the backups to occur regularly, such as daily or weekly, to ensure that you always have a recent copy of your Jenkins environment available. You can use tools such as cron or Windows Task Scheduler to automate the backup process.

Q: How do you store/secure/handle secrets in Jenkins ?
A: Again, there are multiple ways to achieve this, 
   Let me give you a brief explanation of all the posible options.
```  
   - Credentials Plugin: Jenkins provides a credentials plugin that can be used to store secrets such as passwords, API keys, and certificates. The secrets are encrypted and stored securely within Jenkins, and can be easily retrieved in build scripts or used in other plugins.
   
   - Environment Variables: Secrets can be stored as environment variables in Jenkins and referenced in build scripts. However, this method is less secure because environment variables are visible in the build logs.
   
   - Hashicorp Vault: Jenkins can be integrated with Hashicorp Vault, which is a secure secrets management tool. Vault can be used to store and manage sensitive information, and Jenkins can retrieve the secrets as needed for builds.
   
   - Third-party Secret Management Tools: Jenkins can also be integrated with third-party secret management tools such as AWS Secrets Manager, Google Cloud Key Management Service, and Azure Key Vault.
```

Q: What is latest version of Jenkins or which version of Jenkins are you using ?
A: This is a very simple question interviewers ask to understand if you are actually using Jenkins day-to-day, so always be prepared for this.

Q: What is shared modules in Jenkins ?
A: Shared modules in Jenkins refer to a collection of reusable code and resources that can be shared across multiple Jenkins jobs. This allows for easier maintenance, reduced duplication, and improved consistency across multiple build processes.
   For example, shared modules can be used in cases like:
```
        - Libraries: Custom Java libraries, shell scripts, and other resources that can be reused across multiple jobs.        
        - Jenkinsfile: A shared Jenkinsfile can be used to define the build process for multiple jobs, reducing duplication and making it easier to manage the build process for multiple projects.        
        - Plugins: Common plugins can be installed once as a shared module and reused across multiple jobs, reducing the overhead of managing plugins on individual jobs.
        - Global Variables: Shared global variables can be defined and used across multiple jobs, making it easier to manage common build parameters such as version numbers, artifact repositories, and environment variables.
```

Q: Can you use Jenkins to build applications with multiple programming languages using different agents in different stages ?
A: Yes, Jenkins can be used to build applications with multiple programming languages by using different build agents in different stages of the build process.(Example :- Jenkins can build a 3 Tier Application with Frontend in JS, Backend in Java and a microservice in Python)
Jenkins can do it, the efficient way of doing it is using the docker agents. You can write multiple stages in your Jenkins Pipeline and in each stage you can say that for this stage use this Docker agent, for this stage use this Docker agent with Java and finally use thedocker agent to Python and whenever the Jenkins pipeline is executed finally all your Docker containers are deleted as well. (the important thing here is you are not wasting your computer resources and you are also not configuring anything on your worker node, so your compute resources are saved and also your maintenance overhead is gone, so that's why you can explain this using the Docker agents)
Jenkins supports multiple build agents, which can be used to run build jobs on different platforms and with different configurations. By using different agents in different stages of the build process, you can build applications with multiple programming languages and ensure that the appropriate tools and libraries are available for each language.
For example, you can use one agent for compiling Java code and another agent for building a Node.js application. The agents can be configured to use different operating systems, different versions of programming languages, and different libraries and tools.
Jenkins also provides a wide range of plugins that can be used to support multiple programming languages and build tools, making it easy to integrate different parts of the build process and manage the dependencies required for each stage.
Overall, Jenkins is a flexible and powerful tool that can be used to build applications with multiple programming languages and support different stages of the build process.

Q: How to setup auto-scaling group for Jenkins in AWS ?
A: This is important because for some organizations they want to have Jenkins with multiple worker nodes but for some reasons their applications are very huge and they cannot use Docker agents so decide to use an ec2 instance which acts as a Jenkins master and there are 20 Jenkins worker nodes each worker node for one team, but the problem is that during certain days like during Christmas or during public holidays they might receive extra load and for that extra load they require extra worker nodes, but if you create these worker nodes and if you don't use them again that's a problem. So to solve this problem what they do is they configure Jenkins with auto scaling groups in ec2 instances or in AWS order scaling group takes care of automatically scaling your ec2 instances using predictive scaling or whatever scaling that you configure.

Here is a high-level overview of how to set up an autoscaling group for Jenkins in Amazon Web Services (AWS):
```
    - Launch EC2 instances: Create an Amazon Elastic Compute Cloud (EC2) instance with the desired configuration and install Jenkins on it. This instance will be used as the base image for the autoscaling group.    
    - Create Launch Configuration: Create a launch configuration in AWS Auto Scaling that specifies the EC2 instance type, the base image (created in step 1), and any additional configuration settings such as storage, security groups, and key pairs.    
    - Create Autoscaling Group: Create an autoscaling group in AWS Auto Scaling and specify the launch configuration created in step 2. Also, specify the desired number of instances, the minimum number of instances, and the maximum number of instances for the autoscaling group.    
    - Configure Scaling Policy: Configure a scaling policy for the autoscaling group to determine when new instances should be added or removed from the group. This can be based on the average CPU utilization of the instances or other performance metrics.    
    - Load Balancer: Create a load balancer in Amazon Elastic Load Balancer (ELB) and configure it to forward traffic to the autoscaling group.    
    - Connect to Jenkins: Connect to the Jenkins instance using the load balancer endpoint or the public IP address of one of the instances in the autoscaling group.    
    - Monitoring: Monitor the instances in the autoscaling group using Amazon CloudWatch to ensure that they are healthy and that the autoscaling policy is functioning as expected.

 By using an autoscaling group for Jenkins, you can ensure that you have the appropriate number of instances available to handle the load on your build processes, and that new instances can be added or removed automatically as needed. This helps to ensure the reliability and scalability of your Jenkins environment.
```

Q: How to add a new worker node in Jenkins ?
A: Log into the Jenkins master and navigate to Manage Jenkins > Manage Nodes & Clouds > New Node. Enter a name for the new node and select Permanent Agent. Configure SSH and click on Launch. 
(If you are using the previous version of Jenkins the option is just “Manage Nodes”. So, go to manage nodes and clouds and if you want to add a Docker agent you can do it using clouds, if you want to add just a virtual machine then you can click on add a new node and after that you provide the information of what is the IP address of this node, what are the SSH Keys you want to connect with public key or you want to connect with password, you authenticate it, then you add it as a permanent member and finally click on the launch button so your node configuration is done)

Q: How to add a new plugin in Jenkins ?
A: Using the CLI, 
   `java -jar jenkins-cli.jar install-plugin <PLUGIN_NAME>`
(Using CLI is an efficient way of doing it because let's say you are a devops engineer but not a Jenkins administrator, so sometimes your UI access is blocked or you might want to install 100 plugins, so every time you go to the UI and you install it and wait for the plugin to be installed, instead, you can simply write a shell script and use this Java command)
  Using the UI,
   1. Click on the "Manage Jenkins" link in the left-side menu.
   2. Click on the "Manage Plugins" link and search for the plugin that you want and you can install it.

Q: What is JNLP and why is it used in Jenkins ?
A: In Jenkins, JNLP is used to allow agents (also known as "slave nodes") to be launched and managed remotely by the Jenkins master instance. This allows Jenkins to distribute build tasks to multiple agents, providing scalability and improving performance.
   When a Jenkins agent is launched using JNLP, it connects to the Jenkins master and receives build tasks, which it then executes. The results of the build are then sent back to the master and displayed in the Jenkins user interface.
(How do you allow your worker notes to talk to Jenkins master so once you set up this SSH configuration okay your Jenkins workers will work fine but there has to be a mechanism how your Jenkins master and slave nodes are talking to each other right so what you can simply do is instead of uh like you know you can just download this jnlp jar from your Jenkins Masters UI and just directly install this jnlp Java jar and your slave notes will start working as an agents so it's a mechanism of how your master node will talk to your uh sorry the worker nodes okay so that's what I explained here in Jenkins jnlp is used to allow agents to be launched and managed remotely by Jenkins Master okay and what it does is once the Jenkins agent is launched using the jnlp it connects to Jenkins master and receives the build talks uh build task which has to be executed)

Q: What are some of the common plugins that you use in Jenkins ?
A: Be prepared for answer, you need to have atleast 3-4 on top of your head, so that interview feels you use jenkins on a day-to-day basis. Eg :- Git plugin, Jira plugin, Kubernetes plugin, SonarQube Plugin, Docker plugin, Maven Integration Plugin, Amazon EC2 Plugin, Build Pipeline Plugin, etc. (Refer for more info https://www.opsera.io/blog/ace-your-devops-game-with-this-ultimate-list-of-plugins-in-jenkins )

#Bonus :- Business Benefits of CICD https://www.opsera.io/blog/ci-cd-business-benefits 

