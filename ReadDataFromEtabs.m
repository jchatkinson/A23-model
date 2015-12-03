% Clean Start
%
% close all; clc; clear all;
function [Data] = ReadDataFromEtabs(BuildingType,AnalysisType,WallSections)
% BuildingType = '45x45';
% AnalysisType = 'Grav';
% WallSections = 'WallTotal';
% WallPier = 'WallTotal';



if strmatch(WallSections,'Piers')
    piers = {'W1','W2','W3'};%'WallTotal'
elseif strmatch(WallSections,'WallTotal')
    piers = {'WallTotal'};
else
    piers = {'W1F1','W1F2','W1W','W2F1','W2F2','W2W','W3F1','W3F2','W3W'};
end

CBtags = {'CB-NW','CB-SW','CB-NE','CB-SE'};
CBtagsFields = {'CBNW','CBSW','CBNE','CBSE'};

DriftTags = {'Max Drift X','Max Drift Y'};


% Story data
[StoryLabels,~,Elevations,~,~,~] = textread('StoryInformation.txt','%s%f%f%s%s%s');
% Elevations
if strmatch(BuildingType,'72x72')
    Elvs = num2cell(mergeVectors(Elevations(1:end-4),Elevations(2:end-3)));
else
    Elvs = num2cell(mergeVectors(Elevations(1:end-1),Elevations(2:end)));
end

ModelName = [BuildingType '-' AnalysisType '-' WallSections '.xlsx'];

[~,~,SpandrelTabel]= xlsread(ModelName,'Spandrel Forces');
[~,~,PierTable] = xlsread(ModelName,'Pier Forces');
[~,~,DriftsTable] = xlsread(ModelName,'Story Drifts');
[~,~,DispTable] = xlsread(ModelName,'Story Max Avg Displacements');

if strmatch(AnalysisType,'RSA')
    combos={'RSAx' 'RSAx-nT' 'RSAx-pT' 'RSAy' 'RSAy-nT' 'RSAy-pT' };
    combosFields={'RSAx' 'RSAxnT' 'RSAxpT' 'RSAy' 'RSAynT' 'RSAypT' };
    % Wall Forces
    PierStoryLabels = PierTable(4:end,1);
    PierName = PierTable(4:end,2);
    PierLoadCombo = PierTable(4:end,3);
    PierForces = PierTable(4:end,7:12);
    
    % Coupling beam story
    SpandrelStoryLabels = SpandrelTabel(4:end,1);
    SpandrelName = SpandrelTabel(4:end,2);
    SpandrelLoadCombo = SpandrelTabel(4:end,3);
    SpandrelForces = SpandrelTabel(4:end,8);
    SpandrelSide = SpandrelTabel(4:end,6);
    
    % Story drifts
    DriftsStoryLabels = DriftsTable(4:end,1);
    DriftsLoadCombo = DriftsTable(4:end,2);
    DriftsDir = DriftsTable(4:end,6);
    DriftsStoryDrifts = DriftsTable(4:end,7);
    
    % Story disps
    DispStoryLabels = DispTable(4:end,1);
    DispLoadCombo = DispTable(4:end,2);
    DispStory = DispTable(4:end,6:7);
    DispsDir = DispTable(4:end,5);
    
elseif strmatch(AnalysisType,'Grav')
    combos={'Dead' 'Live'};
    combosFields={'Dead' 'Live'};
    PierStoryLabels = PierTable(4:end,1);
    PierName = PierTable(4:end,2);
    PierLoadCombo = PierTable(4:end,3);
    PierForces = PierTable(4:end,5:10);
    
    % Coupling beam story
    SpandrelStoryLabels = SpandrelTabel(4:end,1);
    SpandrelName = SpandrelTabel(4:end,2);
    SpandrelLoadCombo = SpandrelTabel(4:end,3);
    SpandrelForces = SpandrelTabel(4:end,6);
    SpandrelSide = SpandrelTabel(4:end,4);
    
    % Story drifts
    DriftsStoryLabels = DriftsTable(4:end,1);
    DriftsLoadCombo = DriftsTable(4:end,2);
    DriftsDir = DriftsTable(4:end,4);
    DriftsStoryDrifts = DriftsTable(4:end,5);
    
    % Story disps
    DispStoryLabels = DispTable(4:end,1);
    DispLoadCombo = DispTable(4:end,2);
    DispStory = DispTable(4:end,4:5);
    DispsDir = DispTable(4:end,3);
    
elseif strmatch(AnalysisType,'Wind')
    combos={1,2};
    combosFields={'Step1' 'Step2'};
    % Wall Force,
    PierStoryLabels = PierTable(4:end,1);
    PierName = PierTable(4:end,2);
    PierLoadCombo = PierTable(4:end,5);
    PierForces = PierTable(4:end,7:12);
    
    % Coupling beam story
    SpandrelStoryLabels = SpandrelTabel(4:end,1);
    SpandrelName = SpandrelTabel(4:end,2);
    SpandrelLoadCombo = SpandrelTabel(4:end,5);
    SpandrelForces = SpandrelTabel(4:end,8);
    SpandrelSide = SpandrelTabel(4:end,6);
    % Story drifts
    DriftsStoryLabels = DriftsTable(4:end,1);
    DriftsLoadCombo = DriftsTable(4:end,4);
    DriftsDir = DriftsTable(4:end,6);
    DriftsStoryDrifts = DriftsTable(4:end,7);
    
    % Story disps
    DispStoryLabels = DispTable(4:end,1);
    DispLoadCombo = DispTable(4:end,4);
    DispStory = DispTable(4:end,6:7);
    DispsDir = DispTable(4:end,5);
end


for aa = 1:length(piers)
    
    
    for bb = 1:length(combos)
        
        if strmatch(AnalysisType, 'Wind')
            index = find(strcmp(PierName,piers{aa}) & ismember(cell2mat(PierLoadCombo),combos{bb}));
        else
            index = find(strcmp(PierName,piers{aa}) & strcmp(PierLoadCombo,combos{bb}));
        end
        Lvls = PierStoryLabels(index);
        Forces = PierForces(index,:);
        Data.Walls.(combosFields{bb}).(piers{aa}) = [cell2mat(Elvs),cell2mat(Forces)];
        
    end
end
% 
% figure;plot(Data.Walls.(combosFields{bb-1}).(piers{aa})(:,2),Data.Walls.(combosFields{bb-1}).(piers{aa})(:,1),'-r')


for aa = 1:length(CBtags)
    
    
    for bb = 1:length(combos)
        
        if strmatch(AnalysisType, 'Wind')
            index = find(strcmp(SpandrelName,CBtags{aa}) & ismember(cell2mat(SpandrelLoadCombo),combos{bb}) );
        else
            index = find(strcmp(SpandrelName,CBtags{aa}) & strcmp(SpandrelLoadCombo,(combos{bb})));
        end
        unqel = sort(unique(cell2mat(Elvs)),'descend');
        unqel = unqel(2:end);
        Lvls = SpandrelStoryLabels(index);
        Forces = SpandrelForces(index,:);
        Data.CB.(combosFields{bb}).(CBtagsFields{aa}) =  [cell2mat(Elvs),cell2mat(Forces)];
        
        
        
    end
    
end



for bb = 1:length(combos)
    
    if strmatch(AnalysisType, 'Wind')
        index = find(strcmp(DriftsDir,'Max Drift X') &ismember(cell2mat(DriftsLoadCombo),combos{bb}));
    else
        index = find(strcmp(DriftsDir,'Max Drift X') & strcmp(DriftsLoadCombo,(combos{bb})));
    end
    Lvls = DriftsStoryLabels(index);
    Drifts = DriftsStoryDrifts(index,:);
    
    Data.DriftX.(combosFields{bb}) = [unqel,cell2mat(Drifts)];
    
    
end

for bb = 1:length(combos)
    %get the data
    if strmatch(AnalysisType, 'Wind')
        index = find(strcmp(DriftsDir,'Max Drift Y') & ismember(cell2mat(DriftsLoadCombo),combos{bb}));
    else
        index = find(strcmp(DriftsDir,'Max Drift Y') & strcmp(DriftsLoadCombo,(combos{bb})));
    end
    Lvls = DriftsStoryLabels(index);
    Drifts = DriftsStoryDrifts(index,:);
    
    Data.DriftY.(combosFields{bb}) = [unqel,cell2mat(Drifts)];
    
    
end



for bb = 1:length(combos)
    
    if strmatch(AnalysisType, 'Wind')
        index = find(ismember(cell2mat(DispLoadCombo),combos{bb}));
    else
        index = find(strcmp(DispLoadCombo,(combos{bb})));
    end
    Lvls = DispStoryLabels(index);
    Disp = DispStory(index,:);
    unqel = sort(unique(cell2mat(Elvs)),'descend');
    
    Data.Disp.(combosFields{bb}) = [unqel,cell2mat(Disp)];
    
end
