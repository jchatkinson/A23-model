function [mATvALS]  = PlotEtabsCB(WallTotalARSA,WallTotalAWind,linetypes,SF)
SFx = SF.X.SF;
SFW = 1.4;

figure;

Els = WallTotalARSA.CB.RSAx.CBNW(:,1);
subplot(1,2,1);

ReduceVal = 1000;
FNum = 2;
plot(SFx*max(abs(WallTotalARSA.CB.RSAx.CBNW(:,FNum)),abs(WallTotalARSA.CB.RSAx.CBSW(:,FNum)))/ReduceVal,Els,linetypes{1},...
    SFx*max(abs(WallTotalARSA.CB.RSAxnT.CBNW(:,FNum)),abs(WallTotalARSA.CB.RSAxnT.CBSW(:,FNum)))/ReduceVal,Els,linetypes{2},...
    SFx*max(abs(WallTotalARSA.CB.RSAxpT.CBNW(:,FNum)),abs(WallTotalARSA.CB.RSAxpT.CBSW(:,FNum)))/ReduceVal,Els,linetypes{3},...
    SFW*max(abs(WallTotalAWind.CB.Step1.CBNW(:,FNum)),abs(WallTotalAWind.CB.Step1.CBSW(:,FNum)))/ReduceVal,Els,linetypes{4},'LineWidth',1.2)
title('CB W1-W2');
xlabel('V [kN]');
etabsgraphFormat(1)
subplot(1,2,2);

mATvALS = [SFx*max(abs(WallTotalARSA.CB.RSAx.CBNW(:,FNum)),abs(WallTotalARSA.CB.RSAx.CBSW(:,FNum)))/ReduceVal...
    SFx*max(abs(WallTotalARSA.CB.RSAxnT.CBNW(:,FNum)),abs(WallTotalARSA.CB.RSAxnT.CBSW(:,FNum)))/ReduceVal...
    SFx*max(abs(WallTotalARSA.CB.RSAxpT.CBNW(:,FNum)),abs(WallTotalARSA.CB.RSAxpT.CBSW(:,FNum)))/ReduceVal...
     SFW*max(abs(WallTotalAWind.CB.Step1.CBNW(:,FNum)),abs(WallTotalAWind.CB.Step1.CBSW(:,FNum)))/ReduceVal];
    

ReduceVal = 1000;
FNum = 2;
plot(SFx*max(abs(WallTotalARSA.CB.RSAx.CBNE(:,FNum)),abs(WallTotalARSA.CB.RSAx.CBSE(:,FNum)))/ReduceVal,Els,linetypes{1},...
    SFx*max(abs(WallTotalARSA.CB.RSAxnT.CBNE(:,FNum)),abs(WallTotalARSA.CB.RSAxnT.CBSE(:,FNum)))/ReduceVal,Els,linetypes{2},...
    SFx*max(abs(WallTotalARSA.CB.RSAxpT.CBNE(:,FNum)),abs(WallTotalARSA.CB.RSAxpT.CBSE(:,FNum)))/ReduceVal,Els,linetypes{3},...
    SFW*max(abs(WallTotalAWind.CB.Step1.CBNE(:,FNum)),abs(WallTotalAWind.CB.Step1.CBSE(:,FNum)))/ReduceVal,Els,linetypes{4},'LineWidth',1.2)
title('CB W2-W3');
xlabel('V [kN]');
etabsgraphFormat(0)
legend('RSA','RSA-nT','RSA-pT','Wind');

mATvALS = [mATvALS SFx*max(abs(WallTotalARSA.CB.RSAx.CBNE(:,FNum)),abs(WallTotalARSA.CB.RSAx.CBSE(:,FNum)))/ReduceVal...
    SFx*max(abs(WallTotalARSA.CB.RSAxnT.CBNE(:,FNum)),abs(WallTotalARSA.CB.RSAxnT.CBSE(:,FNum)))/ReduceVal...
    SFx*max(abs(WallTotalARSA.CB.RSAxpT.CBNE(:,FNum)),abs(WallTotalARSA.CB.RSAxpT.CBSE(:,FNum)))/ReduceVal...
     SFW*max(abs(WallTotalAWind.CB.Step1.CBNE(:,FNum)),abs(WallTotalAWind.CB.Step1.CBSE(:,FNum)))/ReduceVal];
