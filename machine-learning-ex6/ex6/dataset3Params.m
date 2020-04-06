function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
% we need test data and dtran data so we will get test data from cdict because it is out data set same for sig 
%
  C_dict= [0.01,0.03,0.1,0.3,1,3,10,30]
  Sig_dict=[0.01,0.03,0.1,0.3,1,3,10,30]
  Pre_erro = zeros(length(C_dict), length(Sig_dict));
  mean_erro = zeros(length(C_dict)+length(Sig_dict),3);
  row =1;
  
  for i = 1:length(C_dict)
    for j =1:length(Sig_dict)
      C_t = C_dict(i);
      S_t = Sig_dict(j);
      %now need to build model for this we need train data and a classifer where the calssifter will validate that is called cross validationit can be done by gaussion right? yeah how to model it now?    
      model = svmTrain(X, y, C_t, @(x1,x2) gaussianKernel(x1, x2, S_t));
     %errorRow = errorRow +1;
      predictions = svmPredict(model, Xval);
      predictions_error(i,j) = mean(double(predictions ~= yval));
      mean_erro(row,:)=[predictions_error(i,j), C_t, S_t];
      row = row+1;
    end
  end
  sort_mean_erro = sortrows(mean_erro, 1);
  C = sort_mean_erro(1,2);
  sigma = sort_mean_erro(1,3);  



% =========================================================================

end
