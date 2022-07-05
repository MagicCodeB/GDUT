clear all;
close all;
clc;
C = [1304 2312;3639 1315; 4177 2244;3712 1399;3488 1535;3326 2556;...
    3238 1229;4196 1044;4312 790;4386 570;3007 1970;2562 1756;...
    2788 1491;2381 1676;1332 695;3715 1678;3918 2179;4061 2370;...
    3780 2212;3676 2578;4029 2838;4263 2931;3429 1908;3507 2376;...
    3394 2643;3439 3201;2935 3240;3140 3550;2545 2357;2778 2826;...
    2370 2975];
N = size(C,1)
D = zeros(N);
for i = 1:N
    for j = 1:N
         D(i,j) = ((C(i,1)-C(j,1))^2+(C(i,2)-C(j,2))^2)^0.5;
    end
end
NP = 200;
G = 1000;
f = zeros(N,NP)
for i = 1:NP
    f(:,i) = randperm(N);
end
len = zeros(NP,1);
for i = 1:NP
    len(i) = func1(D,f(:,i),N);
end
[Sortlen,Index] = sort(len);
Sortf = f(:,Index);
gen = 0;
Ncl = 10;
while gen < G
    for i = 1:NP/2
        a = Sortf(:,i);
        Ca = repmat(a,1,Ncl);
        for j = 1:Ncl
            p1 = floor(1+N*rand());
            p2 = floor(1+N*rand());
            while p1==p2
                p1 = floor(1+N*rand());
                p2 = floor(1+N*rand());
            end
            tmp = Ca(p1,j);
            Ca(p1,j) = Ca(p2,j);
            Ca(p2,j) = tmp;
        end
        Ca(:,1) = Sortf(:,i);
        for j = 1:Ncl
            Calen(j) = func1(D,Ca(:,j),N);
        end
        [SortCalen,Index] = sort(Calen);
        SortCa = Ca(:,Index);
        af(:,i) = SortCa(:,1);
        alen(i) = SortCalen(1);
    end
    for i = 1:NP/2
        bf(:,i) = randperm(N);
        blen(i) = func1(D,bf(:,i),N);
    end
    f = [af,bf];
    len = [alen;blen];
    [Sortlen,Index] = sort(len);
    Sortf = f(:,Index);
    gen = gen+1;
    trace(gen) = Sortlen(1);
end
Bestf = Sortf(:,1);
Besrlen = trace(end);
figure
for i = 1:N-1
    plot([C(Bestf(i),1),C(Bestf(i+1),1)],...
        [C(Bestf(i),2),C(Bestf(i+1),2)],'bo-');
    hold on;
end
plot([C(Bestf(N),1),C(Bestf(1),1)],...
        [C(Bestf(N),2),C(Bestf(1),2)],'ro-');
title(['优化最短距离:',num2str(trace(end))]);
figure,plot(trace)
xlabel('迭代次数');
ylabel('目标函数值');
title('亲和度进化曲线');