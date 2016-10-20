% Cornell part 3
% Baihan Lin

rand;
rand('state',sum(100*clock));

n = 100;
r_vector = rand(1,n);
plot([1:n],r_vector);

M=10000;

%% uniform case

sample_list=rand(1,M);

[nlist,centerlist]=hist(sample_list, 100);
deltac=centerlist(2)-centerlist(1);

figure
bar(centerlist,nlist/(M*deltac));

%% Gaussian case

sample_list=randn(1,M);

[nlist,centerlist]=hist(sample_list, 100);
deltac=centerlist(2)-centerlist(1);

figure
bar(centerlist,nlist/(M*deltac));

%% within range

Pw = Pwithin(0.5, 0.6, deltac, sample_list);


