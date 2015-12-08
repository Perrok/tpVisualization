%% setting parameters

% add rastamat library
addpath('rastamat')

% Path to the sound dataset
datasetPath = '/tmp/environmentalSounds';

% name of feature
featureName = 'mfcc';


%% load dataset, compute features and ground truth

clear features groundTruth names class
fileNames = dir([datasetPath '/*wav']);
nbElements = length(fileNames);
for k=1:nbElements
    
    [s, fs] = wavread([datasetPath '/' fileNames(k).name]);
    s=s/max(abs(s));
    
    switch featureName
        case 'zcr'
            
        case 'sf'
        
        case 'tpr'

        otherwise
            error(['Unknown feature: ' featureName]);     
    end
    names{k} = fileNames(k).name;
    class{k} = fileNames(k).name(1:3);
    groundTruth(k) = ceil(k/2); 
end

%% 1-NN classification

% display accuracy

accuracy = groundTruth==predictions;
disp(['Accuracy: ' num2str(mean(accuracy))]);

% display confusion matrix
imagesc(confusionmat(groundTruth, predictions));
colormap('bone');
set(gca, 'xticklabel', class(1:2:end));
set(gca, 'yticklabel', class(1:2:end));

%% mental organization
napping(datasetPath)

%% visualisation

napping(datasetPath, 'acoustic', pcaLocations)

%% correlation
