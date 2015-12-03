% Clean Start
close all; clear all; clc;

% Read in All the Data
WallTotalAGrav =  ReadDataFromEtabs('45x45','Grav','WallTotal');
WallTotalARSA =  ReadDataFromEtabs('45x45','RSA','WallTotal');
WallTotalAWind =  ReadDataFromEtabs('45x45','Wind','WallTotal');
WallTotalBRSA =  ReadDataFromEtabs('72x72','RSA','WallTotal');
WallTotalBWind =  ReadDataFromEtabs('72x72','Wind','WallTotal');
PiersAGrav =  ReadDataFromEtabs('45x45','Grav','Piers');
PiersARSA =  ReadDataFromEtabs('45x45','RSA','Piers');
PiersAWind =  ReadDataFromEtabs('45x45','Wind','Piers');
PiersBRSA =  ReadDataFromEtabs('72x72','RSA','Piers');
PiersBWind =  ReadDataFromEtabs('72x72','Wind','Piers');

FlangesAndWebsARSA =  ReadDataFromEtabs('45x45','RSA','FlangesAndWebs');
FlangesAndWebsAWind =  ReadDataFromEtabs('45x45','Wind','FlangesAndWebs');
FlangesAndWebsBRSA =  ReadDataFromEtabs('72x72','RSA','FlangesAndWebs');
FlangesAndWebsBWind =  ReadDataFromEtabs('72x72','Wind','FlangesAndWebs');
write2excel = 1;

linetypes={'--k','--b',':c','--r','-+g','b','b'};
% Grav forces
PlotEtabsGravity(WallTotalAGrav,PiersAGrav,linetypes,1)

const.X.SF = .224;
const.X.Rd = 4;
const.X.Ro = 1.7;

const.Y.SF = 0.225;
const.Y.Rd = 3.5;
const.Y.Ro = 1.6;

% Building A
[MatForcesA,MatDriftA,MatDispA] = plotEtabsEachBuilding(WallTotalARSA,WallTotalAWind,PiersARSA,PiersAWind,FlangesAndWebsARSA,FlangesAndWebsAWind,const,linetypes);

%
% Building B
[MatForcesB,MatDriftB,MatDispB] = plotEtabsEachBuilding(WallTotalBRSA,WallTotalBWind,PiersBRSA,PiersBWind,FlangesAndWebsBRSA,FlangesAndWebsBWind,const,linetypes);

if write2excel
    xlswrite('45X45Summary.xlsx',MatForcesA,'All Results','A4')
    xlswrite('45X45Summary.xlsx',MatDriftA,'Drift','A4')
    xlswrite('45X45Summary.xlsx',MatDispA,'Disps','A4')
    xlswrite('72X72Summary.xlsx',MatForcesB,'All Results','A4')
    xlswrite('72X72Summary.xlsx',MatDriftB,'Drift','A4')
    xlswrite('72X72Summary.xlsx',MatDispB,'Disps','A4')
    
end
Geom = DesignerGeom