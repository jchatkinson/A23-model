% Clean Start

close all; clc; clear all;

BuildingType = '45x45';
AnalysisType = 'RSA';
WallSections = 'Piers';
WallPier = 'WallTotal';
combos={'RSAx' 'RSAx-nT' 'RSAx-pT' 'RSAy' 'RSAy-nT' 'RSAy-pT' };
combosFields={'RSAx' 'RSAxnT' 'RSAxpT' 'RSAy' 'RSAynT' 'RSAypT' };



if strmatch(WallSections,'Piers')
    piers = {'W1','W2','W3'};%'WallTotal'
elseif strmatch(WallSections,'WallTotal')
    piers = {'WallTotal'};
else
    piers = {'W1F1','W1F2','W1W','W2F1','W2F2','W2W','W3F1','W3F2','W3W'};
end

CBtags = {'CB-NW','CB-SW','CB-NE','CB-SE'};

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


%% Example - filter data by loadCombo

% myCombo = 'RSAx'; % 'RSAx' 'RSAx-nT' 'RSAx-pT' 'RSAy' 'RSAy-nT' 'RSAy-pT' 'AutoWind1' 'AutoWind2'
% myPier = 'WallTotal';
% index = find(strcmp(PierName,myPier) & strcmp(PierLoadCombo,myCombo));
% Lvls = PierStoryLabels(index);
% Forces = PierForces(index,:);
% Data = [Lvls,num2cell(mergeVectors(Elevations(1:end-1),Elevations(2:end))),Forces];

%% Plot Wall Forces (for each pier,combo)


plots={'P','V2','V3','M2','M3'};
col=[2,3,4,6,7];
% combos={'RSAx' 'RSAx-nT' 'RSAx-pT' 'RSAy' 'RSAy-nT' 'RSAy-pT' 'AutoWind1' 'AutoWind2'};

% linetypes={'r','r','r','m','m','m','b','b'};
linetypes={'r','r','m','m','m','b','b'};


for aa = 1:length(piers)
  figure; hold on;
  
  for bb = 1:length(combos)
    %get the data
    index = find(strcmp(PierName,piers{aa}) & strcmp(PierLoadCombo,(combos{bb})));
    Lvls = PierStoryLabels(index);
    Forces = PierForces(index,:);
    Data.Walls.(combosFields{bb}) = [cell2mat(Elvs),cell2mat(Forces)];
   
    
    for cc = 1:length(plots)
      subplot(1,length(plots),cc); hold on;
      plot((Data.Walls.(combosFields{bb})(:,col(cc))),(Data.Walls.(combosFields{bb})(:,1)),linetypes{bb});
      xlabel(plots{cc});
    end
    
  end
  suptitle(piers{aa});
  hold off
end

plots={'V'};
col=[2];
for aa = 1:length(CBtags)
  figure; hold on;
  
  for bb = 1:length(combos)
    %get the data
    index = find(strcmp(SpandrelName,CBtags{aa}) & strcmp(SpandrelLoadCombo,(combos{bb})));
    Lvls = SpandrelStoryLabels(index);
    Forces = SpandrelForces(index,:);
    Data.CB.(combosFields{bb}) =  [cell2mat(Elvs),cell2mat(Forces)];
    
    for cc = 1:length(plots)
      subplot(1,length(plots),cc); hold on;
      plot(Data.CB.(combosFields{bb})(:,col(cc)),Data.CB.(combosFields{bb})(:,1),linetypes{bb});
      xlabel(plots{cc});
    end
    
  end
  suptitle(CBtags{aa});
  hold off
end



    figure; hold on;
  for bb = 1:length(combos)
    %get the data
    index = find(strcmp(DriftsDir,'Max Drift X') & strcmp(DriftsLoadCombo,(combos{bb})));
    Lvls = DriftsStoryLabels(index);
    Drifts = DriftsStoryDrifts(index,:);
    unqel = sort(unique(cell2mat(Elvs)),'descend');
    unqel = unqel(2:end);
    Data.DriftX.(combosFields{bb}) = [unqel,cell2mat(Drifts)];
    %Data.DriftX.(combosFields{bb}) = [Lvls,unqel,Drifts];
    for cc = 1:length(plots)
      subplot(1,length(plots),cc); hold on;
      plot(Data.DriftX.(combosFields{bb})(:,col(cc)),Data.DriftX.(combosFields{bb})(:,1),linetypes{bb});
      xlabel('Drift X');
    end
    
  end
  suptitle('Drifts');
  hold off



    figure; hold on;
  for bb = 1:length(combos)
    %get the data
    index = find(strcmp(DriftsDir,'Max Drift Y') & strcmp(DriftsLoadCombo,(combos{bb})));
    Lvls = DriftsStoryLabels(index);
    Drifts = DriftsStoryDrifts(index,:);
    unqel = sort(unique(cell2mat(Elvs)),'descend');
    unqel = unqel(2:end);
    Data.DriftY.(combosFields{bb}) = [unqel,cell2mat(Drifts)];
    %Data.DriftX.(combosFields{bb}) = [Lvls,unqel,Drifts];
    for cc = 1:length(plots)
      subplot(1,length(plots),cc); hold on;
      plot(Data.DriftY.(combosFields{bb})(:,col(cc)),Data.DriftY.(combosFields{bb})(:,1),linetypes{bb});
      xlabel('Drift Y');
    end
    
  end
  suptitle('DriftsY');
  hold off

  plots={'Max','Avg'};
  col = [2,3]
    figure; hold on;
  for bb = 1:length(combos)
    %get the data
    index = find(strcmp(DispLoadCombo,(combos{bb})));
    Lvls = DispStoryLabels(index);
    Disp = DispStory(index,:);
    unqel = sort(unique(cell2mat(Elvs)),'descend');

    Data.Disp.(combosFields{bb}) = [unqel,cell2mat(Disp)];
    %Data.DriftX.(combosFields{bb}) = [Lvls,unqel,Drifts];
    for cc = 1:length(plots)
      subplot(1,length(plots),cc); hold on;
      plot(Data.Disp.(combosFields{bb})(:,col(cc)),Data.Disp.(combosFields{bb})(:,1),linetypes{bb});
      xlabel('Max \Delta');
    end
    
  end
  suptitle('Disp');
  hold off