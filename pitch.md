Developing Data Products Project
========================================================
author: Jose Bergiste
date: November 2015

Shiny Cars App
========================================================

I created the Shiny Cars App using R Studio and Shiny. The application can be seen at https://bergiste.shinyapps.io/shiny-cars-app

The application predicts a user's car MPG (Miles Per Gallon) based on the following factors:

- The weight of the car (wt)
- The transmission of the car (am)
- The 1/4 mile time of the car (qsec)

Using The App
========================================================
Using the app is very simple:

## On the Left Side:
1. Enter the car's weight (in 1000 lbs increments) 
2. Slide the slider to pick the car's 1/4 mile time
3. Use the radio button to select if the car is automatic or manual

## On the Right Side:

You will see the estimated MPG of the car along with a pretty picture of a bunch of cars


Data Used
========================================================
Here is a sample of the mtcars data-set used to make the prediction:

```
                   mpg cyl disp  hp drat    wt  qsec vs am gear carb
Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1
```

Prediction
========================================================
A multivariable linear regression model was used to predict the car's MPG. The 3 features (wt, qsec, and am) were selected based being the most predictive for determining MPG

*Here is the code for the prediction below:*

```r
library(caret)
model <- train(mpg ~ wt + qsec + am, method='lm', data = mtcars)
```
