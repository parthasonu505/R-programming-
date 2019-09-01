library(caTools)
mtcars$vs <- as.factor(mtcars$vs)
spliting=sample.split(mtcars,SplitRatio = 0.8)
train=subset(mtcars,spliting="TRUE")
test=subset(mtcars,spliting="FALSE")
train_model=glm(vs~wt+disp,data=train,family = "binomial")
summary(train_model)
test_model=predict(train_model,test)
testmodel=ifelse(test_model>0.5,1,0)
testmodel
table(test$vs,testmodel)
error=mean(test$vs!=testmodel)
accuracy=1-error
print(paste("accuracy= ",accuracy))
test$vs

