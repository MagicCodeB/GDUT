tallrecord = [];
bestfrecord = [];
bestGen = [];
bestFes = [];
avgResult = zeros(1,1001);
error = 10^-6;
success = 0;
allfile = fopen('totalDE.txt','w');
MAXRUN = 20; %�������Դ���
funfile = fopen('F1totalDE.txt','w'); %w ��Ϊa��ʾ��ӣ�w��ʾ����ԭ�����ݣ�
avgfile = fopen('avgFileDE.txt','w');
for runcount = 1:MAXRUN
    index = 1;
    fes = 0;
    NP = 50;
    D = 10;
    G = 4000;
    F0 = 0.4;
    CR = 0.1;
    Xs = 20;
    Xx = -20;
    yz = 10^-6;
    x = zeros(D,NP);
    v = zeros(D,NP);
    u = zeros(D,NP);
    x = rand(D,NP)*(Xs-Xx)+Xx;
    for m = 1:NP
        Ob(m) = func1(x(:,m));
        fes = fes + 1;
    end
    trace(1) = min(Ob);
    fprintf('��%d������\t��%d��\t%f\n',runcount,0,trace(1));
    avgResult(1) = avgResult(1)+trace(1);
    onerunfile = fopen(['F1_DE_run', num2str(runcount) '.txt'],'w'); %������run�����еļ�¼�ĵ�
    fprintf(onerunfile,'%d\t%d\t%g\r\n',0,fes,trace(1)); %д���0����Ⱥ���
    t0 = clock; %��¼��ǰʱ��
    tall = 0; %ͳ�Ƽ�������ʱ���ų�д�ļ���ʱ��
    gen = 1;
    while fes<=10^5 %��ֽ���ѭ��
        for m = 1:NP
            r1 = randi([1,NP],1,1);
            while (r1==m)
                r1 = randi([1,NP],1,1);
            end
            r2 = randi([1,NP],1,1);
            while (r2==m) | (r2==r1)
                r2 = randi([1,NP],1,1);
            end
            r3 = randi([1,NP],1,1);
            while (r3==m) | (r3==r2) | (r3==r1)
                r3 = randi([1,NP],1,1);
            end
            v(:,m) = x(:,r1)+F0*(x(:,r2)-x(:,r3));
        end
        r = randi([1,D],1,1);
        for n = 1:D
            cr = rand(1);
            if (cr <= CR) | (n==r)
                u(n,:) = v(n,:);
            else
                u(n,:) = x(n,:);
            end
        end
        for n = 1:D
            for m = 1:NP 
                if (u(n,m) < Xx) | (u(n,m) > Xs)
                    u(n,m) = rand*(Xs-Xx)+Xx;
                end
            end
        end
        for m = 1:NP
            Ob1(m) = func1(u(:,m));
            fes = fes + 1;
        end
        for m = 1:NP 
            if Ob1(m) < Ob(m)
                x(:,m) = u(:,m);
            end
        end
        for m = 1:NP 
            Ob(m) = func1(x(:,m));
            fes = fes + 1;
        end
        trace(gen+1) = min(Ob);
        %if min(Ob(m)) < yz
            %break
        %end 
        tall = tall + etime(clock,t0); %�ۼӼ�����ʱ����λ�룬�ų�д�ļ���ʱ��
        fprintf(onerunfile,'%d\t%d\t%g\r\n',gen,fes,trace(gen+1)); %д���gen�����
        t0 = clock; %��¼��ǰʱ��
        gen = gen + 1; 
        avgResult(gen) = avgResult(gen)+trace(gen);
    end
    fclose(onerunfile); 
    tallrecord = [tallrecord,tall];
    bestfrecord = [bestfrecord,trace(gen+1)];
    bestGen = [bestGen,G];
    bestFes = [bestFes,fes];
    bestRecord = min(bestfrecord);
    bestUsedTime = min(tallrecord);
    countSize = size(bestfrecord);
    fprintf(funfile,'%d\t%g\t%g\r\n',runcount,trace(gen+1),tall); %�����run����������ֵ����ʱ
    if trace(gen+1) < error 
        success = success+1;
    end
    index = find(bestfrecord == bestRecord & bestUsedTime == tallrecord,1);
    bestTime = tallrecord(index);
    bestG = bestGen(index);
    bestfes = bestFes(index);
    fprintf(funfile,'�������ź���ֵ:%g\t������:%d\t���۴�����%d\tʱ��:%g\r\n',bestRecord,bestG,bestfes,bestTime);
end
fprintf(funfile,'\n');
fclose(funfile);
MAXG = G;
num = 1;
for count = 50:100:100050
    fprintf(avgfile,'%d\t%g\r\n',count,avgResult(num)/20);
    num = num + 1;
end
percent = (success/MAXRUN)*100;
successPercent = [num2str(percent),'%'];
fprintf(allfile,'funName:%s\r\n','func1');
fprintf(allfile,'D:%d\tF0:%g\tCR:%g\tNP:%d\tG:%d\tMAXG:%d\tMAXRUN:%d\r\n',D,F0,CR,NP,G,MAXG,MAXRUN);
fprintf(allfile,'���ź���ֵ:%g\t����ֵ:%g\tƽ��ֵ:%g\t��׼��:%g\r\n',min(bestfrecord),max(bestfrecord),mean(bestfrecord),std(bestfrecord));
fprintf(allfile,'�ɹ���%s\tƽ������:%g\tƽ�����۴���:%g\tƽ����ʱ:%g\r\n\n',successPercent,mean(bestGen),mean(bestFes),mean(tallrecord));
fclose(allfile);