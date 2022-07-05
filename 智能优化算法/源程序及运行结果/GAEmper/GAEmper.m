tallrecord = [];
bestfrecord = [];
bestGen = [];
bestFes = [];
avgResult = zeros(1,1000);
error = 0.0010407;
success = 0;
allfile = fopen('total.txt','w');
MAXRUN = 20; %独立测试次数
funfile = fopen('F1total.txt','w'); %w 改为a表示添加（w表示覆盖原有内容）
for runcount = 1:MAXRUN
    fes = 0;
    D = 10;
    NP = 100;
    Xs = 20;
    Xx = -20;
    G = 1000;
    f = zeros(D,NP);
    nf = zeros(D,NP);
    Pc = 0.8;
    Pm = 0.1;
    f = rand(D,NP)*(Xs-Xx)+Xx;
    for np = 1:NP
        FIT(np) = func1(f(:,np));
        fes = fes+1;
    end
    [SortFIT,Index] = sort(FIT);
    Sortf = f(:,Index);
    fprintf('第%d次运行\t第%d代\t初始种群%g\n',runcount,0,trace(1));
    avgResult(1) = avgResult(1)+trace(1);
    onerunfile = fopen(['F1_run', num2str(runcount) '.txt'],'w'); %建立第run次运行的记录文档
    fprintf(onerunfile,'%d\t%d\t%g\r\n',0,fes,trace(1)); %写入第0代种群结果
    t0 = clock; %记录当前时刻
    tall = 0; %统计计算总用时（排除写文件用时）
    for gen=1:G %差分进化循环
        if fes > 10^5
            break;
        end
        Emper = Sortf(:,1);
        NoPoint = round(D*Pc);
        PoPoint = randi([1,D],NoPoint,NP/2);
        nf = Sortf;
        for i = 1:NP/2
            nf(:,2*i-1)= Emper;
            nf(:,2*i) = Sortf(:,2*i);
            for k = 1:NoPoint
                nf(PoPoint(k,i),2*i-1) = nf(PoPoint(k,i),2*i);
                nf(PoPoint(k,i),2*i) = Emper(PoPoint(k,i));
            end
        end
        for m = 1:NP
            for n = 1:D
                r = rand(1,1);
                if  r < Pm
                    nf(n,m) = rand(1,1)*(Xs-Xx)+Xx;
                end
            end
        end
        for np = 1:NP
            NFIT(np) = func1(nf(:,np));
            fes = fes+1;
        end
        [NSortFIT,Index] = sort(NFIT);
        NSortf = nf(:,Index);
        f1 = [Sortf,NSortf];
        FIT1= [SortFIT,NSortFIT];
        [SortFIT1,Index] = sort(FIT1);
        Sortf1 = f1(:,Index);
        SortFIT = SortFIT1(1:NP);
        Sortf = Sortf1(:,1:NP);
        trace(gen) = SortFIT(1);
        tall = tall + etime(clock,t0); %累加计算用时（单位秒，排除写文件用时）
        fprintf(onerunfile,'%d\t%d\t%g\r\n',gen,fes,trace(gen)); %写入第gen代结果
        t0 = clock; %记录当前时刻
        avgResult(gen) = avgResult(gen)+trace(gen);
    end
    fclose(onerunfile); 
    tallrecord = [tallrecord,tall];
    bestfrecord = [bestfrecord,trace(gen)];
    bestGen = [bestGen,gen];
    bestFes = [bestFes,fes];
    bestRecord = min(bestfrecord);
    countSize = size(bestfrecord);
    fprintf(funfile,'%d\t%g\t%g\r\n',runcount,trace(gen),tall); %输出第run次运行最优值和用时
    if trace(gen) < error 
        success = success+1;
    end
    index = find(bestfrecord == bestRecord);
    bestTime = tallrecord(index);
    bestG = bestGen(index);
    bestfes = bestFes(index);
    fprintf(funfile,'至今最优函数值:%g\t迭代数:%d\t评价次数：%d\t时间:%g\r\n',bestRecord,bestG,bestfes,bestTime);
end
num = 1;
avgfile = fopen('avgFile.txt','w');
for count = 100:100:100000
    fprintf(avgfile,'%d\t%g\r\n',count,avgResult(num)/20);
    num = num + 1;
end
fclose(avgfile);
fprintf(funfile,'\n');
fclose(funfile);
MAXG = gen;
percent = (success/MAXRUN)*100;
successPercent = [num2str(percent),'%'];
fprintf(allfile,'funName:%s\r\n','func1');
fprintf(allfile,'D:%d\tPc:%f\tPm:%f\tNP:%d\tG:%d\tMAXG:%d\tMAXRUN:%d\r\n',D,Pc,Pm,NP,G,MAXG,MAXRUN);
fprintf(allfile,'最优函数值:%g\t最差函数值:%g\t平均值:%g\t标准差:%g\r\n',min(bestfrecord),max(bestfrecord),mean(bestfrecord),std(bestfrecord));
fprintf(allfile,'成功率%s\t平均代数:%g\t平均评价次数:%g\t平均用时:%g\r\n\n',successPercent,mean(bestGen),mean(bestFes),mean(tallrecord));
fclose(allfile);