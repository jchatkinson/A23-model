function [mATvALS,WindMatrix] = PlotEtabsWallTotal(WallTotalARSA,WallTotalAWind,linetypes,SF)
%% Wall Total Lateral Forces

SFx = SF.X.SF;
SFy = SF.Y.SF;
SFW = 1.4;
figure;
subplot(1,4,1);
Els = WallTotalARSA.Walls.RSAx.WallTotal(:,1)/1000;
FNum = 6;

AX = SFW*WallTotalAWind.Walls.AX.WallTotal(:,FNum)/1000^2;
AY = SFW*WallTotalAWind.Walls.AY.WallTotal(:,FNum)/1000^2;
BX = SFW*WallTotalAWind.Walls.BX.WallTotal(:,FNum)/1000^2;
BY = SFW*WallTotalAWind.Walls.BY.WallTotal(:,FNum)/1000^2;
C = SFW*WallTotalAWind.Walls.C.WallTotal(:,FNum)/1000^2;
D = SFW*WallTotalAWind.Walls.D.WallTotal(:,FNum)/1000^2;

WindMatrix = [AX AY BX BY C D];
Windabs = max(abs(WindMatrix'))';


plot(SFx*WallTotalARSA.Walls.RSAx.WallTotal(:,FNum)/1000^2,Els,linetypes{1},...
    SFx*WallTotalARSA.Walls.RSAxnT.WallTotal(:,FNum)/1000^2,Els,linetypes{2},...
    SFx*WallTotalARSA.Walls.RSAxpT.WallTotal(:,FNum)/1000^2,Els,linetypes{3},...
    Windabs,Els,linetypes{4})




title('M2');
xlabel('M2 [kN-m]');
etabsgraphFormat(1)
subplot(1,4,2);

mATvALS = [Els SFx*WallTotalARSA.Walls.RSAx.WallTotal(:,FNum)/1000^2 SFx*WallTotalARSA.Walls.RSAxnT.WallTotal(:,FNum)/1000^2 SFx*WallTotalARSA.Walls.RSAxpT.WallTotal(:,FNum)/1000^2 ...
      Windabs];

FNum = 7;


AX = SFW*WallTotalAWind.Walls.AX.WallTotal(:,FNum)/1000^2;
AY = SFW*WallTotalAWind.Walls.AY.WallTotal(:,FNum)/1000^2;
BX = SFW*WallTotalAWind.Walls.BX.WallTotal(:,FNum)/1000^2;
BY = SFW*WallTotalAWind.Walls.BY.WallTotal(:,FNum)/1000^2;
C = SFW*WallTotalAWind.Walls.C.WallTotal(:,FNum)/1000^2;
D = SFW*WallTotalAWind.Walls.D.WallTotal(:,FNum)/1000^2;

WindMatrix = [WindMatrix AX AY BX BY C D];
Windabs = max(abs([AX AY BX BY C D]'))';



plot(SFy*WallTotalARSA.Walls.RSAy.WallTotal(:,FNum)/1000^2,Els,linetypes{1},...
    SFy*WallTotalARSA.Walls.RSAynT.WallTotal(:,FNum)/1000^2,Els,linetypes{2},...
    SFy*WallTotalARSA.Walls.RSAypT.WallTotal(:,FNum)/1000^2,Els,linetypes{3},...
    Windabs,Els,linetypes{4})
title('M3');
xlabel('M3 [kN-m]');
etabsgraphFormat(0)

mATvALS = [mATvALS SFy*WallTotalARSA.Walls.RSAy.WallTotal(:,FNum)/1000^2 SFy*WallTotalARSA.Walls.RSAynT.WallTotal(:,FNum)/1000^2 ...
      SFy*WallTotalARSA.Walls.RSAypT.WallTotal(:,FNum)/1000^2 Windabs];

  
  %% 
subplot(1,4,3);

FNum = 3;


AX = SFW*WallTotalAWind.Walls.AX.WallTotal(:,FNum)/1000;
AY = SFW*WallTotalAWind.Walls.AY.WallTotal(:,FNum)/1000;
BX = SFW*WallTotalAWind.Walls.BX.WallTotal(:,FNum)/1000;
BY = SFW*WallTotalAWind.Walls.BY.WallTotal(:,FNum)/1000;
C = SFW*WallTotalAWind.Walls.C.WallTotal(:,FNum)/1000;
D = SFW*WallTotalAWind.Walls.D.WallTotal(:,FNum)/1000;

WindMatrix = [WindMatrix AX AY BX BY C D];
Windabs = max(abs([AX AY BX BY C D]'))';


plot(SFy*WallTotalARSA.Walls.RSAy.WallTotal(:,FNum)/1000,Els,linetypes{1},...
    SFy*WallTotalARSA.Walls.RSAynT.WallTotal(:,FNum)/1000,Els,linetypes{2},...
    SFy*WallTotalARSA.Walls.RSAypT.WallTotal(:,FNum)/1000,Els,linetypes{3},...
    Windabs,Els,linetypes{4})
title('V2');
xlabel('V2 [kN]');
etabsgraphFormat(0)
mATvALS = [mATvALS SFy*WallTotalARSA.Walls.RSAy.WallTotal(:,FNum)/1000 SFy*WallTotalARSA.Walls.RSAynT.WallTotal(:,FNum)/1000 ...
    SFy*WallTotalARSA.Walls.RSAypT.WallTotal(:,FNum)/1000 Windabs]; ...
   

%%
subplot(1,4,4);
FNum = 4;


AX = SFW*WallTotalAWind.Walls.AX.WallTotal(:,FNum)/1000;
AY = SFW*WallTotalAWind.Walls.AY.WallTotal(:,FNum)/1000;
BX = SFW*WallTotalAWind.Walls.BX.WallTotal(:,FNum)/1000;
BY = SFW*WallTotalAWind.Walls.BY.WallTotal(:,FNum)/1000;
C = SFW*WallTotalAWind.Walls.C.WallTotal(:,FNum)/1000;
D = SFW*WallTotalAWind.Walls.D.WallTotal(:,FNum)/1000;

WindMatrix = [WindMatrix AX AY BX BY C D];
Windabs = max(abs([AX AY BX BY C D]'))';

plot(SFx*WallTotalARSA.Walls.RSAx.WallTotal(:,FNum)/1000,Els,linetypes{1},...
    SFx*WallTotalARSA.Walls.RSAxnT.WallTotal(:,FNum)/1000,Els,linetypes{2},...
    SFx*WallTotalARSA.Walls.RSAxpT.WallTotal(:,FNum)/1000,Els,linetypes{3},...
    Windabs,Els,linetypes{4})
mATvALS = [mATvALS SFx*WallTotalARSA.Walls.RSAx.WallTotal(:,FNum)/1000 SFx*WallTotalARSA.Walls.RSAxnT.WallTotal(:,FNum)/1000 ...
    SFx*WallTotalARSA.Walls.RSAxpT.WallTotal(:,FNum)/1000 Windabs];
title('V3');
xlabel('V3 [kN]');
etabsgraphFormat(0)
suptitle('Wall Total')
legend('RSA','RSA-nT','RSA-pT','Wind')





