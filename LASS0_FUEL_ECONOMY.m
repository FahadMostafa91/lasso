%Fuel Economy - Regularized Linear Models
%Instructions are in the task pane to the left. Complete and submit each task one at a time.
%This code loads the data.
load carEcon
whos XTrain XTest econTrain econTest

%Task 1
%Fit ridge model
lambdaR = 0:300;
bR = ridge(econTrain,XTrain,lambdaR,0);

%Task 2
%Calculate and plot MSE. Find smallest MSE.
econPredR = bR(1,:) + XTest*bR(2:end,:);
err = econPredR - econTest;
MSER = mean(err.^2);
[minMSER,idxR] = min(MSER)

plot(lambdaR,MSER)
xlabel("\lambda")
ylabel("MSE")
title("Ridge model")

Task 3
Fit lasso model

lambdaL = (0:300)/length(econTrain);
[bL,fitInfo] = lasso(XTrain,econTrain,"Lambda",lambdaL);

%Task 4
%Calculate and plot MSE. Find smallest MSE.
econPredL = fitInfo.Intercept + XTest*bL;
err = econPredL - econTest;
MSEL = mean(err.^2);
[minMSEL,idxL] = min(MSEL)

plot(lambdaL,MSEL)
xlabel("\lambda")
ylabel("MSE")
title("Lasso model")

%Further Practice
%How many redundant predictors did lasso find? Find the coefficients which minimize MSE by indexing into bL. Coefficients with value zero are redundant, so count the number of zeros.
b = bL(:,idxL)
nnz(b == 0)
