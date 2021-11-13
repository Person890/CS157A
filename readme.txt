Fall 2021 CS157A 
Introduction to Database Management Systems

Term Project

Instructor: Dr. Kim

Overview

In this project, you will develop a non-trivial database and its application to demonstrate your knowledge in the subjects taught in this course.
The software stack includes MySQL for DBMS, JDBC for the connector, and Java program as a front-end application. recommend you to develop the application incrementally. For example, after constructing a database (or part of the database), you may try a small Java program that takes a user request and see if the program connects to the database through JDBC correctly and retrieves data by executing the expected SQL program. The Java application can be console-based without involving any GUI component. If your team likes to develop a GUI program, you should stick to one type of input interface, either GUI or console, not both. In this project, you are required to submit SQL DDL scripts, which create a database, tables, triggers, and stored procedures, to the database directly at MySQL shell or MySQL workbench, not from the Java program.

I recommend you to develop the application incrementally. For example, after constructing a database (or part of the database), you may try a small Java program that takes a user request and see if the program connects to the database through JDBC correctly and retrieves data by executing the expected SQL program.

Definition of User

A public user: A potential end-user who wants to use your application. E.g., a guest who makes a reservation.
An administrator: An admin of your application. E.g., a hotel manager who wants to find the statistics of room reservations for a holiday season.
DBA: An admin of the database who submits DDL commands to the database and monitors the database's operations. In this project, submit DDL scripts to the database at the MySQL shell.
Minimum Requirements

The system should support at least 15 distinct functions to the users. Here the users means public users and the administrator of the application, not including DBA.
The database involves at least 5 relations and total 15 attributes. There should be relations connect one relation to at least one other relation. The Loan relation in our case study is such an example; Loan connects User and Book.
Relations should be in BCNF or 3NF.
Your system should be able to handle at least 5 significantly different queries involving different relations and attributes. Make sure to have at least one co-related subquery, group by and having, aggregation, outer join, and set operation. At least 3 of them must involve several relations simultaneously.
All schema should come with a key constraint.
Reference integrity constraints are imposed on all possible cases to avoid dangling pointers. Please avoid circular constraints.
Define at least two triggers in the database
In large database systems, it is very common that their data grows over time and an archive function, which copies older entries into an archive database, will be useful. You will follow a simple approach to implement this function. Decide a relation that will be archived. Let's say the table name is t. Supply one additional column called updatedAt to the relation t from which you want to archive. This column's value will be set to the current timestamp whenever a tuple is inserted and modified in the relation t. Create another relation called Archive, which will store archived data. And write a stored procedure that takes a cutoff date as a parameter and copies tuples from t that haven't been modified since the cutoff date into the table Archive and deletes those archived tuples from t.
Here is a sample scenario:

Table t 
                updatedAt
row1:           7/7/2021
row2:           7/25/2021
row3:           7/10/2021
row4:           7/9/2021
...
row9:    
row10:          7/12/2021


your_stored_procedure (parameter value: 7/11/2021 as a cutoff)
{
   Archive rows 1, 3,and 4 of t because they haven't been modified since 7/11/2021.  
}

You may pick a public data set. However, the goal of this project is to assess your ability to construct the database, write queries to manipulate database and to develop its application program. Therefore, synthetic data can be used as long as they can demonstrate all the futures of your database system and its application. If you are using a public data set, 5 points of extra credit will be given.
Project Ideas

Airline reservation, hotel reservation system, tennis court reservation, music band scheduling, product management. Explore your ideas! Avoid library management systems.
Data Sets (You are welcome to use a dataset of your choice depending on the application your team develops.)
Sample data sets for relational database is posted here.
DataSet from CKAN
Deliverable

MAKE SURE TO PRESERVE THE LAST MODIFICATION DATE of each deliverable before the given DUE.
Google Drive Link/Team - Saturday, October 16 11:59 pm by Email
Come up with a team name in one word.
Create a folder titled as your team name in Google Drive. Please share the folder with fall2021cs157a@gmail.com.
Send an email to fall2021cs157a@gmail.com with the following subject line.
 CS157A PROJECT TEAMNAME 
Make sure to use your actual team name in place of TEAMNAME.
The mail content includes
Team members' names and emails
the link to the google folder.
Intermediate Report - Saturday, November 13 11:59 pm your google folder. 
Title the report as TEAMNAME_intermediate_report.pdf. The report should include
Team name
Members name
Project Title
Complete database schema with constraints, also showing the relation(s) to be archived.
At least 15 functional requirements and associated SQL programs (every use case should be presented with corresponding SQL statements.
Stored procedure(s) in a valid SQL syntax
Two Trigger(s) in a valid SQL syntax
Screenshots to show that at least three different user requests can be taken to the the running Java application and then be served successfully.
Final soft copy and report - Saturday, December 4, 11:59 pm to your google folder
Softcopy: project.zip including all Java files, SQL files, and text files containing data.
Final Report: Title the report as TEAMNAME_final_report.pdf. Here is the requirements of the final report.
Peer Evaluaton - Saturday, December 4, 11:59 pm to suneuy.kim@sjsu.edu (not to the grader)
Each member completes this peer evaluation.
Required subject line: CS157A PEER TEAMNAME <-- make sure to put your actual team name.
