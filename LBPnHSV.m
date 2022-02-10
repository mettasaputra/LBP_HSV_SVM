clear all;
clc;

dataPath = dir('train\');
%change into dataPath = dir('test\');
dataPath = dataPath(3:length(dataPath));
datafilename = {dataPath.name};
TestX = [];


for i = 1:numel(datafilename)
    imageFilePath = strcat('train\', datafilename{i});
    %change into imageFilePath = strcat('test\', datafilename{i}); for data test

    %Resizing images into 300 x 300px
    I = imread(imageFilePath);
    imageFile = imresize(I, [300,300]);

    %LBP Feature Extraction
    grayImage = rgb2gray(imageFile);
    lbpFeatures = extractLBPFeatures(grayImage,'Normalization','None');

    %Feature Vector LBP is 1 x 59, where the Neighbor = 8, cellSize = w x h of image
    numNeighbors = 8;
    numBins = numNeighbors*(numNeighbors-1)+3;
    lbpCellHists = reshape(lbpFeatures,numBins,[]);
    lbpCellHists = bsxfun(@rdivide,lbpCellHists,sum(lbpCellHists));
    lbpFeatures = reshape(lbpCellHists,1,[]);

    %HSV Feature Extraction
    hsv = rgb2hsv(imageFile);
    h = hsv(:,:,1);
    s = hsv (:,:,2);
    v = hsv(:,:,3);

    %Get HSV Value from mean of mean, modus of modus, std of std
    mean_h = mean(mean(h));
    modus_h = mode(mode(h));
    std_h = std(std(h));
    mean_s = mean(mean(s));
    modus_s = mode(mode(s));
    std_s = std(std(s));
    mean_v = mean(mean(v));
    modus_v = mode(mode(v));
    std_v = std(std(v));
    
    %Model
    imageFeatures = [lbpFeatures, mean_h, mean_s, mean_v, modus_h,modus_s,modus_v, std_h,std_s,std_v];
    TestX = [TestX; imageFeatures];
    [filepath,name,ext] = fileparts(datafilename{i});
    category = regexp(name,'[A-Z]','Match');
    labelY = join(category, "");
    TestY{i,1} = labelY{1};

end

save('data_uji.mat','TestX','TestY');