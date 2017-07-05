tic;

feature1 = importdata('feature1.txt');
feature2 = importdata('feature2.txt');
[no, class, filenames] = textread('Char_Index.txt', '%d	%d	%s', 1000, 'headerlines', 1);

x = feature1(1:1000, 2:140);

model = svmtrain(class, x, '-c 1 -g 0.07');
save('model.dat', 'model');
model1=load('model.dat', '-mat');
[predict_label, accuracy, dec_values] = svmpredict(class, x, model1.model);

toc;