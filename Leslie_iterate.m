% iterates Leslie matrix

n_zero=[10 100 500]' ;

% A=[0  1 5 ;
%   .5  0 0 ;
%   0 .25 0 ];
%
% A=[0  5 0 ;
%     0 0 1 ;
%     0.25 0 0 ];

% Bernadilli Population Wave
% Fecundity concentrated at just 1 age
% "intuition" wave repeats
% Failure of power-pos can give nontrivial dynamics (osc etc.)
% but does not have to 
% sufficent, not necessary
A=[ 0  5 0 ;
    0.2 0 0 ;
    0 0.25 0 ];

% if we have single dom eigenvalue lamda, then n(t) ! e_1 w(lamda_1)^t
% w gives stable stage distribution 
% relative counts in each stage as t --> infinity

Tmax=200;

n_vs_t=zeros(3,Tmax);

n_vs_t(:,1)=n_zero ;

for t=2:Tmax;
    n_vs_t(:,t)=A*n_vs_t(:,t-1) ;
end

figure
set(gca,'FontSize',20)
plot(1:Tmax,n_vs_t','.-','MarkerSize',14)
xlabel('t','FontSize',20)
ylabel('n','FontSize',20)
legend('n1','n2','n3')


figure
set(gca,'FontSize',20)
plot(1:Tmax,log(n_vs_t'),'.-','MarkerSize',14)
xlabel('t','FontSize',20)
ylabel('log(n)','FontSize',20)

%Fit log n_0(t) to a straight line
p=polyfit(25:Tmax,log(n_vs_t(1,25:Tmax)),1)
lambda_estimate=exp(p(1))

