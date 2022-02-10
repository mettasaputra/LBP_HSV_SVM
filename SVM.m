load('Model/data_train.mat');
load('Model/data_test.mat');

TrainingSet = TrainX;
TestSet = TestX;
GroupTrain = TrainY;
GroupTest = TestY;

%t = templateSVM('KernelFunction','linear');
t = templateSVM('KernelFunction','gaussian','KernelScale',0.07);
%t = templateSVM('KernelFunction','polynomial');
train = fitcecoc(TrainingSet,GroupTrain, 'Learners', t);
klasifikasi = predict(train, TestSet);

confusionchart(GroupTest', klasifikasi')
