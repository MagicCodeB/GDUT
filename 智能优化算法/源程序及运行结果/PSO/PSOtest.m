tallrecord = [];
bestfrecord = [];
bestT = [];
bestFes = [];
avgResult = zeros(1,201);
avgFes = zeros(1,201);
error = 10^-6;
success = 0;
allfile = fopen('total.txt','w');
MAXRUN = 20; %独立测试次数
funfile = fopen('F1total.txt','w'); %w 改为a表示添加（w表示覆盖原有内容）
for runcount = 1:MAXRUN
    N = 100;
    D = 10;
    T = 200;
    c1 = 1.5;
    c2 = 1.5;
    w = 0.8;
    Xmax = 20;
    Xmin = -20;
    Vmax = 10;
    Vmin = -10;
    fes = 0;
    x = rand(N,D) * (Xmax-Xmin)+Xmin;
    v = rand(N,D) * (Vmax-Vmin)+Vmin;
    p = x;
    pbest = ones(N,1);
    for i = 1:N
        pbest(i) = func1(x(i,:));
        fes = fes + 1;
    end
    g = ones(1,D);
    gbest = inf;
    for i = 1:N
        if (pbest(i) < gbest)
            g = p(i,:);
            gbest = pbest(i);
        end
    end
    gb = ones(1,T);
    fprintf('第%d次运行\t第%d代\t%f\n',runcount,0,gbest);
    avgResult(1) = avgResult(1)+gbest;
    avgFes(1) = avgFes(1)+fes;
    onerunfile = fopen(['F1_run', num2str(runcount) '.txt'],'w');
    fprintf(onerunfile,'%d\t%d\t%g\r\n',0,fes,gbest);
    t0 = clock;
    tall = 0;
    for i = 1:T
        for j = 1:N
            if (func1(x(j,:)) < pbest(j))
                p(j,:) = x(j,:);
                pbest(j) = func1(x(j,:));
                fes = fes + 1;
            end
            if (pbest(j) < gbest)
                g = p(j,:);
                gbest = pbest(j);
            end
            v(j,:) = w*v(j,:)+c1*rand*(p(j,:)-x(j,:))...
                +c2*rand*(g-x(j,:));
            x(j,:) = x(j,:)+v(j,:);
            for ii = 1:D
                if (v(j,ii) > Vmax) | (v(j,ii) < Vmin)
                    v(j,ii) = rand*(Vmax-Vmin)+Vmin;
                end
                if (x(j,ii) > Xmax) | (x(j,ii) < Xmin)
                    x(j,ii) = rand*(Xmax-Xmin)+Xmin;
                end
            end
        end
        gb(i) = gbest;
        tall = tall + etime(clock,t0); %累加计算用时（单位秒，排除写文件用时）
        fprintf(onerunfile,'%d\t%d\t%g\r\n',i,fes,gbest); %写入第gen代结果
        t0 = clock; %记录当前时刻
        avgResult(i) = avgResult(i)+gb(i);
        avgFes(i) = avgFes(i)+fes;
    end
    fclose(onerunfile);
    tallrecord = [tallrecord,tall];
    bestfrecord = [bestfrecord,gbest];
    bestT = [bestT,T];
    bestFes = [bestFes,fes];
    bestRecord = min(bestfrecord);
    countSize = size(bestfrecord);
    fprintf(funfile,'%d\t%g\t%g\r\n',runcount,gb(i),tall); %输出第run次运行最优值和用时
    if gb(i) < error
        success = success+1;
    end
    index = find(bestfrecord == bestRecord);
    bestTime = tallrecord(index);
    bestTen = bestT(index);
    bestfes = bestFes(index);
    fprintf(funfile,'至今最优函数值:%g\t迭代数:%d\t评价次数：%d\t时间:%g\r\n',bestRecord,bestTen,bestfes,bestTime);
end
avgfile = fopen('avgFile.txt','w');
for count = 1:200
    numFes = avgFes(count)/MAXRUN;
    fprintf(avgfile,'%d\t%g\r\n',round(numFes),avgResult(count)/20);
end
fprintf(funfile,'\n');
fclose(funfile);
percent = (success/MAXRUN)*100;
successPercent = [num2str(percent),'%'];
fprintf(allfile,'funName:%s\r\n','func1');
fprintf(allfile,'N:%d\tD:%d\tT:%d\tc1:%f\tc2:%f\r\n',N,D,T,c1,c2);
fprintf(allfile,'w:%d\tXmax:%d\tXmin:%d\tVmax:%d\tVmin:%f\r\n',w,Xmax,Xmin,Vmax,Vmin);
fprintf(allfile,'最优函数值:%g\t最差函数值:%g\t平均值:%g\t标准差:%g\r\n',min(bestfrecord),max(bestfrecord),mean(bestfrecord),std(bestfrecord));
fprintf(allfile,'成功率%s\t平均代数:%g\t平均评价次数:%g\t平均用时:%g\r\n\n',successPercent,mean(bestT),mean(bestFes),mean(tallrecord));
fclose(allfile);