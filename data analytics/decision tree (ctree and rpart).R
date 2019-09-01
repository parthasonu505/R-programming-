library(party)
data(mtcars)
mtcars$vs=as.factor(mtcars$vs)
set.seed(123)
spliting=sample.split(mtcars,SplitRatio = 0.8)
train=subset(mtcars,spliting="TRUE")
test=subset(mtcars,spliting="FALSE")
train_model=ctree(vs~ .,data=train)
plot(train_model)
test_model=predict(train_model,test)
table(test$vs, test_model)
error=mean(mtcars$vs != test_model)
accuracy=1-error
accuracy
table(mtcars$vs, test_model)
####################################################################
library(rpart.plot)
data(mtcars)
mtcars$vs=as.factor(mtcars$vs)
set.seed(123)
spliting=sample.split(mtcars,SplitRatio = 0.8)
train=subset(mtcars,spliting="TRUE")
test=subset(mtcars,spliting="FALSE")
train_model=rpart(vs~ .,data=train)
rpart.plot(train_model)
test_model=predict(train_model,test,type = "class")
table(test$vs,test_model)
error=mean(mtcars$vs != test_model)
accuracy=1-error
accuracy

