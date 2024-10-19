Git Commands & Interview Q&As

git init         //to create or initialize a local git repository
.git is componenet to which Git will refer for tracking, logging, providing or storing credentials to secret git repo

.git/hooks/re-commit           //inside .git folder there is a file called hooks. We use this Hooks and write a pre-commit hook which will prevent your developers to push the password into git.

Q. how to create a repository and what happens once you create a repository ?
A. to create or initialize a local git repository we use "git init" command. Once we use "git init", then .git folder gets created which is responsible for tracking and ensuring there are no secrets.

git status        //command to see what is happening in this repository

Q. what is the reason why we use git ?
A. git provides you versioning, it tells you what are the changes that are made

# To start using Git, we need to create a Remote Repository either using the GitHub UI or using the command 
git remote add "<repository URL>"
Then we follow the next steps like git add, git commit and git push and we push our code to the remote repository. If we donot create or add a Remote Repository first then the code that we add or commit or push will not be processed for the remote repository.

OR If we have already created a Remote Repository and we want to connect it with our Local Repository then we can do the cloning of the Remote Repository on our local system using the below command and then provide your GitHub Password (for https) or Public/Private key (for ssh) (asked in GitHub Enterprise to authenticate) and then we can follow the next steps :
git clone "<https or ssh URL>"        //Here, we pull or download the code from GitHub

We can check in our local system if our current location or directory is connected with the Remote Repository using "git remote -v"

ssh -keygen -t rsa         //to generate a new Public/Private key
It will create a .ssh folder in your home directory. Inside it, we will have multiple files like public key, private key, known-host key. Open file id_rsa.pub which is the public key, copy the key and paste it in your GitHub -> Settings -> SSH & GPG Keys -> New SSH Key -> provide title, select Key type as Authentication Key and in Key column paste the key. Once we add it, next time it will not even ask you for the password.  

git add calculator.sh           //to add file to Git to track the file and its changes
OR     git add .
git diff         //to check what are the changes made in comparison to the previous version of the code/file

git commit -m "my first commit"           //to commit the file. m is for message.

git log           //to show the list of all git commits done by anyone in your Team and to check which person did a particular commit

git log --oneline         //To show one liner commit details

git push           //to push the code from local repository to Git repository (self-hosted Git or GitHub or BitBucket etc) 

Q. what is the git workflow that you use in your organization ?
A. day in day out we use the commands git add, git commit and git push 

Q. what is a remote repository ?
A. in my organization we are using GitHub so GitHub repository will be my remote repository.

Q. Diff b/w Git Clone vs Git Fork ?
A. clone - pulling or downloading the code from GitHub
Fork - Git it is a distributed version control system. That means the git code is present in one place but you know you can distribute it like you know you can create multiple copies or multiple replicas of this git and you can collaborate on that replica with other developers/teammates.

# A branch is created to work on a new feature without impacting the existing code and then merging the new code back to the main branch if the new feature works successfully.
git branch <branch_name>       //to create a branch

git checkout -b <branch_name>          //to create a branch from the point where the code is written till this time
Eg:- git checkout -b division

//Do changes and commit 
//When we do "git log" we see one commit more than the main branch 

git checkout main         //To switch between branches 

Now we are in the main branch. But Let's say we need to check the logs of the division branch then we don't have to firstly go to division branch and then do "git log", rather we can use:
git log division 
syntax:- git log <branch_name>

This command is equivalent to :
git checkout <branch_name> && git log

Q. Difference between git merge, git rebase and git cherry-pick
A.  cherry-picking means picking a particular commit from the feature branch and merging it to main branch. You can use it when you are sure that there is no merge conflict.
Syntax: git cherry-pick <commit_id>

git merge <branch_name>

git rebase <branch_name>

Now, we will take an example of a real-time scenario. We have a main branch and we create a new feature branch. Now we start adding commits to the new feature branch. Also, we started adding commits to the main branch as well. Now, we can use both the merge and rebase commands to merge the n number of commits of the feature branch to the main branch. 
Now, the main difference between the merge and rebase command is that if we use the merge command then it will merge the code as the last or topmost or the latest commit on the main branch. 
If we use the rebase command then it will merge the code at the point when that feature branch was created on the main branch i.e. the commit will be in between the old commits and the new commits added after the feature branch was created on the main branch.
![image](https://github.com/user-attachments/assets/9ddca357-246d-494d-b4db-5a2a11e02769)


Understanding merge conflicts :- 
Now, when we are trying to merge the code from the feature branch to the main branch but conflicts arise when two people have changed the same lines in a file, or if one developer deleted a file while another developer was modifying it. In these cases, Git cannot automatically determine what is correct. Conflicts only affect the developer conducting the merge, the rest of the team is unaware of the conflict. Git will mark the file as being conflicted and halt the merging process. We then need to sit with the developers and update the code manually with the correct changes to resolve the conflict.

Types of merge conflicts:
1) Git fails to start the merge :- A merge will fail to start when Git sees there are changes in either the working directory or staging area of the current project. Git fails to start the merge because these pending changes could be written over by the commits that are being merged in. When this happens, it is not because of conflicts with other developer's, but conflicts with pending local changes. The local state will need to be stabilized using git stash, git checkout, git commit or git reset. A merge failure on start will output the following error message: 
error: Entry '<fileName>' not uptodate. Cannot merge. (Changes in working directory)
2) Git fails during the merge :- A failure DURING a merge indicates a conflict between the current local branch and the branch being merged. This indicates a conflict with another developers code. Git will do its best to merge the files but will leave things for you to resolve manually in the conflicted files. A mid-merge failure will output the following error message:
error: Entry '<fileName>' would be overwritten by merge. Cannot merge. (Changes in staging area)



