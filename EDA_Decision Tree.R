install.packages("tidyverse")
install.packages("funModeling")
install.packages("Hmisc")

library(funModeling) 
library(tidyverse) 
library(Hmisc)


basic_eda <- function(clean_loan)
{
  glimpse(clean_loan)
  df_status(clean_loan)
  freq(clean_loan) 
  profiling_num(clean_loan)
  plot_num(clean_loan)
  
  describe(clean_loan)
}

basic_eda(clean_loan)



Loan_train$Loan_ID<-NULL
Loan_test$Loan_ID<-NULL
Loan_test$X13<-NULL

Loan_train$ApplicantIncome<-NULL
Loan_train$CoapplicantIncome<-NULL
Loan_test$ApplicantIncome<-NULL
Loan_test$CoapplicantIncome<-NULL
Loan_train$Gender<-factor(Loan_train$Gender, levels<-c("Female","Male"),labels<-c(0,1))
Loan_train$Married<-factor(Loan_train$Married, levels<-c("Yes","No"),labels<-c(0,1))
Loan_train$Education<-factor(Loan_train$Education, levels<-c("Graduate","NotGraduate"),labels<-c(0,1))
Loan_train$Self_Employed<-factor(Loan_train$Self_Employed, levels<-c("No","Yes"),labels<-c(0,1))
Loan_train$Property_Area<-factor(Loan_train$Property_Area, levels<-c("Rural","Semiurban","Urban"),labels<-c(0,1,2))
Loan_train$Dependents<-factor(Loan_train$Dependents, levels<-c("0","1","2","3+"),labels<-c(0,1,2,3))
Loan_train$Credit_History<-factor(Loan_train$Credit_History, levels<-c("0","1"),labels<-c(0,1))
Loan_train$Loan_Status<-factor(Loan_train$Credit_History, levels<-c("0","1"),labels<-c(0,1))
Loan_test$Gender<-factor(Loan_test$Gender, levels<-c("Female","Male"),labels<-c(0,1))
Loan_test$Married<-factor(Loan_test$Married, levels<-c("Yes","No"),labels<-c(0,1))
Loan_test$Education<-factor(Loan_test$Education, levels<-c("Graduate","NotGraduate"),labels<-c(0,1))
Loan_test$Self_Employed<-factor(Loan_test$Self_Employed, levels<-c("No","Yes"),labels<-c(0,1))
Loan_test$Property_Area<-factor(Loan_test$Property_Area, levels<-c("Rural","Semiurban","Urban"),labels<-c(0,1,2))
Loan_test$Dependents<-factor(Loan_test$Dependents, levels<-c("0","1","2","3+"),labels<-c(0,1,2,3))
Loan_test$Credit_History<-factor(Loan_test$Credit_History, levels<-c("0","1"),labels<-c(0,1))
Loan_train$Gender<-as.numeric(Loan_train$Gender)
Loan_train$Married<-as.numeric(Loan_train$Married)
Loan_train$Education<-as.numeric(Loan_train$Education)
Loan_train$Self_Employed<-as.numeric(Loan_train$Self_Employed)
Loan_train$Property_Area<-as.numeric(Loan_train$Property_Area)
Loan_train$Dependents<-as.numeric(Loan_train$Dependents)
Loan_train$Credit_History<-as.numeric(Loan_train$Credit_History)
Loan_train$Loan_Status<-as.numeric(Loan_train$Loan_Status)
Loan_test$Gender<-as.numeric(Loan_test$Gender)
Loan_test$Married<-as.numeric(Loan_test$Married)
Loan_test$Education<-as.numeric(Loan_test$Education)
Loan_test$Self_Employed<-as.numeric(Loan_test$Self_Employed)
Loan_test$Property_Area<-as.numeric(Loan_test$Property_Area)
Loan_test$Dependents<-as.numeric(Loan_test$Dependents)
Loan_test$Credit_History<-as.numeric(Loan_test$Credit_History)

Loan_train$LoanAmount<-ifelse(is.na(Loan_train$LoanAmount),
                              ave(Loan_train$LoanAmount,FUN = function(x)mean(x,na.rm=TRUE)),Loan_train$LoanAmount)

Loan_train$Loan_Amount_Term<-ifelse(is.na(Loan_train$Loan_Amount_Term),
                                    ave(Loan_train$Loan_Amount_Term,FUN = function(x)mean(x,na.rm=TRUE)),Loan_train$Loan_Amount_Term)
Loan_test$LoanAmount<-ifelse(is.na(Loan_test$LoanAmount),
                              ave(Loan_test$LoanAmount,FUN = function(x)mean(x,na.rm=TRUE)),Loan_test$LoanAmount)
                              
Loan_test$Loan_Amount_Term<-ifelse(is.na(Loan_test$Loan_Amount_Term),
                              ave(Loan_test$Loan_Amount_Term,FUN = function(x)mean(x,na.rm=TRUE)),Loan_test$Loan_Amount_Term)
Loan_train$Gender<-ifelse(is.na(Loan_train$Gender),NA%in% 1,Loan_train$Gender)
Loan_train$Married<-ifelse(is.na(Loan_train$Married),NA%in% 1,Loan_train$Married)
Loan_train$Dependents<-ifelse(is.na(Loan_train$Dependents),NA%in% 1,Loan_train$Dependents)
Loan_train$Education<-ifelse(is.na(Loan_train$Education),NA%in% 1,Loan_train$Education)
Loan_train$Self_Employed<-ifelse(is.na(Loan_train$Self_Employed),NA%in% 1,Loan_train$Self_Employed)
Loan_train$Credit_History<-ifelse(is.na(Loan_train$Credit_History),NA%in% 1,Loan_train$Credit_History)
Loan_train$Property_Area<-ifelse(is.na(Loan_train$Property_Area),NA%in% 1,Loan_train$Property_Area)
Loan_train$Loan_Status<-ifelse(is.na(Loan_train$Loan_Status),NA%in% 1,Loan_train$Loan_Status)
Loan_test$Gender<-ifelse(is.na(Loan_test$Gender),NA%in% 1,Loan_test$Gender)
Loan_test$Married<-ifelse(is.na(Loan_test$Married),NA%in% 1,Loan_test$Married)
Loan_test$Dependents<-ifelse(is.na(Loan_test$Dependents),NA%in% 1,Loan_test$Dependents)
Loan_test$Education<-ifelse(is.na(Loan_test$Education),NA%in% 1,Loan_test$Education)
Loan_test$Self_Employed<-ifelse(is.na(Loan_test$Self_Employed),NA%in% 1,Loan_test$Self_Employed)
Loan_test$Credit_History<-ifelse(is.na(Loan_test$Credit_History),NA%in% 1,Loan_test$Credit_History)
Loan_test$Property_Area<-ifelse(is.na(Loan_test$Property_Area),NA%in% 1,Loan_test$Property_Area)

library(rpart)
library(rpart.plot)
classi<-rpart(formula = Loan_Status~., data = Loan_train)
rpart.plot(classi)
y_pred<-predict(classi, newdata = Loan_test, type = "matrix")
y_pred
Loanyandn<-ifelse(y_pred >1,"Y","N")
Loanyandn
rpart.plot(Loanyandn)
Logresult<-cbind( Loanyandn)
Logresult
write.csv(Logresult,file = "FinalTree.csv")
summary(classi)
summary(y_pred)
table(actualvalue=Loan_test$Loanyandn,predictvevalue=y_pred>0.5)
