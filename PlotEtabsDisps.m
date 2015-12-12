function [mATvALS] = PlotEtabsDisps(WallTotalARSA,WallTotalAWind,linetypes,SF)


%% Disp
figure;
SFx = SF.X.SF*SF.X.Rd*SF.X.Ro;
SFy = SF.Y.SF*SF.Y.Rd*SF.Y.Ro;


beta1 = [];
for ii = 1:length(WallTotalARSA.Disp.RSAx(:,2))-1
    beta1 = [beta1 WallTotalARSA.Disp.RSAx(ii,2)/WallTotalARSA.Disp.RSAx(ii,3)]
end
beta1 = max(beta1);

beta2 = [];
for ii = 1:length(WallTotalARSA.Disp.RSAy(:,2))-1
    beta2 = [beta2 WallTotalARSA.Disp.RSAy(ii,2)/WallTotalARSA.Disp.RSAy(ii,3)]
end
beta2 = max(beta2);


Els = WallTotalARSA.Disp.RSAx(:,1)/1000;
subplot(1,2,1);


FNum = 2;
plot(WallTotalARSA.Disp.RSAx(:,FNum)*SFx,Els,linetypes{1},...
    WallTotalARSA.Disp.RSAxnT(:,FNum)*SFx,Els,linetypes{2},...
    WallTotalARSA.Disp.RSAxpT(:,FNum)*SFx,Els,linetypes{3})%,...
    %WallTotalAWind.Disp.Step1(:,FNum),Els,linetypes{4});
title(['Disp X, \beta = ' num2str(beta1)]);
xlabel('\Delta, [mm]');
etabsgraphFormat(1)

[mATvALS] = [Els WallTotalARSA.Disp.RSAx(:,FNum)*SFx...
    WallTotalARSA.Disp.RSAxnT(:,FNum)*SFx...
    WallTotalARSA.Disp.RSAxpT(:,FNum)*SFx];

subplot(1,2,2);

FNum = 2;
plot(WallTotalARSA.Disp.RSAy(:,FNum)*SFy,Els,linetypes{1},...
    WallTotalARSA.Disp.RSAynT(:,FNum)*SFy,Els,linetypes{2},...
    WallTotalARSA.Disp.RSAypT(:,FNum)*SFy,Els,linetypes{3})%,...
    %WallTotalAWind.Disp.Step2(:,FNum),Els,linetypes{4});
    [mATvALS] = [mATvALS WallTotalARSA.Disp.RSAy(:,FNum)*SFy...
    WallTotalARSA.Disp.RSAynT(:,FNum)*SFy...
    WallTotalARSA.Disp.RSAypT(:,FNum)*SFy];

title(['Disp Y, \beta = ' num2str(beta1)]);
xlabel('\Delta, [mm]');
etabsgraphFormat(0)
legend('RSA','RSA-nT','RSA-pT')%,'Wind');
