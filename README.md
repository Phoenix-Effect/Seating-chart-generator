# Exam seating chart generator
**By Suhail Ghafoor**

The program generates a simple exam seating chart with a given criteria. The program can take input and give results in various formats. To get get started within the program or get full list of commands type the following commands.

```prolog
 commands.
 help. ```


### Commands list
* Normal seating (starts from beginning of the list)
  * **normal** ( NUMBER , Result): Where NUMBER will be replaced by the number of students and Result will be output on screen.
  * **wnormal** ( NUMBER ): Where NUMBER will be replaced by the number of students and the result would be output to a file. *(Default: output.txt)*
  * **listcheckn** ( LIST1 , LIST2): Where LIST1 is a list of names of students and LIST2 is a list of seats.
* Reverse seating (starts from the end of list, keyword reverse is reserved in GProlog)
  * **reversez** ( NUMBER , Result): Where NUMBER will be replaced by the number of students and Result will be output on screen.
  * **wnreversez** ( NUMBER ): Where NUMBER will be replaced by the number of students and the result would be output to a file. *(Default: output.txt)*
  * **listcheckr** (List of student names, List of seat numbers) - Enter a list of students and list of seats to get full output on screen.').

### HTML file
  * To change the number of seats or the layout of the seats open the .html in any text editor and move the DOM elements around. It is self explanatory once you see the structure of the file.
  * If you want to change the functionality of the buttons or the color of filled seats edit **seatgen.js**. For changing color of filled seats simply change the value of  *seat.style.backgroundColor* in line 3.
  * To change the size of seats or the visual gap between the seats edit **style.css** and edit the **.seat** class. It also has a self explanatory structure, all of the design css that is not required for seats was loaded from a separate file which makes editing this file much easier.

### Note
Open index.html in Firefox only! Chrome and Safari DO NOT SUPPORT cross origin requests for local files in javascript. This means that they do not have the rights to access local files, this means you have to click load file and select the output file however this functionality is disabled since it added another step.
