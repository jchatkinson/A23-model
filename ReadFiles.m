% Clean Start

close all; clc; clear all;

ModelName = '72x72-RSA-WallTotal.xlsx';
WallPier = 'WallTotal';


% Story data
[StoryLabels,~,Elevations] = textread('StoryInformation.txt','%s%f%f');

[~,~,SpandrelForces]= xlsread(ModelName,'Spandrel Forces');
[~,~,PierForces] = xlsread(ModelName,'Pier Forces');
[~,~,StoryDrifts] = xlsread(ModelName,'Story Drifts');
[~,~,StoryDisp] = xlsread(ModelName,'Story Max Avg Displacements');


% Wall Forces
PierStoryLabels = PierForces(4:end,1);
PierName = PierForces(4:end,2);
PierLoadCombo = PierForces(4:end,3);
PierForces = PierForces(4:end,6:12);

% Coupling beam story
SpandrelStoryLabels = SpandrelForces(4:end,1);
SpandralName = SpandrelForces(4:end,2);
SpandrelLoadCombo = SpandrelForces(4:end,3);
SpandralForces = SpandrelForces(4:end,8);

% Story drifts
DriftsStoryLabels = StoryDrifts(4:end,1);
DriftsLoadCombo = StoryDrifts(4:end,2);
DriftsStoryDrifts = StoryDrifts(4:end,7);

% Story disps
DispStoryLabels = StoryDisp(4:end,1);
DispLoadCombo = StoryDisp(4:end,2);
DispStoryDrifts = StoryDisp(4:end,6:7);

