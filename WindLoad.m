%Wind Model for A23.3 Example. Cgx = []; Cgy=[];
clear all; clc;

Geom.floorheights = [4.46;repmat(2.78,29,1);5.07]; 
Geom.elevations(1)=0;
for ii = 1:length(Geom.floorheights)
    Geom.elevations(ii+1,1) = Geom.elevations(ii)+Geom.floorheights(ii);
end
Geom.nf = length(Geom.floorheights);
Geom.b = 25.91; 
Geom.d = 25.91; 
fnx = 1/5.411; 
fny = 1/4.202;
beta=0.02; 
Iw=1; 
q=0.45; 
terrainType='Rough'; 
plotflag = 1;

[WLx, Geom] = NBCC_WindLoad(Geom,'x',terrainType,Iw,q,beta,fnx,plotflag);

[WLy, Geom] = NBCC_WindLoad(Geom,'y',terrainType,Iw,q,beta,fny,plotflag);

% clear all; clc;
% mydir = [getenv('USERPROFILE') '\Documents\MATLAB\Design and Analysis Tools\Models\'];
% 
% nf=39;
% b=33.5; 
% d=33.5; 
% bw=3.9; 
% hw=10; 
% tw=0.60; 
% tf=0.75; 
% o=2.7; 
% fc=60e6; 
% bCol = {[0.7,0.9,0.9,0.7,0.7,0.7,0.7,0.9,0.9,0.7,0.7,0.7]}; 
% dCol = {[0.7,0.9,0.9,0.7,0.7,0.7,0.7,0.9,0.9,0.7,0.7,0.7]};
% floorheights = {[7.6; repmat(3.6,nf-1,1)]}; 
% dcb = {[2.7; repmat(1.1,nf-1,1)]};
% 
% Geom = InitCoreWallGeom(b(n),d(n),nf(n),bw(n),hw(n),tw(n),tf(n),o(n),dcb{n},fc(n),floorheights{n},bCol{n},dCol{n},ORG);
% [Model,Library,UserDef,Geom] = CreateLinearBuildingModel(Geom,mydir);
% [Model,Library,UserDef,Geom,Design] = DesignCoreWallBuilding(Model,Library,UserDef,Geom);