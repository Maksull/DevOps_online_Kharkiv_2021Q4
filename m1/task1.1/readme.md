In the beginning we createdd an **GitHub account**. After that we created **private repository**. Next step was clone this repo to th workstation.
We **created develop branch** and **checkout** on it using:
```
git checkout -b develop
```
Then we created index.html adn **commit** it using:
```
touch index.html
git commit -m "Create index.html"
```
After that we **created a new branch** and **checkout** on it:
```
git checkout -b images
```
And did some things. Then we created one more branch and checkout on it:
```
git checkout -b styles
```
And did some things. Then we returned to the develop branch:
```
git checkout develop
```
In develop we did merge out *styles* and *image*s branches:
```
git merge images
git merge styles
```
In my case I didn't have a merge conflict, but if I have, I need to open file with the merge
conflict and choose one of the solutions.
Then I **pushed** all my changes to the GitHub: 
```
git push origin --all
```
After I created a file with log info:
```
git reflog > task1.1_GIT.txt
```
and **add** and **commit** in my local repository:
```
git add *
git commit -m "Save log info"
```


------------------------------------------------


DevOps it is metholodogy of active interaction of Dev and Ops specialist.
The main dutioes of an DevOps engineer:
1)CI/CD process
2)Monitoring
3)Build autiomation
4)Infrastructure as a code
5)Orchestration

