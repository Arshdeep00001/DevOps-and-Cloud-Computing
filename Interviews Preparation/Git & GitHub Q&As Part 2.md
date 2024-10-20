Q. Is Git a distributed or centralized version control system ? What is the difference between them ?
A. Centralized version control systems are the traditional version control systems that are mostly not used these days, Eg :- Concurrent Versions System (CVS), Perforce, and Subversion (SVN). On the other hand, we have distributed version control system which are widely used, Eg :- Git, Mercurial, BitKeeper, Bazaar. In centralized version control system you have the client and server architecture and server which is a remote repository has all the copies of your code like all the versions of the code are only available with the server (i.e. stored centrally) whereas in the distributed version control system every developer has all the versions of the code like all the copies of the code are with each and every developer who has cloned the remote repository so that's why it's called distributed version control system.

Some Popular Distributed Version Control Repository Hosting Platforms are GitHub, GitLab, BitBucket, etc.

Q. What are the git commands that you use to commit changes to your remote repository ?
A. If you're working on git and if you're making any changes to your code end of the day you have to submit the changes to your remote repository so you basically use three commands :- git add, git commit and git push.

Q. What is the difference between git fetch and git pull ?
A. Git fetch only informs you about the latest changes that are made to your remote repository. Eg :- you are working on a specific repository and you have cloned the repository to your local and after x days you realize that you want to see what are the changes that are made to your remote repository by your friends or colleagues or any other developers. So you can simply do “git fetch” it will show you the information about what are the changes that are made but it does not merge the changes to your local repository whereas “git push” does the same but it will also merge the changes to your local repository.

Q. What is the difference between git merge and git rebase ?
A. We can use both git merge and git rebase to merge the code changes from one branch to the other branch but the only difference is that if you want a linear history you use “git rebase” whereas if you are not bothered about the git history you can simply do “git merge”. 

Q. Difference between .git and .gitignore ?
A. The .git folder contains all the information like all your project details, all the file information related to your commit, your remote repository addresses, your remote repository for your local repository etc. All the things are stored as objects in git. The .git folder is everything for your repository and you should not delete your .git because if you delete the .git then your all the information related to the repository is lost.
The .gitignore file means from the name itself thet if you want to ignore anything from .git then you simply go and put that file information in the .gitignore file. Eg:- you don't want to push a specific file from your local repository to remote repository so you can simply add the file reference in your dot git ignore. 

Q. What are pre commit hooks and what are post comment hooks ?
A. If you want to perform an action before or after some event, then we can do it using a hook. The names itself suggest that you have a pre-commit hook and you have a post commit hook. Pre-commit hooks are the actions that are taken before you do git commit and post commit hooks are the actions that are that are taken by git after the commit. Eg :-  you have certain files in your Project such as the password files, some secure information files, your public key, private key, etc and you don't want to commit/push those files even accidently to Git. So for that you can configure them in your pre-commit hook and you can tell git that before every commit just execute this script and what git does is that even if you are accidentally committing the public key or password etc , then it executes this pre-commit hook and it says that I cannot do this because your pre-commit hook is preventing it. 

Q. What is web hook ?
A. If you want to trigger a pipeline or you want to run a python program after your git commit is done or if you want github to perform an action, so simply you can configure a web hook. In GitHub, go to GitHub Web Hooks, there are a lot of actions that can be taken place like you can perform web hooks after issues, you can perform web hooks after pull requests, you can perform web hooks after issue comments etc, i.e. for every action in github you can configure a webhook.

Q. How to pull and push changes to git ?
A. If you want to push you can use “git push” and if you want to pull you can simply do “git pull”.
The git push command is used to upload content to a remote repository. The git pull command is used to fetch and download content from a remote repository and immediately update the local repository to match that content. The git pull command is actually a combination of two other commands, “git fetch” followed by “git merge”. “git pull –rebase” is used to combine “git fetch” followed by “git rebase”. (For more understanding refer https://www.atlassian.com/git/tutorials/syncing/git-pull#:~:text=git%20pull%20is%20one%20of,be%20confused%20with%20git%20pull%20 )

Q. What is git stash and talk about its use cases ?
A. Let's assume you're working on a code change and suddenly there is a very serious bug and you want to move from this code to the other bug and you cannot commit these changes because they are not ready or complete. So you can stash these code changes using “git stash” which means you are temporarily saving them in your git and you move to a different bug. Then you make code changes for the bug fix and once you are satisfied with them you push them and then you come back to the previous code and say “git stash pop”. So whatever the changes that you have stashed previously, you will get those changes back and you can continue with your code changes.

Q. What is the difference between git clone and git fork ?
A. Git clone is basically used for creating a copy of a particular remote repository in your local system whereas git fork is used for getting a particular git repository into your namespace. 

Q. what is cherry-pick in git ?
A. To merge a particular commit from one branch to the other branch.

Q. How to amend a commit in git ?
A. Amending is nothing but to add something to the existing commit. Let's assume you have done something wrong with your commit and you have pushed the commit. If you want to fix the broken commit then you can use “git commit –amend” and that would actually amend or fix your broken change. 

Q. How do you resolve a merge conflict in git ?
A. Basically it depends on the merge conflict itself like how did you run into this merge conflict,  who is the developer that has made the change. Let's assume that you are making a logic change to the calculator like improving the addition function and then you realize that it is actually creating a conflict with the existing code. So what you can do is that you can sit with the other developer and try to understand why he has made the change and you can come to a consensus that which change is correct and which change is wrong and update the code manually accordingly. So that is a simple way of resolving a merge conflict. So if you run into a conflict, you can do “git merge --abort” to completely remove your changes or if you know that your changes are fixed after you sat with the developer and you understood what has to be changed then simply add the changes back and do “git merge –restore”(or use git rebase for both commands). 



