function etabsgraphFormat(gorder)
set(gca,'YTick',[-16520 0 29480 57280 90150])
if gorder
    
    Ylabel = {'Base','Ground','L10','L20','PH'};
    
else
    Ylabel = {'','','','',''};
end
set(gca,'YTickLabel',Ylabel);
ylim([-16520 95150])
grid on;