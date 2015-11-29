% Clean Start

close all; clc; clear all;

ModelName = '72x72-RSA-WallTotal.xlsx';
WallPier = 'WallTotal';

% Story data
[StoryLabels,~,Elevations] = textread('StoryInformation.txt','%s%f%f');

[~,~,SpandrelForces]= xlsread(ModelName,'Spandrel Forces');
[~,~,PierTable] = xlsread(ModelName,'Pier Forces');
[~,~,StoryDrifts] = xlsread(ModelName,'Story Drifts');
[~,~,StoryDisp] = xlsread(ModelName,'Story Max Avg Displacements');


% Wall Forces
PierStoryLabels = PierTable(4:end,1);
PierName = PierTable(4:end,2);
PierLoadCombo = PierTable(4:end,3);
PierForces = PierTable(4:end,6:12);

% Coupling beam story
SpandrelStoryLabels = SpandrelForces(4:end,1);
SpandrelName = SpandrelForces(4:end,2);
SpandrelLoadCombo = SpandrelForces(4:end,3);
SpandrelForces = SpandrelForces(4:end,8);

% Story drifts
DriftsStoryLabels = StoryDrifts(4:end,1);
DriftsLoadCombo = StoryDrifts(4:end,2);
DriftsStoryDrifts = StoryDrifts(4:end,7);

% Story disps
DispStoryLabels = StoryDisp(4:end,1);
DispLoadCombo = StoryDisp(4:end,2);
DispStoryDrifts = StoryDisp(4:end,6:7);



%% Example - filter data by loadCombo

% myCombo = 'RSAx'; % 'RSAx' 'RSAx-nT' 'RSAx-pT' 'RSAy' 'RSAy-nT' 'RSAy-pT' 'AutoWind1' 'AutoWind2'
% myPier = 'WallTotal';
% index = find(strcmp(PierName,myPier) & strcmp(PierLoadCombo,myCombo));
% Lvls = PierStoryLabels(index);
% Forces = PierForces(index,:);
% Data = [Lvls,num2cell(mergeVectors(Elevations(1:end-1),Elevations(2:end))),Forces];

%% Plot Wall Forces (for each pier,combo)

piers = {'WallTotal'};
plots={'P','V2','V3','M2','M3'};
col=[4,5,6,8,9];
% combos={'RSAx' 'RSAx-nT' 'RSAx-pT' 'RSAy' 'RSAy-nT' 'RSAy-pT' 'AutoWind1' 'AutoWind2'};
combos={'RSAx' 'RSAx-nT' 'RSAy' 'RSAy-nT' 'RSAy-pT' };
% linetypes={'r','r','r','m','m','m','b','b'};
linetypes={'r','r','m','m','m','b','b'};


for aa = 1:length(piers)
  figure; hold on;
  
  for bb = 1:length(combos)
    %get the data
    index = find(strcmp(PierName,piers{aa}) & strcmp(PierLoadCombo,combos{bb}));
    Lvls = PierStoryLabels(index);
    Forces = PierForces(index,:);
    Data = [Lvls,num2cell(mergeVectors(Elevations(1:end-1),Elevations(2:end))),Forces];
    for cc = 1:length(plots)
      subplot(1,length(plots),cc); hold on;
      plot(cell2mat(Data(:,col(cc))),cell2mat(Data(:,2)),linetypes{bb});
      xlabel(plots{cc});
    end
  end
  suptitle(piers{aa});
  hold off
end


%% Plot Coupling beam forces

cbnames = {'CB-NE','CB-NW','CB-SE','CB-SW'};
plots={'V'};
col=[1];
% combos={'RSAx' 'RSAx-nT' 'RSAx-pT' 'RSAy' 'RSAy-nT' 'RSAy-pT' 'AutoWind1' 'AutoWind2'};
combos={'RSAx' 'RSAx-nT' 'RSAy' 'RSAy-nT' 'RSAy-pT' };
% linetypes={'r','r','r','m','m','m','b','b'};
linetypes={'r','r','m','m','m','b','b'};


for aa = 1:length(cbnames)
  figure; hold on;
  
  for bb = 1:length(cbnames)
    %get the data
    index = find(strcmp(SpandrelName,cbnames{aa}) & strcmp(SpandrelLoadCombo,combos{bb}));
    Lvls = SpandrelStoryLabels(index);
    Forces = SpandrelForces(index,:);
    Data = [Lvls,num2cell(mergeVectors(Elevations(1:end-1),Elevations(2:end))),Forces];
    for cc = 1:length(plots)
      subplot(1,length(plots),cc); hold on;
      plot(cell2mat(Data(:,col(cc))),cell2mat(Data(:,2)),linetypes{bb});
      xlabel(plots{cc});
    end
  end
  suptitle(piers{aa});
  hold off
end
