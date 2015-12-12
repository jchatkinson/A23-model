function [mATvALS,WindMatrix]  = PlotEtabsCB(WallTotalARSA,WallTotalAWind,linetypes,SF)
SFx = SF.X.SF;
SFW = 1.4;

%%
figure;

Els = WallTotalARSA.CB.RSAx.CBNW(:,1)/1000;
subplot(1,2,1);

ReduceVal = 1000;
FNum = 2;

AX = max(abs(SFW*WallTotalAWind.CB.AX.CBNW(:,FNum)/ReduceVal),abs(SFW*WallTotalAWind.CB.AX.CBSW(:,FNum)/ReduceVal));
AY = max(SFW*WallTotalAWind.CB.AY.CBNW(:,FNum)/ReduceVal,abs(SFW*WallTotalAWind.CB.AY.CBSW(:,FNum)/ReduceVal));
BX = max(SFW*WallTotalAWind.CB.BX.CBNW(:,FNum)/ReduceVal,abs(SFW*WallTotalAWind.CB.BX.CBSW(:,FNum)/ReduceVal));
BY = max(SFW*WallTotalAWind.CB.BY.CBNW(:,FNum)/ReduceVal,abs(SFW*WallTotalAWind.CB.BY.CBSW(:,FNum)/ReduceVal));
C = max(SFW*WallTotalAWind.CB.C.CBNW(:,FNum)/ReduceVal,abs(SFW*WallTotalAWind.CB.C.CBSW(:,FNum)/ReduceVal));
D = max(SFW*WallTotalAWind.CB.D.CBNW(:,FNum)/ReduceVal,abs(SFW*WallTotalAWind.CB.D.CBSW(:,FNum)/ReduceVal));

WindMatrix = [AX AY BX BY C D];
Windabs = max(abs([AX AY BX BY C D]'))';


plot(SFx*max(abs(WallTotalARSA.CB.RSAx.CBNW(:,FNum)),abs(WallTotalARSA.CB.RSAx.CBSW(:,FNum)))/ReduceVal,Els,linetypes{1},...
    SFx*max(abs(WallTotalARSA.CB.RSAxnT.CBNW(:,FNum)),abs(WallTotalARSA.CB.RSAxnT.CBSW(:,FNum)))/ReduceVal,Els,linetypes{2},...
    SFx*max(abs(WallTotalARSA.CB.RSAxpT.CBNW(:,FNum)),abs(WallTotalARSA.CB.RSAxpT.CBSW(:,FNum)))/ReduceVal,Els,linetypes{3},...
    Windabs,Els,linetypes{4},'LineWidth',1.2)
title('CB W1-W2');
xlabel('V [kN]');
mATvALS = [SFx*max(abs(WallTotalARSA.CB.RSAx.CBNW(:,FNum)),abs(WallTotalARSA.CB.RSAx.CBSW(:,FNum)))/ReduceVal...
    SFx*max(abs(WallTotalARSA.CB.RSAxnT.CBNW(:,FNum)),abs(WallTotalARSA.CB.RSAxnT.CBSW(:,FNum)))/ReduceVal...
    SFx*max(abs(WallTotalARSA.CB.RSAxpT.CBNW(:,FNum)),abs(WallTotalARSA.CB.RSAxpT.CBSW(:,FNum)))/ReduceVal...
     Windabs];
 
etabsgraphFormat(1)

%%
subplot(1,2,2);
   

ReduceVal = 1000;
FNum = 2;

AX = max(abs(SFW*WallTotalAWind.CB.AX.CBNE(:,FNum)/ReduceVal),abs(SFW*WallTotalAWind.CB.AX.CBSE(:,FNum)/ReduceVal));
AY = max(SFW*WallTotalAWind.CB.AY.CBNE(:,FNum)/ReduceVal,abs(SFW*WallTotalAWind.CB.AY.CBSE(:,FNum)/ReduceVal));
BX = max(SFW*WallTotalAWind.CB.BX.CBNE(:,FNum)/ReduceVal,abs(SFW*WallTotalAWind.CB.BX.CBSE(:,FNum)/ReduceVal));
BY = max(SFW*WallTotalAWind.CB.BY.CBNE(:,FNum)/ReduceVal,abs(SFW*WallTotalAWind.CB.BY.CBSE(:,FNum)/ReduceVal));
C = max(SFW*WallTotalAWind.CB.C.CBNE(:,FNum)/ReduceVal,abs(SFW*WallTotalAWind.CB.C.CBSE(:,FNum)/ReduceVal));
D = max(SFW*WallTotalAWind.CB.D.CBNE(:,FNum)/ReduceVal,abs(SFW*WallTotalAWind.CB.D.CBSE(:,FNum)/ReduceVal));

WindMatrix = [WindMatrix AX AY BX BY C D];
Windabs = max(abs([AX AY BX BY C D]'))';

plot(SFx*max(abs(WallTotalARSA.CB.RSAx.CBNE(:,FNum)),abs(WallTotalARSA.CB.RSAx.CBSE(:,FNum)))/ReduceVal,Els,linetypes{1},...
    SFx*max(abs(WallTotalARSA.CB.RSAxnT.CBNE(:,FNum)),abs(WallTotalARSA.CB.RSAxnT.CBSE(:,FNum)))/ReduceVal,Els,linetypes{2},...
    SFx*max(abs(WallTotalARSA.CB.RSAxpT.CBNE(:,FNum)),abs(WallTotalARSA.CB.RSAxpT.CBSE(:,FNum)))/ReduceVal,Els,linetypes{3},...
   Windabs,Els,linetypes{4},'LineWidth',1.2)
title('CB W2-W3');
xlabel('V [kN]');
etabsgraphFormat(0)
legend('RSA','RSA-nT','RSA-pT','Wind');

mATvALS = [mATvALS SFx*max(abs(WallTotalARSA.CB.RSAx.CBNE(:,FNum)),abs(WallTotalARSA.CB.RSAx.CBSE(:,FNum)))/ReduceVal...
    SFx*max(abs(WallTotalARSA.CB.RSAxnT.CBNE(:,FNum)),abs(WallTotalARSA.CB.RSAxnT.CBSE(:,FNum)))/ReduceVal...
    SFx*max(abs(WallTotalARSA.CB.RSAxpT.CBNE(:,FNum)),abs(WallTotalARSA.CB.RSAxpT.CBSE(:,FNum)))/ReduceVal...
     Windabs];
