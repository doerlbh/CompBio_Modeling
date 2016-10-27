ulist=0:.2:4;
vlist=0:.2:4;

[umatrix,vmatrix]=meshgrid(ulist,vlist);

dudt_matrix=zeros(size(umatrix));
dvdt_matrix=zeros(size(vmatrix));

%SET PARAMETERS
a=2;
b=3;
Ibar=1;
p=[a,b,Ibar];

for i=1:length(vlist)
    for j=1:length(ulist)
    dxdt=toggle2_odefun_with_constant_input(0,[umatrix(i,j);vmatrix(i,j)],p);
    dudt_matrix(i,j)=dxdt(1);
    dvdt_matrix(i,j)=dxdt(2);
    end
end

%PLOT DIRECTION FIELD

figure
set(gca,'FontSize',16)
quiver(umatrix,vmatrix,dudt_matrix,dvdt_matrix); hold on
xlabel('u','FontSize',20);ylabel('v','FontSize',20)


%PLOT NULLCLINES
vlist_for_u_nullcline=a./(1+vlist.^b) ;
ulist_for_v_nullcline=a./(1+ulist.^b)+Ibar ;

plot(ulist,vlist_for_u_nullcline,':','Linewidth',2);
plot(ulist_for_v_nullcline,vlist,'Linewidth',2);

axis([0 max(ulist)+.2 0 max(vlist)+.2])

