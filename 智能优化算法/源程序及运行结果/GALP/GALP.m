tallrecord = [];
bestfrecord = [];
bestGen = [];
bestFes = [];
avgResult = zeros(1,2000);
error = 10^-6;
success = 0;
allfile = fopen('totalLP.txt','w');
MAXRUN = 20; %�������Դ���
funfile = fopen('F1totalLP.txt','w');
for runcount = 1:MAXRUN
    fes = 0;
    NP = 100;
    L = 20;
    Pc = 0.8;
    Pm = 0.1;
    G = 2000;
    Xs = 20;
    Xx = -20;
    f = randi([0,1],NP,L);
    fprintf('��%d������\t��%d��\t��ʼ��Ⱥ%g\n',runcount,0,trace(1));
    avgResult(1) = avgResult(1)+trace(1);
    onerunfile = fopen(['F1_run_LP', num2str(runcount) '.txt'],'w'); %������run�����еļ�¼�ĵ�
    fprintf(onerunfile,'%d\t%d\t%g\r\n',0,fes,trace(1)); %д���0����Ⱥ���
    t0 = clock; %��¼��ǰʱ��
    tall = 0; %ͳ�Ƽ�������ʱ���ų�д�ļ���ʱ��
    for k=1:G %ѭ��
        if fes > 10^5
            break;
        end
        for i = 1:NP
            U = f(i,:);
            m = 0;
            for j = 1:L
                m = U(j)*2^(j-1)+m;
            end
            x(i) = Xx+m*(Xs-Xx)/(2^L-1);
            Fit(i) = func1(x(i));
            fes = fes+1;
        end
        maxFit = max(Fit);
        minFit = min(Fit);
        rr = find(Fit==minFit);
        fBest = f(rr(1,1),:);
        xBest = f(rr(1,1));
        Fit = (maxFit-Fit)/(maxFit-minFit);
        sum_Fit = sum(Fit);
        fitvalue = Fit./sum_Fit;
        fitvalue = cumsum(fitvalue);
        ms = sort(rand(NP,1));
        fiti = 1;
        newi = 1;
        while newi <= NP
            if (ms(newi)) < fitvalue(fiti)
                nf(newi,:) = f(fiti,:);
                newi = newi+1;
            else
                fiti = fiti+1;
            end
        end
        for i = 1:2:NP
            p = rand;
            if p < Pc
                q = randi([0,1],1,L);
                for j = 1:L
                    if q(j) == 1
                        temp = nf(i+1,j);
                        nf(i+1,j) = nf(i,j);
                        nf(i,j) = temp;
                    end
                end
            end
        end
        i = 1;
        while i <= round(NP*Pm)
            h = randi([1,NP],1,1);
            for j = 1:round(L*Pm)
                g = randi([1,L],1,1);
                nf(h,g) = ~nf(h,g);
            end
            i = i+1;
        end
        f = nf;
        f(1,:) = fBest;
        trace(k) = minFit;
        tall = tall + etime(clock,t0); %�ۼӼ�����ʱ����λ�룬�ų�д�ļ���ʱ��
        fprintf(onerunfile,'%d\t%d\t%g\r\n',k,fes,trace(k)); %д���gen�����
        t0 = clock; %��¼��ǰʱ��
        avgResult(k) = avgResult(k)+trace(k);
    end
    fclose(onerunfile);
    tallrecord = [tallrecord,tall];
    bestfrecord = [bestfrecord,trace(k)];
    bestGen = [bestGen,k];
    bestFes = [bestFes,fes];
    bestRecord = min(bestfrecord);
    bestUsedTime = min(tallrecord);
    countSize = size(bestfrecord);
    fprintf(funfile,'%d\t%g\t%g\r\n',runcount,trace(k),tall); %�����run����������ֵ����ʱ
    if trace(k) < error
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
num = 1;
avgfile = fopen('avgFile.txt','w');
for count = 100:100:100000
    fprintf(avgfile,'%d\t%g\r\n',count,avgResult(num)/20);
    num = num + 1;
end
MAXG = k;
percent = (success/MAXRUN)*100;
successPercent = [num2str(percent),'%'];
fprintf(allfile,'funName:%s\r\n','func1');
fprintf(allfile,'L:%d\tPc:%f\tPm:%f\tNP:%d\tG:%d\tMAXG:%d\tMAXRUN:%d\r\n',L,Pc,Pm,NP,G,MAXG,MAXRUN);
fprintf(allfile,'���ź���ֵ:%g\t����ֵ:%g\tƽ��ֵ:%g\t��׼��:%g\r\n',min(bestfrecord),max(bestfrecord),mean(bestfrecord),std(bestfrecord));
fprintf(allfile,'�ɹ���%s\tƽ������:%g\tƽ�����۴���:%g\tƽ����ʱ:%g\r\n\n',successPercent,mean(bestGen),mean(bestFes),mean(tallrecord));
fclose(allfile);