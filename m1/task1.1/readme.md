In the beginning we created an ***GitHub account***. After that I created **private repository**. Next strep was clone this repo to my workstation. 
I created **develop branch** and checkout on it using: 
```
git checkout -b develop
```
Then I created empty index.html using :
```
touch index.html
```
And then I made **add** and **commit**:
```
git add *
git commit -m "Test message"
```
After that I **created a new branch and checkout on it**:
```
git checkout -b images
```
And downloand three images in new directory and **commit** everything:
```
mkdir images
git add *
git commit -m "Download 3 images"
```
Then I changed index.html:
```
<!DOCTYPE html>
<html>
<head>
<title>Task 1</title>
<link rel="stylesheet" href="styles/mystyle.css">
</head>
<body>

<h1>This is a H1</h1>

<img src="images/img1.jpeg">
<img src="images/img2.jpeg">
<img src="images/img3.jpeg">

</body>
</html>
```
And made **commit**:
```
git add *
git commit "Change index.html
```
Then I created one more branch with styles and checkout on it:
```
git checkout -b styles
```
And add styles to index.html:
```
body{
background-color:lightblue;
}

h1{
color:lightgreen;
font-size:12px;
}

img{
width:200px;
height:200px;
}
```
And made **commit**:
```
git add *
git commit -m "Add styles"
```
Then I **returned to the develop branch**:
```
git checkout develop
```
Where I made **merge** our styles and images branches: 
```
git merge images
git merge styles
```
In my case ***I didn't have merge conflict***, but if I have, I need to **open file with merge conflict and choose one of the solutions**.
Then I pushed all my changes to the GitHub:
```
git push origin --all
```
After I created a file with log info:
```
git reflog > task1.1_GIT.txt
```
and add to my local repository:
```
git add * 
git commit -m "Add task1.1_GIT.txt with log info"
```
and push it to the GitHub:
```
git push origin
```

------------------------------------------------


DevOps it is metholodogy of active interaction of Dev and Ops specialist.
The main dutioes of an DevOps engineer:
1)CI/CD process
2)Monitoring
3)Build autiomation
4)Infrastructure as a code
5)Orchestration

