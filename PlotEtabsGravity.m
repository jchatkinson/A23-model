function PlotEtabsGravity(WallTotalAGrav,PiersAGrav,linetypes,SF)

%% Plot Gravity F in N
figure;
subplot(1,4,1);
plot(-WallTotalAGrav.Walls.Dead.WallTotal(:,2)/1000^2,WallTotalAGrav.Walls.Dead.WallTotal(:,1),linetypes{1},...
    -WallTotalAGrav.Walls.Live.WallTotal(:,2)/1000^2,WallTotalAGrav.Walls.Live.WallTotal(:,1),linetypes{2})
etabsgraphFormat(1)
title('Wall Total');
subplot(1,4,2);
plot(-PiersAGrav.Walls.Dead.W1(:,2)/1000^2,PiersAGrav.Walls.Dead.W1(:,1),linetypes{1},...
    -PiersAGrav.Walls.Live.W1(:,2)/1000^2,PiersAGrav.Walls.Live.W1(:,1),linetypes{2})
etabsgraphFormat(0)
title('W1');
subplot(1,4,3);
plot(-PiersAGrav.Walls.Dead.W2(:,2)/1000^2,PiersAGrav.Walls.Dead.W2(:,1),linetypes{1},...
    -PiersAGrav.Walls.Live.W2(:,2)/1000^2,PiersAGrav.Walls.Live.W2(:,1),linetypes{2})
etabsgraphFormat(0)
xlabel('Axial Force, P [MN]');
title('W2');
subplot(1,4,4);
plot(-PiersAGrav.Walls.Dead.W3(:,2)/1000^2,PiersAGrav.Walls.Dead.W3(:,1),linetypes{1},...
    -PiersAGrav.Walls.Live.W3(:,2)/1000^2,PiersAGrav.Walls.Live.W3(:,1),linetypes{2})
etabsgraphFormat(0)
title('W3');
suptitle('Gravity Loads')
legend('Dead','Live')