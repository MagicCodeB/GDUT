tallrecord = [];
bestfrecord = [];
bestT = [];
bestFes = [];
avgResult = zeros(1,201);
avgFes = zeros(1,201);
error = 10^-6;
success = 0;
allfile = fopen('total.txt','w');
MAXRUN = 20; %�������Դ���
funfile = fopen('F1total.txt','w'); %w ��Ϊa��ʾ��ӣ�w��ʾ����ԭ�����ݣ�
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
    fprintf('��%d������\t��%d��\t%f\n',runcount,0,gbest);
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
        tall = tall + etime(clock,t0); %�ۼӼ�����ʱ����λ�룬�ų�д�ļ���ʱ��
        fprintf(onerunfile,'%d\t%d\t%g\r\n',i,fes,gbest); %д���gen�����
        t0 = clock; %��¼��ǰʱ��
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
    fprintf(funfile,'%d\t%g\t%g\r\n',runcount,gb(i),tall); %�����run����������ֵ����ʱ
    if gb(i) < error
        success = success+1;
    end
    index = find(bestfrecord == bestRecord);
    bestTime = tallrecord(index);
    bestTen = bestT(index);
    bestfes = bestFes(index);
    fprintf(funfile,'�������ź���ֵ:%g\t������:%d\t���۴�����%d\tʱ��:%g\r\n',bestRecord,bestTen,bestfes,bestTime);
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
fprintf(allfile,'���ź���ֵ:%g\t����ֵ:%g\tƽ��ֵ:%g\t��׼��:%g\r\n',min(bestfrecord),max(bestfrecord),mean(bestfrecord),std(bestfrecord));
fprintf(allfile,'�ɹ���%s\tƽ������:%g\tƽ�����۴���:%g\tƽ����ʱ:%g\r\n\n',successPercent,mean(bestT),mean(bestFes),mean(tallrecord));
fclose(allfile);