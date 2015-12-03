function [mATvALS] = PlotEtabsWallPiers(Pierlab, PiersARSA,PiersAWind,FlangesAndWebsARSA,FlangesAndWebsAWind,linetypes,SF)

SFx = SF.X.SF;
SFy = SF.Y.SF;
SFW = 1.4;

figure;
Els = PiersARSA.Walls.RSAx.W1(:,1);
subplot(1,5,1);

ReduceVal = 1000^2;
FNum = 6;
plot(SFx*PiersARSA.Walls.RSAx.(Pierlab)(:,FNum)/ReduceVal,Els,linetypes{1},...
    SFx*PiersARSA.Walls.RSAxnT.(Pierlab)(:,FNum)/ReduceVal,Els,linetypes{2},...
    SFx*PiersARSA.Walls.RSAxpT.(Pierlab)(:,FNum)/ReduceVal,Els,linetypes{3},...
    SFW*abs(PiersAWind.Walls.Step1.(Pierlab)(:,FNum))/ReduceVal,Els,linetypes{4})
title('M2');
xlabel('M2 [kN-m]');
etabsgraphFormat(1)

mATvALS = [Els SFx*PiersARSA.Walls.RSAx.(Pierlab)(:,FNum)/ReduceVal SFx*PiersARSA.Walls.RSAxnT.(Pierlab)(:,FNum)/ReduceVal SFx*PiersARSA.Walls.RSAxpT.(Pierlab)(:,FNum)/ReduceVal SFW*abs(PiersAWind.Walls.Step1.(Pierlab)(:,FNum))/ReduceVal];

subplot(1,5,2);


FNum = 7;
plot(SFy*PiersARSA.Walls.RSAy.(Pierlab)(:,FNum)/ReduceVal,Els,linetypes{1},...
    SFy*PiersARSA.Walls.RSAynT.(Pierlab)(:,FNum)/ReduceVal,Els,linetypes{2},...
    SFy*PiersARSA.Walls.RSAypT.(Pierlab)(:,FNum)/ReduceVal,Els,linetypes{3},...
    SFW*(PiersAWind.Walls.Step2.(Pierlab)(:,FNum))/ReduceVal,Els,linetypes{4})
title('M3');
xlabel('M3 [kN-m]');
etabsgraphFormat(0)


mATvALS = [mATvALS SFy*PiersARSA.Walls.RSAy.(Pierlab)(:,FNum)/ReduceVal  SFy*PiersARSA.Walls.RSAynT.(Pierlab)(:,FNum)/ReduceVal ...
    SFy*PiersARSA.Walls.RSAypT.(Pierlab)(:,FNum)/ReduceVal SFW*abs(PiersAWind.Walls.Step2.(Pierlab)(:,FNum))/ReduceVal];

subplot(1,5,3);

ReduceVal = 1000;
FNum = 3;
plot(SFy*FlangesAndWebsARSA.Walls.RSAy.([Pierlab 'W'])(:,FNum)/ReduceVal,Els,linetypes{1},...
    SFy*FlangesAndWebsARSA.Walls.RSAynT.([Pierlab 'W'])(:,FNum)/ReduceVal,Els,linetypes{2},...
    SFy*FlangesAndWebsARSA.Walls.RSAypT.([Pierlab 'W'])(:,FNum)/ReduceVal,Els,linetypes{3},...
    SFW*abs(FlangesAndWebsAWind.Walls.Step2.([Pierlab 'W'])(:,FNum))/ReduceVal,Els,linetypes{4})
title('V-Web');
xlabel('V2 [kN]');
etabsgraphFormat(0)


mATvALS = [mATvALS SFy*FlangesAndWebsARSA.Walls.RSAy.([Pierlab 'W'])(:,FNum)/ReduceVal SFy*FlangesAndWebsARSA.Walls.RSAynT.([Pierlab 'W'])(:,FNum)/ReduceVal ...
    SFy*FlangesAndWebsARSA.Walls.RSAypT.([Pierlab 'W'])(:,FNum)/ReduceVal SFW*abs(FlangesAndWebsAWind.Walls.Step2.([Pierlab 'W'])(:,FNum))/ReduceVal];



subplot(1,5,4);


ReduceVal = 1000;
FNum = 4;
plot(SFx*max(abs(FlangesAndWebsARSA.Walls.RSAx.([Pierlab 'F1'])(:,FNum)),abs(FlangesAndWebsARSA.Walls.RSAx.([Pierlab 'F2'])(:,FNum)))/ReduceVal,Els,linetypes{1},...
    SFx*max(abs(FlangesAndWebsARSA.Walls.RSAxnT.([Pierlab 'F1'])(:,FNum)),abs(FlangesAndWebsARSA.Walls.RSAxnT.([Pierlab 'F2'])(:,FNum)))/ReduceVal,Els,linetypes{2},...
    SFx*max(abs(FlangesAndWebsARSA.Walls.RSAxpT.([Pierlab 'F1'])(:,FNum)),abs(FlangesAndWebsARSA.Walls.RSAxpT.([Pierlab 'F2'])(:,FNum)))/ReduceVal,Els,linetypes{3},...
    SFW*max(abs(FlangesAndWebsAWind.Walls.Step1.([Pierlab 'F1'])(:,FNum)),abs(FlangesAndWebsAWind.Walls.Step1.([Pierlab 'F2'])(:,FNum)))/ReduceVal,Els,linetypes{4})
title('V-Flanges');
xlabel('V3 [kN]');
etabsgraphFormat(0)

mATvALS = [mATvALS SFx*max(abs(FlangesAndWebsARSA.Walls.RSAx.([Pierlab 'F1'])(:,FNum)),abs(FlangesAndWebsARSA.Walls.RSAx.([Pierlab 'F2'])(:,FNum)))/ReduceVal ...
    SFx*max(abs(FlangesAndWebsARSA.Walls.RSAxnT.([Pierlab 'F1'])(:,FNum)),abs(FlangesAndWebsARSA.Walls.RSAxnT.([Pierlab 'F2'])(:,FNum)))/ReduceVal ...
    SFx*max(abs(FlangesAndWebsARSA.Walls.RSAxpT.([Pierlab 'F1'])(:,FNum)),abs(FlangesAndWebsARSA.Walls.RSAxpT.([Pierlab 'F2'])(:,FNum)))/ReduceVal ...
    SFW*max(abs(FlangesAndWebsAWind.Walls.Step1.([Pierlab 'F1'])(:,FNum)),abs(FlangesAndWebsAWind.Walls.Step1.([Pierlab 'F2'])(:,FNum)))/ReduceVal];


subplot(1,5,5);

FNum = 2;
plot(SFx*PiersARSA.Walls.RSAx.(Pierlab)(:,FNum)/ReduceVal,Els,linetypes{1},...
    SFx*PiersARSA.Walls.RSAxnT.(Pierlab)(:,FNum)/ReduceVal,Els,linetypes{2},...
    SFx*PiersARSA.Walls.RSAxpT.(Pierlab)(:,FNum)/ReduceVal,Els,linetypes{3},...
    SFW*abs(PiersAWind.Walls.Step1.(Pierlab)(:,FNum))/ReduceVal,Els,linetypes{4})
title('Axial');
xlabel('P [kN]');
etabsgraphFormat(0)

mATvALS = [ mATvALS SFx*PiersARSA.Walls.RSAx.(Pierlab)(:,FNum)/ReduceVal SFx*PiersARSA.Walls.RSAxnT.(Pierlab)(:,FNum)/ReduceVal ...
    SFx*PiersARSA.Walls.RSAxpT.(Pierlab)(:,FNum)/ReduceVal SFW*abs(PiersAWind.Walls.Step1.(Pierlab)(:,FNum))/ReduceVal];


suptitle(Pierlab)
legend('RSA','RSA-nT','RSA-pT','Wind')

FNum = 3;

mATvALS = [mATvALS SFy*PiersARSA.Walls.RSAy.(Pierlab)(:,FNum)/ReduceVal  SFy*PiersARSA.Walls.RSAynT.(Pierlab)(:,FNum)/ReduceVal ...
    SFy*PiersARSA.Walls.RSAypT.(Pierlab)(:,FNum)/ReduceVal SFW*abs(PiersAWind.Walls.Step2.(Pierlab)(:,FNum))/ReduceVal];

FNum = 4;
mATvALS = [ mATvALS SFx*PiersARSA.Walls.RSAx.(Pierlab)(:,FNum)/ReduceVal SFx*PiersARSA.Walls.RSAxnT.(Pierlab)(:,FNum)/ReduceVal ...
    SFx*PiersARSA.Walls.RSAxpT.(Pierlab)(:,FNum)/ReduceVal SFW*abs(PiersAWind.Walls.Step1.(Pierlab)(:,FNum))/ReduceVal];