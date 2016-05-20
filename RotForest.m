
function RotForest(filename)

% compute the classification results of Rotation Forest (part(0.75*train_N)
% and full training data using 3-fold cross validation and this is repeated 10 times.

tic
randn('state',0);
rand('state',0);


load SalinasA.mat;
N=size(salinasA,1);
data=salinasA;
M=2;
L = 4; % number of classes


R = 10; % number of replications
T = 100; % number of iterations
S = 3; % number of folds
numTrain=100;

[Part,Full] = Rotation1(data,L,T,R,S,M,numTrain);

fid = fopen(SalinasA,'a+');
fprintf(fid,'\n\n******* Classifications for Rotation forest (full) for "Satimage" data set (100 iterations) (M = 3) when noisy level = 20%%. ***********\n');
fprintf(fid,'\n Full_Results = \n');
for i = 1:N-numTrain*L
    fprintf(fid,'\n\t%.0f',Full(i,1)); 
    for j = 2:R
        fprintf(fid,'\t\t%.0f',Full(i,j));  
    end
end

fprintf(fid,'\n\n******* Classifications for Rotation forest (part(0.75)) for "Satimage" data set (100 iterations) (M = 3) when noisy level = 20%%. ***********\n');
fprintf(fid,'\n Part_Results = \n');
for i = 1:N-numTrain*L
    fprintf(fid,'\n\t%.0f',Part(i,1)); 
    for j = 2:R
        fprintf(fid,'\t\t%.0f',Part(i,j));  
    end
end
fclose(fid);
toc

%--------------------------------------------------------------------------
