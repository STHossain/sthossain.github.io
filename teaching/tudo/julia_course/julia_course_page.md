---
layout: page
title: Programming with Julia
description: Julia Programming Course at TU Dortmund, Fall 2021
giscus_comments: false
display_categories: [work, fun]
horizontal: false
toc:
  sidebar: left
---
<!-- {% if page.subtitle %}{{ page.subtitle }}{% endif %} -->

<img src="../JuliaLogo.svg" width="400" height="200" > 



## 1. Course Schedule
1. **Instructor**: Shaikh Tanvir Hossain
2. **Course Dates**: The course is divided into two weeks (a total of 5 days from 8.30 to 5.00, including lunch breaks):
   - **Week 1**: 23rd and 24th of March
   - **Week 2**: 29th to 31st of March

3. **Exercise Schedule**: All exercises will be given in the second week.

4. **Final Evaluation**: To get points, you need to solve the exercises. The final evaluation will be an interview quiz (short question-answer session via Zoom). More details will be posted here gradually. For now, please install Julia, VSCode, and Jupyter Notebook.

---

## 2. Some details

**About Jupyter Notebooks**

  I already uploaded a video in Moodle. In the first video, I mentioned that you only need to install VSCode as an IDE, but actually, we also need Jupyter Notebook. In particular, you will need Jupyter Notebooks to solve the problem sets. The submissions must be done using Jupyter Notebooks, so please install it. Visit the [Jupyter Notebook site](https://jupyter.org/install) and install it. If you face any issues, consider installing Anaconda. Once you have installed Jupyter Notebook, you need to install the IJulia package inside a Julia kernel.

**Rough Guideline for the 5 Days**

All clock times given are in local time in Germany.

- **23rd of March**: 
  - Live Zoom session from 8:30 AM to 12:00 PM (with short breaks).
  - Solve some practice exercises (not graded) on your own.
  - Discuss solutions and answer questions in another live Zoom session from 5:00 PM to 6:00 PM.

- **24th of March**: 
  - Same as Day 1.

  *The exercises for these two days are for practice only and won't be graded. I'll discuss the solutions, and you should correct your mistakes. Feel free to ask questions during the Q&A sessions from 5:00 PM to 6:00 PM.*

- **29th of March**: 
  - Live Zoom session from 8:30 AM to 12:00 PM (with short breaks).
  - Solve graded exercises and submit via Moodle within 2-3 hours of being posted.
  - Discuss solutions in a live Zoom session from 5:00 PM to 6:00 PM.

- **30th of March**: 
  - Same as Day 3.
  - Another graded exercise sheet will be given; submit via Moodle.
  - Discuss solutions in a live Zoom session from 5:00 PM to 6:00 PM.

- **31st of March**: 
  - Before the afternoon, same as the last two days.
  - A graded exercise sheet will be given, and you need to submit via Moodle.
  - A short quiz will be held from 4:00 PM to 6:00 PM via Zoom.

**About Recording**

  All Zoom sessions will be recorded. Depending on how Moodle handles uploads, recordings will be available within a day. However, I cannot promise exact timing; this is your risk!

**Participation**

  Participation in the Zoom sessions (except for the quiz) is voluntary. You can watch all lectures and discussions after they are posted on Moodle. However, it might take time to process and upload the video. I will try to upload the recordings by the next day, but I cannot guarantee this. Attending the Zoom sessions is the safest option.

**Evaluation**

  Submission of all three graded exercise sheets is mandatory to pass the course. You only need to score at least 40% on each exercise sheet to pass. The exercise sheets must be submitted within 2-3 hours of being posted on Moodle. Additionally, you must be present for the live quiz session via Zoom on 31st March from 4:00 PM to 6:00 PM to pass the course.

  The final exam consists of the following two components:

  1. **Passing the Exercise Sheets**: Scoring 40% on each exercise sheet.
  2. **Passing the Quiz**: Performance in the quiz will impact your grade.

  Final grades will be available a few days after the quiz. Due to the large number of students, we will discuss solutions so that you can self-evaluate. Submit your solutions and attend the quiz as this constitutes your final exam.

  If you fail one exercise sheet, even if you attend the quiz, you will fail the course.

**Quiz Details**

The quiz is not like an oral exam. Thanks to one of my professors for the idea.

- You must be present in the live Zoom session on 31st March from 4:00 PM to 6:00 PM.
- Some students will be randomly selected during the session (using a randomization process in Julia) to answer quiz questions with their cameras on. Others will observe. The answers will be heard by everyone in the Zoom session.
- Participation in this session is mandatory. If you are absent, you will automatically fail.
- If selected, your quiz performance will affect your grade. If you fail to answer all questions, it will negatively impact your grade. If you are present but face no questions, you will not lose any points.

**Students Who Want to Learn**

If you are not interested in earning ECTS but just want to learn Julia, you are welcome to join the Moodle page. I am happy to share the course materials.

**Official Registration**

You are officially registered once you submit the first graded exercise sheet. After that, you must submit the other two exercise sheets on time and attend the live Zoom quiz session to pass the course. Before submitting the first assignment, consider the consequences. If you do not submit the first assignment, you can still learn from the course materials and stay in the Moodle for learning Julia. However, if you submit the first assignment but fail to submit the next one, you will fail the course.

**Final Words**

Thank you for your interest in the Julia course. I hope we will learn many things together. I apologize if the evaluation sounds tough, but I promise that you will be able to answer all quiz questions if you work through the exercises, think, and learn Julia. The quiz will be based on your intuitive understanding, not on whether you can write code during the session. The questions will be such that you can answer them in one or two lines. Thanks a lot,**Tanvir**.


---

## 3. Some Resources to start

- [Tutoroal to Basic Syntax](https://www.youtube.com/watch?v=8h8rQyEpiZA&t=181s): This is an introduction to the Basic Syntax in Julia. Please install Jupyter Notebook and go along with it. All notebooks are available in a github repo 

- [Manual for 1.5.3 version](../julia-1.5.3.pdf): Julia is being updated currently from 1.5.3 to 1.5.4., so you might not find the manual for the 1.5.4 yet! But soon there should be manual on the Julia Documentation page. Here is the older one for 1.5.3 (please download the Julia 1.5.3 manual, we will be using this!)

- [A playlist for basic syntax](https://www.youtube.com/playlist?list=PLP8iPy9hna6SCcFv3FvY_qjAmtTsNYHQE): This uses an older version of the Julia. The one in the above is relatively newer. But this playlist also has an instruction how to use Jupyter notebooks.

- [Github Repo from the Julia Academy](https://github.com/JuliaAcademy/JuliaTutorials/tree/main/introductory-tutorials/intro-to-julia).

- [Different Courses from Julia Academy](https://github.com/JuliaAcademy): Julia Academy provides different courses and here you will find all resources that are used in the video lectures.

- [**Why Julia is fast (By Steven Johnson, MIT)**](https://www.youtube.com/watch?v=6JcMuFgnA6U&t=211s): Excellent presentation, watch it if you can. This also explains the issue of two language problem, and why Julia is a solution for that.

- [Engineering Julia for Speed (Lionel Zoubritzky, Ecole Normale Supérieure de Paris) (https://www.youtube.com/watch?v=XWIZ_dCO6X8&list=PLP8iPy9hna6Qsq5_-zrg0NTwqDSDYtfQB&index=48): A little bit of theoretical presentation why Julia is fast. This presentation is actually a presentation of a paper, titled - Julia: Dynamism and Performance Reconciled by Design, it is freely available.

- [Think Julia](https://moodle.tu-dortmund.de/mod/url/view.php?id=818142): This is free online book, you can have a look if you want!

- [Julia Programming for Nervous Beginners](https://www.youtube.com/playlist?list=PLP8iPy9hna6Qpx0MgGyElJ5qFlaIXYf1R) If you are struggling with for loops, if else conditions, and the basic programming techniques, then this might be helpful. This is also a big series of lectures, so you can watch selectively. For example just look for the foor-loops part, or while loops part and so on.

- **Programming in General**
  - [Programming Notes by Professor Chua Hock Chuan ay NTU](https://www3.ntu.edu.sg/home/ehchua/programming/index.html). This is a very good collection of notes for different programming languages.


- [CS50 lectures](https://www.youtube.com/watch?v=YoXxevp1WRQ&list=PLhQjrBD2T382_R182iC2gNZI9HzWFMC_8): Here are some resources, which helped me a lot to learn. So I though to share. This is not directly relevant for the course. So strictly speaking this is completely optional. Maybe you can keep this for later uses if you want to dig deep. If you have absolutely no idea about programming and start like a computer scientist, this is probably the best course to start. Its is called CS50. This is a course from Harvard. It teaches programming with C. This is the latest playlist for the course.

---

## 4. What I have used to prepare the lectures.

- Lectures from David Sanders at Julia, so far I used (Youtube links are simple texts, not a hyperlink, you need to copy and paste in your browser)
JuliaCon 2020 | Learn Julia via Epidemic Modeling, [https://www.youtube.com/watch?v=k0fr7XjH1_Y](https://www.youtube.com/watch?v=k0fr7XjH1_Y)

- JuliaCon2016 Intermediate Level Julia (Workshop), here is the link [https://www.youtube.com/watch?v=rAxzR7lMGDM&t=4443s](https://www.youtube.com/watch?v=rAxzR7lMGDM&t=4443s)


- Lectures from Chris Rackauckas, Parallel Computing and Scientific Machine Learning (this is truly amazing!) link [https://mitmath.github.io/18337/](https://mitmath.github.io/18337/). He has also different JuliaCon talks

- Introduction to Computational Thinking, MIT  (this is full of awesomeness) [https://computationalthinking.mit.edu/Spring21/](https://computationalthinking.mit.edu/Spring21/)

- Tileman's old notes (I asked Tileman whether I could share his notes with you guys, he said no problem if I share, so I will try to share them, so thanks to Tileman)

- I might borrow some materials from Dr. Carsten Bauer, here you can find all lecture notes, [https://github.com/crstnbr/JuliaNRW21](https://github.com/crstnbr/JuliaNRW21)

- QuantEcon page (this is full with different Macroeconomic applications) [https://julia.quantecon.org/index_toc.html]([https://julia.quantecon.org/index_toc.html)

- PoisotLab, here is the page [https://www.youtube.com/channel/UCyrcy8sLh7APlVylHN9fWNg](https://www.youtube.com/channel/UCyrcy8sLh7APlVylHN9fWNg). Not so much, but of course some. This is more toward Biological modeling

- Of course Julia Documentation.

- and some books,  

  - Sengupta, A., & Edelman, A. (2019). Julia High Performance: Optimizations, distributed computing, multithreading, and GPU programming with Julia 1.0 and beyond, 2nd Edition (2nd edition). Packt Publishing.

  - Kwong, T., & Karpinski, S. (2020). Hands-On Design Patterns and Best Practices with Julia: Proven solutions to common problems in software design for Julia 1.x. Packt Publishing.

- This is all I could remember at this moment. If I missed anything, that is definitely not intentional. If you watch them all, learn from them directly than there is a very high possibility that you will understand more than me. So feel free to dig in. My goal is that you learn Julia, whether from me or someone else does not matter. And in full honesty the lectures from Chris and David Sanders are definitely better than me. But honestly now there are too much fascinating stuffs to learn and we have a very little time. So I  will try to go through, what I think is most essential, and then in future you can definitely try to dig deep.

---

## 5. Notes and codes for the class (with html files, jl files, and zipped folders)

### Day 1
  - Part 1: Introduction, [html file](../day1/part_1_introduction/01_introduction/01.introduction.html), [zipped folder](../day1/part_1_introduction/01_introduction.zip)
  
  - Part 2: Basic Syntax, [html file](../day1/part_2_basic_syntax/02_basic_syntax/02.julia_basics.html), [zipped folder](../day1/part_2_basic_syntax/02_basic_syntax.zip)

  - Part 3: Generic Programming, [html file](../day1/part_3_generic_programming/03_generic_programming/03.generic_programming.html), [zipped folder](../day1/part_3_generic_programming/03_generic_programming.zip)

### Day 2
  - Part 4: Type Inference and Type Stability, [html file](../day2/part_4_type_inference_type_stability/04_type_inference_stability/04.type_inference_stability.html), [zipped folder](../day2/part_4_type_inference_type_stability/04_type_inference_stability.zip)

  - Part 5: Multiple Dispatch, [html file](../day2/part_5_multiple_dispatch/05_multiple_dispatch/multiple_dispatch.html), [zipped folder](../day2/part_5_multiple_dispatch/05_multiple_dispatch.zip)

  - Part 6: Type Construction, [html file](../day2/part_6_type_construction/06_type_construction/type_constructions.html), [zipped folder](../day2/part_6_type_construction/06_type_construction.zip)

### Day 3
  - Part 7: Again Types, [html file](../day3/part_7_types/07_types.html), [zipped folder](../day3/part_7_types/07_types.zip)

### Day 4
  - Part 8: Arrays, [html file 1](../day4/part_6_arrays/06_arrays/arrays1.html), [html file 2](../day4/part_6_arrays/06_arrays/arrays2.html), [zipped folder](../day4/part_6_arrays/06_arrays.zip)

### Day 5
  - Part 9: Metaprogramming, [html file](../day5/part_7_metaprogramming/07_metaprogramming.html)


---

## 6. Practice Problems (with html files, jl files, and zipped folders)

  - Practice Problem 1, [html file](../practice_problems/practice_problems/PracticeProblem.html), [jl file](../practice_problems/practice_problems/PracticeProblem.jl), [zipped folder](../practice_problems/practice_problems.zip)

---

## 7. Graded Assignments (with html files, jl files, and zipped folders)

### Problem Set 1
- Exercise 1: [html file](../graded_assignments/ps1/Exercise1.html), [jl file](../graded_assignments/ps1/dartboard.jl)

### Problem Set 2
- Exercise 2: [html file](../graded_assignments/ps2/Exercise2.html)