function [mATvALS] = PlotEtabsDrifts(WallTotalARSA,WallTotalAWind,linetypes,SF)

figure;

Els = WallTotalARSA.DriftX.RSAx(:,1)/1000;
subplot(1,2,1);
SFx = SF.X.SF*SF.X.Rd*SF.X.Ro;
SFy = SF.Y.SF*SF.Y.Rd*SF.Y.Ro;

FNum = 2;
plot(WallTotalARSA.DriftX.RSAx(:,FNum)*SFx*100,Els,linetypes{1},...
    WallTotalARSA.DriftX.RSAxnT(:,FNum)*SFx*100,Els,linetypes{2},...
    WallTotalARSA.DriftX.RSAxpT(:,FNum)*SFx*100,Els,linetypes{3});%,...
%     WallTotalAWind.DriftX.Step1(:,FNum)*100,Els,linetypes{4})
title('Drift X');
xlabel('ISDR, [%]');
etabsgraphFormat(1)


mATvALS = [Els WallTotalARSA.DriftX.RSAx(:,FNum)*SFx*100 ...
    WallTotalARSA.DriftX.RSAxnT(:,FNum)*SFx*100 ...
    WallTotalARSA.DriftX.RSAxpT(:,FNum)*SFx*100];%,...
    

subplot(1,2,2);

FNum = 2;
plot(WallTotalARSA.DriftY.RSAy(:,FNum)*SFy*100,Els,linetypes{1},...
    WallTotalARSA.DriftY.RSAynT(:,FNum)*SFy*100,Els,linetypes{2},...
    WallTotalARSA.DriftY.RSAypT(:,FNum)*SFy*100,Els,linetypes{3})%,...
   % WallTotalAWind.DriftY.Step2(:,FNum)*100,Els,linetypes{4})
title('Drift Y');


mATvALS = [mATvALS WallTotalARSA.DriftY.RSAy(:,FNum)*SFy*100 ...
    WallTotalARSA.DriftY.RSAynT(:,FNum)*SFy*100 ...
    WallTotalARSA.DriftY.RSAypT(:,FNum)*SFy*100];%,...
xlabel('ISDR, [%]');
etabsgraphFormat(0)
legend('RSA','RSA-nT','RSA-pT')%,'Wind');