function [mATvALS] = PlotEtabsWallTotal(WallTotalARSA,WallTotalAWind,linetypes,SF)
%% Wall Total Lateral Forces

SFx = SF.X.SF;
SFy = SF.Y.SF;
SFW = 1.4;
figure;
subplot(1,4,1);
Els = WallTotalARSA.Walls.RSAx.WallTotal(:,1);
FNum = 6;
plot(SFx*WallTotalARSA.Walls.RSAx.WallTotal(:,FNum)/1000^2,Els,linetypes{1},...
    SFx*WallTotalARSA.Walls.RSAxnT.WallTotal(:,FNum)/1000^2,Els,linetypes{2},...
    SFx*WallTotalARSA.Walls.RSAxpT.WallTotal(:,FNum)/1000^2,Els,linetypes{3},...
    SFW*abs(WallTotalAWind.Walls.Step1.WallTotal(:,FNum))/1000^2,Els,linetypes{4})

title('M2');
xlabel('M2 [kN-m]');
etabsgraphFormat(1)
subplot(1,4,2);

mATvALS = [Els SFx*WallTotalARSA.Walls.RSAx.WallTotal(:,FNum)/1000^2 SFx*WallTotalARSA.Walls.RSAxnT.WallTotal(:,FNum)/1000^2 SFx*WallTotalARSA.Walls.RSAxpT.WallTotal(:,FNum)/1000^2 ...
      SFW*abs(WallTotalAWind.Walls.Step1.WallTotal(:,FNum))/1000^2];

FNum = 7;
plot(SFy*WallTotalARSA.Walls.RSAy.WallTotal(:,FNum)/1000^2,Els,linetypes{1},...
    SFy*WallTotalARSA.Walls.RSAynT.WallTotal(:,FNum)/1000^2,Els,linetypes{2},...
    SFy*WallTotalARSA.Walls.RSAypT.WallTotal(:,FNum)/1000^2,Els,linetypes{3},...
    SFW*abs(WallTotalAWind.Walls.Step2.WallTotal(:,FNum))/1000^2,Els,linetypes{4})
title('M3');
xlabel('M3 [kN-m]');
etabsgraphFormat(0)

mATvALS = [mATvALS SFy*WallTotalARSA.Walls.RSAy.WallTotal(:,FNum)/1000^2 SFy*WallTotalARSA.Walls.RSAynT.WallTotal(:,FNum)/1000^2 ...
      SFy*WallTotalARSA.Walls.RSAypT.WallTotal(:,FNum)/1000^2 SFW*abs(WallTotalAWind.Walls.Step2.WallTotal(:,FNum))/1000^2];

subplot(1,4,3);

FNum = 3;
plot(SFy*WallTotalARSA.Walls.RSAy.WallTotal(:,FNum)/1000,Els,linetypes{1},...
    SFy*WallTotalARSA.Walls.RSAynT.WallTotal(:,FNum)/1000,Els,linetypes{2},...
    SFy*WallTotalARSA.Walls.RSAypT.WallTotal(:,FNum)/1000,Els,linetypes{3},...
    SFW*abs(WallTotalAWind.Walls.Step2.WallTotal(:,FNum))/1000,Els,linetypes{4})
title('V2');
xlabel('V2 [kN]');
etabsgraphFormat(0)
mATvALS = [mATvALS SFy*WallTotalARSA.Walls.RSAy.WallTotal(:,FNum)/1000 SFy*WallTotalARSA.Walls.RSAynT.WallTotal(:,FNum)/1000 SFy*WallTotalARSA.Walls.RSAypT.WallTotal(:,FNum)/1000 SFW*abs(WallTotalAWind.Walls.Step2.WallTotal(:,FNum))/1000]; ...
   
subplot(1,4,4);
FNum = 4;
plot(SFx*WallTotalARSA.Walls.RSAx.WallTotal(:,FNum)/1000,Els,linetypes{1},...
    SFx*WallTotalARSA.Walls.RSAxnT.WallTotal(:,FNum)/1000,Els,linetypes{2},...
    SFx*WallTotalARSA.Walls.RSAxpT.WallTotal(:,FNum)/1000,Els,linetypes{3},...
    SFW*abs(WallTotalAWind.Walls.Step1.WallTotal(:,FNum))/1000,Els,linetypes{4})
mATvALS = [mATvALS SFx*WallTotalARSA.Walls.RSAx.WallTotal(:,FNum)/1000 SFx*WallTotalARSA.Walls.RSAxnT.WallTotal(:,FNum)/1000 SFx*WallTotalARSA.Walls.RSAxpT.WallTotal(:,FNum)/1000 SFW*abs(WallTotalAWind.Walls.Step1.WallTotal(:,FNum))/1000];
title('V3');
xlabel('V3 [kN]');
etabsgraphFormat(0)
suptitle('Wall Total')
legend('RSA','RSA-nT','RSA-pT','Wind')





