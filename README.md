![BEWD Logo](assets/BEWD_Logo.png)

Congratulations on joining us at General Assembly for the __Back-End Web Development__ course!

## BEWD 11 GitHub Class Repository
GitHub is a popular developer tool, and we want you to be familiar with it. GA is all about learning by doing, so in order to learn how to use GitHub we are going to use it every lesson as part of the course.

During the first lesson, you should make a clone of this repository for your own personal use (fork and then clone the repo). 

From the terminal, clone the repository by typing:
```bash
git clone https://github.com/YOUR_USERNAME_HERE/BEWD_NYC_11.git
```
In addition, you should create a link to the instructor's copy on GitHub (which we call an upstream remote) so that you can download the latest version of your materials.

You can do this with the termianl as so:
```bash
git remote add upstream https://github.com/ga-students/BEWD_NYC_11.git 
```
Verify you added both remotes by typing. You should see four lines starting with `origin` and `upstream`:
```bash
git remote -v
```
We know it takes time to get familiar with GitHub so here are a few quick tips:


### How Do I Get Files From GitHub?
For each lesson the instructor will post slides, exercises and, solution files. To get these files, __pull__ (download) them from the instructor's repository (upstream). 

From the terminal type: (first make sure you are in the correct directory, by using `cd ~/dev/BEWD_NYC_11/`)
```bash
git pull --rebase upstream master
```
	
### How Do I Post Files To My Forked Repository on GitHub?
Yes, you may have your files locally on your computer but consider pushing them to the cloud with git. Here are some benefits. 

*	Easily share your homework with the instructional team for grading.
*	Share your files with your teammates.

To __push__ files to GitHub:

From the terminal type:
(make sure you are in the correct directory, by using `cd ~/dev/BEWD_NYC_11/`)
```bash
git add path/to/files_you_want_to_add
```

```bash
git commit -m "Enter a message describing what you're pushing here."
```

```bash
git push origin master
```

And that's it! All of your files will be added to GitHub and will be accessible, here: https://github.com/YOUR_USERNAME_HERE/BEWD_NYC_11

See this [link](https://help.github.com/articles/fork-a-repo) for more detailed information on fork, upstream, pull, and push:


### How Do I Submit Homework?
To submit homework, you can follow these steps:

1. First, `cd` into the place where you store your BEWD files. For many of you this is in your `~/dev/BEWD_NYC_11` folder.
```bash
cd ~/dev/BEWD_NYC_11_Homework/
```

2. Copy the homework into your personal directory. You'll want to replace `Secret_Number` and `Brooks Swinnerton` with the homework we're working on and your name respectively:  
```bash
cp -R Ruby/Secret_Number _Brooks_Swinnerton/
```

3. CD into the newly created homework directory:  
```
cd Homework/_Brooks_Swinnerton/Secret_Number/
```

4. Make your changes to the homework files in your favorite text editor, e.g. sublime:  
```
subl .
```

5. Once you've completed the exercise, add your changes to git  
```
git add .
```

6. Commit your changes to git
```
git commit -m "Submitting homework for Secret Number"
```

7. Push your changes to GitHub
```
git push origin master
```

8. Submit a pull request so that the instructors can see your homework
![Pull Request](assets/GitHub/pull_request_button.png)

### What's in a lesson folder?
Each lesson folder contains:

*	Code Alongs / Code Demos
*	Exercises
*	Readme (aka agenda)
*	Resources
*	Slides


## Grading
In order to pass this course General Assembly students must:

*	Complete and submit 80% of all course homework assignments. 
*	Complete and submit the course project (which may include a presentation), earning 	proficiency. See [Project Requirements](Final_Project/final_project_requirements.md). 


## Terminology
|Term|Description|
|---|---|
|Course|Refers to all 20 classes which make up the BEWD curriculum|
|Lesson |One 3 hour session of the course. |
|In Class Lab (ICL)|Exercise files that are to be used in class as examples and practice.|
|Code Alongs / Code Demos| Are meant to be code by the instructor to demonstrate a concept. Type slowly and explain the concepts while students follow along.|
|Exercise |ICLs to be completed without instructor guidance.|
|Quick Fire| A programming challenge students must complete in class. aprox 30 min - 1 hour|
|Quiz|3-5 questions based on the material from the previous class.|
|Homework|Exercise files that are to be completed at home and reviewed during class.|
|Resources| Cheat sheet and links to additional information. Each lesson has one.|
|Final Project|The personal project each student will submit and present.|
