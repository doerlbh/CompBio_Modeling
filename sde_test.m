clear all
% 
% set(0,'defaultTextFontSize',14)
% set(0,'DefaultAxesFontSize',14)
% 
% Ntrials=10000;
% 
% h=0.001;
% numsteps=round(1/h);
% 
% alpha=1/2;
% 
% xlist=[];
% 
% for N=1:Ntrials
%     x=0;
%     
%     for j=1:numsteps
%     x=x+randn*h^alpha;
%     end
%     
%     xlist=[xlist x];
%     
% end
% 
% 
% figure
% hist(xlist,100);
% title(sprintf('Stepsize=%g',h))


clear all

set(0,'defaultTextFontSize',14)
set(0,'DefaultAxesFontSize',14)

Ntrials=10000;

h=0.001;
xall=[];

for h = 0.001:0.01:1
    numsteps=round(1/h);
    
    % alpha=1/2;
    alpha=1;
    
    xlist=[];
    
    for N=1:Ntrials
        x=0;
        
        for j=1:numsteps
            x=x+randn*h^alpha;
        end
        
        xlist=[xlist x];
        if N == 1
            xall = [xlist];
        else
            xall = [xall; xlist];
        end
        
    end
    
end

figure
 hist(xall,100, 'color', rand(1,3));
    
    % hist(xlist,100, 'color', rand(1,3));
    title(sprintf('Stepsize=%g',h)); hold on