tallrecord = [];
bestfrecord = [];
bestGen = [];
bestFes = [];
avgResult = zeros(1,201);
error = 10^-6;
success = 0;
allfile = fopen('total.txt','w');
MAXRUN = 20; %�������Դ���
funfile = fopen('F1total.txt','w'); %w ��Ϊa��ʾ��ӣ�w��ʾ����ԭ�����ݣ�
for runcount = 1:MAXRUN
    index = 1;
    fes = 0;
    D = 10;
    NP = 100;
    Xs = 20;
    Xx = -20;
    G = 500;
    pm = 0.7;
    alfa = 1;
    belta = 1;
    detas = 1;
    gen = 0;
    Ncl = 10;
    deta0 = 1*Xs;
    f = rand(D,NP)*(Xs-Xx)+Xx;
    for np = 1:NP
        FIT(np) = func1(f(:,np));
        fes = fes+1;
    end
    for np = 1:NP
        for j = 1:NP
            nd(j) = sum(sqrt((f(:,np)-f(:,j)).^2));
            if nd(j) < detas
                nd(j) = 1;
            else
                nd(j) = 0;
            end
        end
        ND(np) = sum(nd)/NP;
    end
    FIT = alfa*FIT-belta*ND;
    [SortFIT,Index] = sort(FIT);
    Sortf = f(:,Index);
    fprintf('��%d������\t��%d��\t%f\n',runcount,0,trace(1));
    avgResult(1) = avgResult(1)+trace(1);
    onerunfile = fopen(['F1_run', num2str(runcount) '.txt'],'w'); %������run�����еļ�¼�ĵ�
    fprintf(onerunfile,'%d\t%d\t%g\r\n',0,fes,trace(1)); %д���0����Ⱥ���
    t0 = clock; %��¼��ǰʱ��
    tall = 0; %ͳ�Ƽ�������ʱ���ų�д�ļ���ʱ��
    while gen < G %��ֽ���ѭ��
        if fes > 10^5
            break;
        end
        for i = 1:NP/2
            a = Sortf(:,i);
            Na = repmat(a,1,Ncl);
            deta = deta0/gen;
            for j = 1:Ncl
                for ii = 1:D
                    if rand < pm
                        Na(ii,j) = Na(ii,j)+(rand-0.5)*deta;
                    end
                    if (Na(ii,j) > Xs) | (Na(ii,j) < Xx)
                        Na(ii,j) = rand*(Xs-Xx)+Xx;
                    end
                end
            end
            Na(:,1) = Sortf(:,i);
            for j = 1:Ncl
                NaFIT(j) = func1(Na(:,j));
                fes = fes+1;
            end
            [NaSortFIT,Index] = sort(NaFIT);
            aFIT(i) = NaSortFIT(1);
            NaSortf = Na(:,Index);
            af(:,i) = NaSortf(:,1);
        end
        for np = 1:NP/2
            for j = 1:NP/2
                nda(j) = sum(sqrt((af(:,np)-af(:,j)).^2));
                if nda(j) < detas
                    nda(j) = 1;
                else
                    nda(j) = 0;
                end
            end
            aND(np) = sum(nda)/NP/2;
        end
        aFIT = alfa*aFIT-belta*aND;
        bf = rand(D,NP/2)*(Xs-Xx)+Xx;
        for np = 1:NP/2
            bFIT(np) = func1(bf(:,np));
        end
        for np = 1:NP/2
            for j = 1:NP/2
                ndc(j) = sum(sqrt((bf(:,np)-bf(:,j)).^2));
                if ndc(j) < detas
                    ndc(j) = 1;
                else
                    ndc(j) = 0;
                end
            end
            bND(np) = sum(ndc)/NP/2;
        end
        bFIT = alfa*bFIT-belta*bND;
        f1 = [af,bf];
        FIT1 = [aFIT,bFIT];
        [SortFIT,Index] = sort(FIT1);
        Sortf = f1(:,Index);
        gen = gen +1;
        trace(gen) = func1(Sortf(:,1));
        tall = tall + etime(clock,t0); %�ۼӼ�����ʱ����λ�룬�ų�д�ļ���ʱ��
        fprintf(onerunfile,'%d\t%d\t%g\r\n',gen,fes,trace(gen)); %д���gen�����
        t0 = clock; %��¼��ǰʱ��
        avgResult(gen) = avgResult(gen)+trace(gen);
    end
    fclose(onerunfile);
    tallrecord = [tallrecord,tall];
    bestfrecord = [bestfrecord,trace(gen)];
    bestGen = [bestGen,G];
    bestFes = [bestFes,fes];
    bestRecord = min(bestfrecord);
    countSize = size(bestfrecord);
    fprintf(funfile,'%d\t%g\t%g\r\n',runcount,trace(gen),tall); %�����run����������ֵ����ʱ
    if trace(gen) < error
        success = success+1;
    end
    index = find(bestfrecord == bestRecord);
    bestTime = tallrecord(index);
    bestG = bestGen(index);
    bestfes = bestFes(index);
    fprintf(funfile,'�������ź���ֵ:%g\t������:%d\t���۴�����%d\tʱ��:%g\r\n',bestRecord,bestG,bestfes,bestTime);
end
num = 1;
avgfile = fopen('avgFile.txt','w');
for count = 100:500:100100
    fprintf(avgfile,'%d\t%g\r\n',count,avgResult(num)/20);
    num = num + 1;
end
fprintf(funfile,'\n');
fclose(funfile);
MAXG = gen;
percent = (success/MAXRUN)*100;
successPercent = [num2str(percent),'%'];
fprintf(allfile,'funName:%s\r\n','func1');
fprintf(allfile,'D:%d\tpm:%g\tdetas:%g\tNP:%d\tG:%d\tMAXG:%d\tMAXRUN:%d\talfa:%d\tbelta:%d\tNcl:%d\tdeta0:%d\r\n',D,pm,detas,NP,G,MAXG,MAXRUN,alfa,belta,Ncl,deta0);
fprintf(allfile,'���ź���ֵ:%g\t����ֵ:%g\tƽ��ֵ:%g\t��׼��:%g\r\n',min(bestfrecord),max(bestfrecord),mean(bestfrecord),std(bestfrecord));
fprintf(allfile,'�ɹ���%s\tƽ������:%g\tƽ�����۴���:%g\tƽ����ʱ:%g\r\n\n',successPercent,mean(bestGen),mean(bestFes),mean(tallrecord));
fclose(allfile);