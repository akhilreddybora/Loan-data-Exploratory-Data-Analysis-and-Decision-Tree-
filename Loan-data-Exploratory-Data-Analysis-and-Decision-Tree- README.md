#Exploratory-Data-Analysis

Exploratory data analysis is an approach to analyse data. It gives some very interesting insights out of data such as:
-Identifying the most important variables
-Understanding the relationship between variables
-Checking for any errors such as missing variables or incorrect entries
-Know the data types of the dataset – whether continuous/discreet/categorical
-Understand how the data is distributed
-Testing a hypothesis or checking assumptions related to a specific model.

## removing missing values from data

Loan_train <- na.omit(Loan_train)
na.action(Loan_train)
View(Loan_train)

## packages to be Installed
install.packages("tidyverse&quot")
install.packages("funModeling&quot")
install.packages('Hmisc&quot")

library(funModeling)
library(tidyverse)
library(Hmisc)

#### decision Tree
##Checking the data

The next step is to look at the data we’re working with. Most of the data we will get, even from the government, can have errors, and it’s important to identify these errors before spending time analyzing the data.
First we will import the data by using the function read.csv() and show the first part of the dataset:

Loan_test <- read_csv("LoanData/Loan_test.csv")
View(Loan_test)
Loan_train<- read_csv("LoanData/Loan_train.csv")
View(Loan_train)

head(Loan_train)

##The first row in the dataset defines the column header. Each of these headers is described in the above table. Now, we will run the summary function to have a quick look on the data:

summary (Loan_train)
 ##By looking at the summary we can conclude that, There are blank fields in Gender, Married, Dependents and Self_Employed.
There are NAs in LoanAmount, Loan_Amount_term and Credit_History.


##STEP-1:- converting categorical data into numeric data
After loading your data in the R Studio the first step is a data mining technique that involves transforming raw data into an understandable format.

Loan_train$Gender<-factor(Loan_train$Gender, levels<-c("Female","Male"),labels<-c(0,1))
Loan_train$Married<-factor(Loan_train$Married, levels<-c("Yes","No"),labels<-c(0,1))
Loan_train$Education<-factor(Loan_train$Education, levels<-c("Graduate","NotGraduate"),labels<-c(0,1))
Loan_train$Self_Employed<-factor(Loan_train$Self_Employed, levels<-c("No","Yes"),labels<-c(0,1))
Loan_train$Property_Area<-factor(Loan_train$Property_Area, levels<-c("Rural","Semiurban","Urban"),labels<-c(0,1,2))
##converting categorical data into numeric data in train dataset.##


Loan_test$Gender<-factor(Loan_test$Gender, levels<-c("Female","Male"),labels<-c(0,1))
Loan_test$Married<-factor(Loan_test$Married, levels<-c("Yes","No"),labels<-c(0,1))
Loan_test$Education<-factor(Loan_test$Education, levels<-c("Graduate","NotGraduate"),labels<-c(0,1))
Loan_test$Self_Employed<-factor(Loan_test$Self_Employed, levels<-c("No","Yes"),labels<-c(0,1))
Loan_test$Property_Area<-factor(Loan_test$Property_Area, levels<-c("Rural","Semiurban","Urban"),labels<-c(0,1,2))
        ##converting categorical data into numeric data in test dataset.

###To convert factors  into numeric values we will use as.numeric function for both test and train data.

Loan_train$Gender<-as.numeric(Loan_train$Gender)
Loan_train$Married<-as.numeric(Loan_train$Married)
Loan_train$Education<-as.numeric(Loan_train$Education)
Loan_train$Self_Employed<-as.numeric(Loan_train$Self_Employed)
## as.numeric function for train data set.

Loan_test$Gender<-as.numeric(Loan_test$Gender)
Loan_test$Married<-as.numeric(Loan_test$Married)
Loan_test$Education<-as.numeric(Loan_test$Education)
Loan_test$Self_Employed<-as.numeric(Loan_test$Self_Employed)
## as.numeric function for test data set.

###STEP-2:- Removing NA values
Loan_train$Gender<-ifelse(is.na(Loan_train$Gender),NA%in% 1,Loan_train$Gender)
Loan_train$Married<-ifelse(is.na(Loan_train$Married),NA%in% 1,Loan_train$Married)
Loan_train$Dependents<-ifelse(is.na(Loan_train$Dependents),NA%in% 1,Loan_train$Dependents)
Loan_train$Education<-ifelse(is.na(Loan_train$Education),NA%in% 1,Loan_train$Education)
Loan_train$Self_Employed<-ifelse(is.na(Loan_train$Self_Employed),NA%in% 1,Loan_train$Self_Employed)
## removing the NA values in train dataset

Loan_test$Gender<-ifelse(is.na(Loan_test$Gender),NA%in% 1,Loan_test$Gender)
Loan_test$Married<-ifelse(is.na(Loan_test$Married),NA%in% 1,Loan_test$Married)
Loan_test$Dependents<-ifelse(is.na(Loan_test$Dependents),NA%in% 1,Loan_test$Dependents)
Loan_test$Education<-ifelse(is.na(Loan_test$Education),NA%in% 1,Loan_test$Education)
Loan_test$Self_Employed<-ifelse(is.na(Loan_test$Self_Employed),NA%in% 1,Loan_test$Self_Employed)
##removing the NA values in test data set.

## decision tree

install.packages(“rpart”)
install.packages(“rpart.plot”)
library(rpart)
library(rpart.plot)


classi<-rpart(formula = Loan_Status~., data = Loan_train)
rpart.plot(classi)

