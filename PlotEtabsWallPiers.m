function [mATvALS,WindMatrix] = PlotEtabsWallPiers(Pierlab, PiersARSA,PiersAWind,FlangesAndWebsARSA,FlangesAndWebsAWind,linetypes,SF)

SFx = SF.X.SF;
SFy = SF.Y.SF;
SFW = 1.4;

figure;
Els = PiersARSA.Walls.RSAx.W1(:,1)/1000;

%%
subplot(1,5,1);

ReduceVal = 1000^2;
FNum = 6;


AX = SFW*PiersAWind.Walls.AX.(Pierlab)(:,FNum)/ReduceVal;
AY = SFW*PiersAWind.Walls.AY.(Pierlab)(:,FNum)/ReduceVal;
BX = SFW*PiersAWind.Walls.BX.(Pierlab)(:,FNum)/ReduceVal;
BY = SFW*PiersAWind.Walls.BY.(Pierlab)(:,FNum)/ReduceVal;
C = SFW*PiersAWind.Walls.C.(Pierlab)(:,FNum)/ReduceVal;
D = SFW*PiersAWind.Walls.D.(Pierlab)(:,FNum)/ReduceVal;

WindMatrix = [AX AY BX BY C D];
Windabs = max(abs([AX AY BX BY C D]'))';


plot(SFx*PiersARSA.Walls.RSAx.(Pierlab)(:,FNum)/ReduceVal,Els,linetypes{1},...
    SFx*PiersARSA.Walls.RSAxnT.(Pierlab)(:,FNum)/ReduceVal,Els,linetypes{2},...
    SFx*PiersARSA.Walls.RSAxpT.(Pierlab)(:,FNum)/ReduceVal,Els,linetypes{3},...
    Windabs,Els,linetypes{4})
title('M2');
xlabel('M2 [kN-m]');
etabsgraphFormat(1)

mATvALS = [Els SFx*PiersARSA.Walls.RSAx.(Pierlab)(:,FNum)/ReduceVal SFx*PiersARSA.Walls.RSAxnT.(Pierlab)(:,FNum)/ReduceVal ...
    SFx*PiersARSA.Walls.RSAxpT.(Pierlab)(:,FNum)/ReduceVal Windabs];

%%
subplot(1,5,2);
FNum = 7;


AX = SFW*PiersAWind.Walls.AX.(Pierlab)(:,FNum)/ReduceVal;
AY = SFW*PiersAWind.Walls.AY.(Pierlab)(:,FNum)/ReduceVal;
BX = SFW*PiersAWind.Walls.BX.(Pierlab)(:,FNum)/ReduceVal;
BY = SFW*PiersAWind.Walls.BY.(Pierlab)(:,FNum)/ReduceVal;
C = SFW*PiersAWind.Walls.C.(Pierlab)(:,FNum)/ReduceVal;
D = SFW*PiersAWind.Walls.D.(Pierlab)(:,FNum)/ReduceVal;

WindMatrix = [WindMatrix AX AY BX BY C D];
Windabs = max(abs([AX AY BX BY C D]'))';


plot(SFy*PiersARSA.Walls.RSAy.(Pierlab)(:,FNum)/ReduceVal,Els,linetypes{1},...
    SFy*PiersARSA.Walls.RSAynT.(Pierlab)(:,FNum)/ReduceVal,Els,linetypes{2},...
    SFy*PiersARSA.Walls.RSAypT.(Pierlab)(:,FNum)/ReduceVal,Els,linetypes{3},...
    Windabs,Els,linetypes{4})
title('M3');
xlabel('M3 [kN-m]');
etabsgraphFormat(0)


mATvALS = [mATvALS SFy*PiersARSA.Walls.RSAy.(Pierlab)(:,FNum)/ReduceVal  SFy*PiersARSA.Walls.RSAynT.(Pierlab)(:,FNum)/ReduceVal ...
    SFy*PiersARSA.Walls.RSAypT.(Pierlab)(:,FNum)/ReduceVal Windabs];


%%
subplot(1,5,3);
ReduceVal = 1000;
FNum = 3;

AX = SFW*FlangesAndWebsAWind.Walls.AX.([Pierlab 'W'])(:,FNum)/ReduceVal;
AY = SFW*FlangesAndWebsAWind.Walls.AY.([Pierlab 'W'])(:,FNum)/ReduceVal;
BX = SFW*FlangesAndWebsAWind.Walls.BX.([Pierlab 'W'])(:,FNum)/ReduceVal;
BY = SFW*FlangesAndWebsAWind.Walls.BY.([Pierlab 'W'])(:,FNum)/ReduceVal;
C = SFW*FlangesAndWebsAWind.Walls.C.([Pierlab 'W'])(:,FNum)/ReduceVal;
D = SFW*FlangesAndWebsAWind.Walls.D.([Pierlab 'W'])(:,FNum)/ReduceVal;

WindMatrix = [WindMatrix AX AY BX BY C D];
Windabs = max(abs([AX AY BX BY C D]'))';


plot(SFy*FlangesAndWebsARSA.Walls.RSAy.([Pierlab 'W'])(:,FNum)/ReduceVal,Els,linetypes{1},...
    SFy*FlangesAndWebsARSA.Walls.RSAynT.([Pierlab 'W'])(:,FNum)/ReduceVal,Els,linetypes{2},...
    SFy*FlangesAndWebsARSA.Walls.RSAypT.([Pierlab 'W'])(:,FNum)/ReduceVal,Els,linetypes{3},...
    Windabs,Els,linetypes{4})
title('V-Web');
xlabel('V2 [kN]');
etabsgraphFormat(0)


mATvALS = [mATvALS SFy*FlangesAndWebsARSA.Walls.RSAy.([Pierlab 'W'])(:,FNum)/ReduceVal SFy*FlangesAndWebsARSA.Walls.RSAynT.([Pierlab 'W'])(:,FNum)/ReduceVal ...
    SFy*FlangesAndWebsARSA.Walls.RSAypT.([Pierlab 'W'])(:,FNum)/ReduceVal Windabs];



subplot(1,5,4);
ReduceVal = 1000;
FNum = 4;

AX = max(abs(SFW*FlangesAndWebsAWind.Walls.AX.([Pierlab 'F1'])(:,FNum)/ReduceVal),abs(SFW*FlangesAndWebsAWind.Walls.AX.([Pierlab 'F2'])(:,FNum)/ReduceVal));
AY = max(abs(SFW*FlangesAndWebsAWind.Walls.AY.([Pierlab 'F1'])(:,FNum)/ReduceVal),abs(SFW*FlangesAndWebsAWind.Walls.AY.([Pierlab 'F2'])(:,FNum)/ReduceVal));
BX = max(abs(SFW*FlangesAndWebsAWind.Walls.BX.([Pierlab 'F1'])(:,FNum)/ReduceVal),abs(SFW*FlangesAndWebsAWind.Walls.BX.([Pierlab 'F2'])(:,FNum)/ReduceVal));
BY = max(abs(SFW*FlangesAndWebsAWind.Walls.BY.([Pierlab 'F1'])(:,FNum)/ReduceVal),abs(SFW*FlangesAndWebsAWind.Walls.BY.([Pierlab 'F2'])(:,FNum)/ReduceVal));
C = max(abs(SFW*FlangesAndWebsAWind.Walls.C.([Pierlab 'F1'])(:,FNum)/ReduceVal),abs(SFW*FlangesAndWebsAWind.Walls.C.([Pierlab 'F2'])(:,FNum)/ReduceVal));
D = max(abs(SFW*FlangesAndWebsAWind.Walls.D.([Pierlab 'F1'])(:,FNum)/ReduceVal),abs(SFW*FlangesAndWebsAWind.Walls.D.([Pierlab 'F2'])(:,FNum)/ReduceVal));

WindMatrix = [WindMatrix AX AY BX BY C D];
Windabs = max(abs([AX AY BX BY C D]'))';



plot(SFx*max(abs(FlangesAndWebsARSA.Walls.RSAx.([Pierlab 'F1'])(:,FNum)),abs(FlangesAndWebsARSA.Walls.RSAx.([Pierlab 'F2'])(:,FNum)))/ReduceVal,Els,linetypes{1},...
    SFx*max(abs(FlangesAndWebsARSA.Walls.RSAxnT.([Pierlab 'F1'])(:,FNum)),abs(FlangesAndWebsARSA.Walls.RSAxnT.([Pierlab 'F2'])(:,FNum)))/ReduceVal,Els,linetypes{2},...
    SFx*max(abs(FlangesAndWebsARSA.Walls.RSAxpT.([Pierlab 'F1'])(:,FNum)),abs(FlangesAndWebsARSA.Walls.RSAxpT.([Pierlab 'F2'])(:,FNum)))/ReduceVal,Els,linetypes{3},...
    Windabs,Els,linetypes{4})
title('V-Flanges');
xlabel('V3 [kN]');
etabsgraphFormat(0)

mATvALS = [mATvALS SFx*max(abs(FlangesAndWebsARSA.Walls.RSAx.([Pierlab 'F1'])(:,FNum)),abs(FlangesAndWebsARSA.Walls.RSAx.([Pierlab 'F2'])(:,FNum)))/ReduceVal ...
    SFx*max(abs(FlangesAndWebsARSA.Walls.RSAxnT.([Pierlab 'F1'])(:,FNum)),abs(FlangesAndWebsARSA.Walls.RSAxnT.([Pierlab 'F2'])(:,FNum)))/ReduceVal ...
    SFx*max(abs(FlangesAndWebsARSA.Walls.RSAxpT.([Pierlab 'F1'])(:,FNum)),abs(FlangesAndWebsARSA.Walls.RSAxpT.([Pierlab 'F2'])(:,FNum)))/ReduceVal ...
    Windabs];

%%
subplot(1,5,5);

FNum = 2;


AX = SFW*PiersAWind.Walls.AX.(Pierlab)(:,FNum)/ReduceVal;
AY = SFW*PiersAWind.Walls.AY.(Pierlab)(:,FNum)/ReduceVal;
BX = SFW*PiersAWind.Walls.BX.(Pierlab)(:,FNum)/ReduceVal;
BY = SFW*PiersAWind.Walls.BY.(Pierlab)(:,FNum)/ReduceVal;
C = SFW*PiersAWind.Walls.C.(Pierlab)(:,FNum)/ReduceVal;
D = SFW*PiersAWind.Walls.D.(Pierlab)(:,FNum)/ReduceVal;

WindMatrix = [WindMatrix AX AY BX BY C D];
Windabs = max(abs([AX AY BX BY C D]'))';


plot(SFx*PiersARSA.Walls.RSAx.(Pierlab)(:,FNum)/ReduceVal,Els,linetypes{1},...
    SFx*PiersARSA.Walls.RSAxnT.(Pierlab)(:,FNum)/ReduceVal,Els,linetypes{2},...
    SFx*PiersARSA.Walls.RSAxpT.(Pierlab)(:,FNum)/ReduceVal,Els,linetypes{3},...
    Windabs,Els,linetypes{4})
title('Axial');
xlabel('P [kN]');
etabsgraphFormat(0)

mATvALS = [ mATvALS SFx*PiersARSA.Walls.RSAx.(Pierlab)(:,FNum)/ReduceVal SFx*PiersARSA.Walls.RSAxnT.(Pierlab)(:,FNum)/ReduceVal ...
    SFx*PiersARSA.Walls.RSAxpT.(Pierlab)(:,FNum)/ReduceVal Windabs];


suptitle(Pierlab)
legend('RSA','RSA-nT','RSA-pT','Wind')

%%
FNum = 3;
AX = SFW*PiersAWind.Walls.AX.(Pierlab)(:,FNum)/ReduceVal;
AY = SFW*PiersAWind.Walls.AY.(Pierlab)(:,FNum)/ReduceVal;
BX = SFW*PiersAWind.Walls.BX.(Pierlab)(:,FNum)/ReduceVal;
BY = SFW*PiersAWind.Walls.BY.(Pierlab)(:,FNum)/ReduceVal;
C = SFW*PiersAWind.Walls.C.(Pierlab)(:,FNum)/ReduceVal;
D = SFW*PiersAWind.Walls.D.(Pierlab)(:,FNum)/ReduceVal;

WindMatrix = [WindMatrix AX AY BX BY C D];
Windabs = max(abs([AX AY BX BY C D]'))';



mATvALS = [mATvALS SFy*PiersARSA.Walls.RSAy.(Pierlab)(:,FNum)/ReduceVal  SFy*PiersARSA.Walls.RSAynT.(Pierlab)(:,FNum)/ReduceVal ...
    SFy*PiersARSA.Walls.RSAypT.(Pierlab)(:,FNum)/ReduceVal Windabs];

FNum = 4;

AX = SFW*PiersAWind.Walls.AX.(Pierlab)(:,FNum)/ReduceVal;
AY = SFW*PiersAWind.Walls.AY.(Pierlab)(:,FNum)/ReduceVal;
BX = SFW*PiersAWind.Walls.BX.(Pierlab)(:,FNum)/ReduceVal;
BY = SFW*PiersAWind.Walls.BY.(Pierlab)(:,FNum)/ReduceVal;
C = SFW*PiersAWind.Walls.C.(Pierlab)(:,FNum)/ReduceVal;
D = SFW*PiersAWind.Walls.D.(Pierlab)(:,FNum)/ReduceVal;

WindMatrix = [WindMatrix AX AY BX BY C D];
Windabs = max(abs([AX AY BX BY C D]'))';

mATvALS = [ mATvALS SFx*PiersARSA.Walls.RSAx.(Pierlab)(:,FNum)/ReduceVal SFx*PiersARSA.Walls.RSAxnT.(Pierlab)(:,FNum)/ReduceVal ...
    SFx*PiersARSA.Walls.RSAxpT.(Pierlab)(:,FNum)/ReduceVal Windabs];