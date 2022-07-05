tallrecord = [];
bestfrecord = [];
bestGen = [];
bestFes = [];
avgResult = zeros(1,5753);
avgFes = zeros(1,5753);
error = 10^-6;
success = 0;
allfile = fopen('total.txt','w');
MAXRUN = 20; %独立测试次数
funfile = fopen('F1total.txt','w'); %w 改为a表示添加（w表示覆盖原有内容）
for runcount = 1:MAXRUN
    number = 1;
    fes = 0;
    D=10;                           %变量维数
    Xs=20;                          %上限
    Xx=-20;                         %下限
    %%%%%%%%%%%%%%%%%%%%%%%%%%%冷却表参数%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    L = 200;                        %马可夫链长度
    K = 0.998;                      %衰减参数
    S = 0.01;                       %步长因子
    T=100;                          %初始温度
    YZ = 1e-8;                      %容差
    P = 0;                          %Metropolis过程中总接受点
    %%%%%%%%%%%%%%%%%%%%%%%%%%随机选点 初值设定%%%%%%%%%%%%%%%%%%%%%%%%%
    PreX = rand(D,1)*(Xs-Xx)+Xx;
    PreBestX = PreX;
    PreX =  rand(D,1)*(Xs-Xx)+Xx;
    BestX = PreX;
    %%%%%%%%%%%每迭代一次退火一次(降温), 直到满足迭代条件为止%%%%%%%%%%%%
    deta=abs( func1( BestX)-func1(PreBestX));
    fes = fes+2;
    fprintf('第%d次运行\t第%d代\t%f\n',runcount,0,trace(2));
    onerunfile = fopen(['F1_run', num2str(runcount) '.txt'],'w');%建立第run次运行的记录文档
    avgResult(number) = avgResult(number)+trace(2);
    avgFes(number) = avgFes(number)+fes;
    number = number+1;
    fprintf(onerunfile,'%d\t%d\t%g\r\n',0,fes,trace(2)); %写入第0代种群结果
    t0 = clock; %记录当前时刻
    tall = 0; %统计计算总用时（排除写文件用时）
    while (deta > YZ) && (T>0.001)
        T=K*T;
        %%%%%%%%%%%%%%%%%%%%%在当前温度T下迭代次数%%%%%%%%%%%%%%%%%%%%%%
        for i=1:L
            %%%%%%%%%%%%%%%%%在此点附近随机选下一点%%%%%%%%%%%%%%%%%%%%%
            NextX = PreX + S* (rand(D,1) *(Xs-Xx)+Xx);
            %%%%%%%%%%%%%%%%%边界条件处理%%%%%%%%%%%%%%%%%%%%%%%%%%
            for ii=1:D
                if NextX(ii)>Xs | NextX(ii)<Xx
                    NextX(ii)=PreX(ii) + S* (rand *(Xs-Xx)+Xx);
                end
            end
            %%%%%%%%%%%%%%%%%%%%%%%是否全局最优解%%%%%%%%%%%%%%%%%%%%%%
            if (func1(BestX) > func1(NextX))
                %%%%%%%%%%%%%%%%%%保留上一个最优解%%%%%%%%%%%%%%%%%%%%%
                PreBestX = BestX;
                %%%%%%%%%%%%%%%%%%%此为新的最优解%%%%%%%%%%%%%%%%%%%%%%
                BestX=NextX;
            end
            %%%%%%%%%%%%%%%%%%%%%%%% Metropolis过程%%%%%%%%%%%%%%%%%%%
            if( func1(PreX) - func1(NextX) > 0 )
                %%%%%%%%%%%%%%%%%%%%%%%接受新解%%%%%%%%%%%%%%%%%%%%%%%%
                PreX=NextX;
                P=P+1;
                fes=fes+2;
            else
                changer = -1*(func1(NextX)-func1(PreX))/ T ;
                p1=exp(changer);
                %%%%%%%%%%%%%%%%%%%%%%%%接受较差的解%%%%%%%%%%%%%%%%%%%%
                if p1 > rand
                    PreX=NextX;
                    P=P+1;
                end
                fes=fes+2;
            end
            trace(P+1)=func1( BestX);
            fes=fes+1;
        end
        deta=abs( func1( BestX)-func1 (PreBestX));
        fes=fes+2;
		tall = tall + etime(clock,t0); %累加计算用时（单位秒，排除写文件用时）
        fprintf(onerunfile,'%d\t%d\t%g\r\n',P,fes,trace(P+1)); %写入第gen代结果
        t0 = clock; %记录当前时刻
        avgResult(number) = avgResult(number)+trace(P+1);
        avgFes(number) = avgFes(number)+fes;
        number = number+1;
    end
    fclose(onerunfile);
    tallrecord = [tallrecord,tall];
    bestfrecord = [bestfrecord,trace(P+1)];
    bestGen = [bestGen,P+1];
    bestFes = [bestFes,fes];
    bestRecord = min(bestfrecord);
    countSize = size(bestfrecord);
    fprintf(funfile,'%d\t%g\t%g\r\n',runcount,trace(P+1),tall);
    %输出第run次运行最优值和用时
    if trace(P+1) < error
        success = success+1;
    end
    index = find(bestfrecord == bestRecord);
    bestTime = tallrecord(index);
    bestG = bestGen(index);
    bestfes = bestFes(index);
    fprintf(funfile,'至今最优函数值:%g\t迭代数:%d\t评价次数：%d\t时间:%g\r\n',bestRecord,bestG,bestfes,bestTime);
end
avgfile = fopen('avgFile.txt','w');
for count = 1:5752
    avgF = avgFes(count)/MAXRUN;
    fprintf(avgfile,'%d\t%g\r\n',round(avgF),avgResult(count)/20);
end
fclose(avgfile);
fprintf(funfile,'\n');
fclose(funfile);
percent = (success/10)*100;
successPercent = [num2str(percent),'%'];
fprintf(allfile,'funName:%s\r\n','func1');
fprintf(allfile,'D:%d\tXx:%d\tXs:%d\tL:%d\tK:%f\tS:%f\tMAXRUN:%d\tT:%d\r\n',D,Xx,Xs,L,K,S,MAXRUN,T);
fprintf(allfile,'最优函数值:%g\t最差函数值:%g\t平均值:%g\t标准差:%g\r\n',min(bestfrecord),max(bestfrecord),mean(bestfrecord),std(bestfrecord));
fprintf(allfile,'成功率%s\t平均代数:%g\t平均评价次数:%g\t平均用时:%g\r\n\n',successPercent,mean(bestGen),mean(bestFes),mean(tallrecord));
fclose(allfile);