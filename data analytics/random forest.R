library(caTools)
library(randomForest)
set.seed(123)
mtcars$vs=as.factor(mtcars$vs)
spliting=sample.split(mtcars,SplitRatio = 0.8)
train_data=subset(mtcars,spliting="TRUE")
testing_data=subset(mtcars,spliting="FALSE")
train_model=randomForest(vs~.,ntree=100,data = train_data)
print(train_model)
predictd_data=predict(train_model,newdata= testing_data)
table(actualvalue=testing_data$vs, predicteddata=predictd_data)

##########################################################################################
data(mtcars)
mtcars$vs <- as.factor(mtcars$vs)


# Step 1:Split data in train and test data
library(caTools)
set.seed(123) 

split <- sample.split(mtcars, SplitRatio = 0.8)
split


train <- subset(mtcars, split== "TRUE")
test <- subset(mtcars, split== "FALSE")
train
test
library(randomForest)

set.seed(415)
model_rf <- randomForest(vs ~ ., data=train, ntree=100, importance = TRUE)
print(model_rf)


# Step 3:Predict test data based on trained model - model_ctree
fitted.value <- predict(model_rf, newdata = test)
fitted.value


# Step 4: Change probabilities to class (0 or 1/Yes or No)- Not Required

# Step 5: Evauate Model Accuracy using Confusion matrix
table(ActualValue =test$vs, PredictedValue = fitted.value)

