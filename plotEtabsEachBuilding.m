
function [MatForces,MatDrift,MatDisp,MatForcesWind] = plotEtabsEachBuilding(WallTotalARSA,WallTotalAWind,PiersARSA,PiersAWind,FlangesAndWebsARSA,FlangesAndWebsAWind,const,linetypes)

% 
%% Wall Total
[MatWT,WMatWT] = PlotEtabsWallTotal(WallTotalARSA,WallTotalAWind,linetypes,const);

%% Wall piers
[MatW1,WMatW1] = PlotEtabsWallPiers('W1',PiersARSA,PiersAWind,FlangesAndWebsARSA,FlangesAndWebsAWind,linetypes,const);
[MatW2,WMatW2] = PlotEtabsWallPiers('W2',PiersARSA,PiersAWind,FlangesAndWebsARSA,FlangesAndWebsAWind,linetypes,const);
[MatW3,WMatW3] = PlotEtabsWallPiers('W3',PiersARSA,PiersAWind,FlangesAndWebsARSA,FlangesAndWebsAWind,linetypes,const);

%% Coupling Beams
[MatCB,WMatCB] = PlotEtabsCB(WallTotalARSA,WallTotalAWind,linetypes,const);
% 
% %% Drift
 [MatDrift] = PlotEtabsDrifts(WallTotalARSA,WallTotalAWind,linetypes,const);
% 
% %% Disp
 [MatDisp] = PlotEtabsDisps(WallTotalARSA,WallTotalAWind,linetypes,const);
 
 
 MatForces = [MatWT MatW1 MatW2 MatW3 MatCB];
 
  MatForcesWind = [WMatWT WMatW1 WMatW2 WMatW3 WMatCB];
 
