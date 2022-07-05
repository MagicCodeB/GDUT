tallrecord = [];
bestfrecord = [];
bestGen = [];
bestFes = [];
avgResult = zeros(1,5753);
avgFes = zeros(1,5753);
error = 10^-6;
success = 0;
allfile = fopen('total.txt','w');
MAXRUN = 20; %�������Դ���
funfile = fopen('F1total.txt','w'); %w ��Ϊa��ʾ��ӣ�w��ʾ����ԭ�����ݣ�
for runcount = 1:MAXRUN
    number = 1;
    fes = 0;
    D=10;                           %����ά��
    Xs=20;                          %����
    Xx=-20;                         %����
    %%%%%%%%%%%%%%%%%%%%%%%%%%%��ȴ�����%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    L = 200;                        %��ɷ�������
    K = 0.998;                      %˥������
    S = 0.01;                       %��������
    T=100;                          %��ʼ�¶�
    YZ = 1e-8;                      %�ݲ�
    P = 0;                          %Metropolis�������ܽ��ܵ�
    %%%%%%%%%%%%%%%%%%%%%%%%%%���ѡ�� ��ֵ�趨%%%%%%%%%%%%%%%%%%%%%%%%%
    PreX = rand(D,1)*(Xs-Xx)+Xx;
    PreBestX = PreX;
    PreX =  rand(D,1)*(Xs-Xx)+Xx;
    BestX = PreX;
    %%%%%%%%%%%ÿ����һ���˻�һ��(����), ֱ�������������Ϊֹ%%%%%%%%%%%%
    deta=abs( func1( BestX)-func1(PreBestX));
    fes = fes+2;
    fprintf('��%d������\t��%d��\t%f\n',runcount,0,trace(2));
    onerunfile = fopen(['F1_run', num2str(runcount) '.txt'],'w');%������run�����еļ�¼�ĵ�
    avgResult(number) = avgResult(number)+trace(2);
    avgFes(number) = avgFes(number)+fes;
    number = number+1;
    fprintf(onerunfile,'%d\t%d\t%g\r\n',0,fes,trace(2)); %д���0����Ⱥ���
    t0 = clock; %��¼��ǰʱ��
    tall = 0; %ͳ�Ƽ�������ʱ���ų�д�ļ���ʱ��
    while (deta > YZ) && (T>0.001)
        T=K*T;
        %%%%%%%%%%%%%%%%%%%%%�ڵ�ǰ�¶�T�µ�������%%%%%%%%%%%%%%%%%%%%%%
        for i=1:L
            %%%%%%%%%%%%%%%%%�ڴ˵㸽�����ѡ��һ��%%%%%%%%%%%%%%%%%%%%%
            NextX = PreX + S* (rand(D,1) *(Xs-Xx)+Xx);
            %%%%%%%%%%%%%%%%%�߽���������%%%%%%%%%%%%%%%%%%%%%%%%%%
            for ii=1:D
                if NextX(ii)>Xs | NextX(ii)<Xx
                    NextX(ii)=PreX(ii) + S* (rand *(Xs-Xx)+Xx);
                end
            end
            %%%%%%%%%%%%%%%%%%%%%%%�Ƿ�ȫ�����Ž�%%%%%%%%%%%%%%%%%%%%%%
            if (func1(BestX) > func1(NextX))
                %%%%%%%%%%%%%%%%%%������һ�����Ž�%%%%%%%%%%%%%%%%%%%%%
                PreBestX = BestX;
                %%%%%%%%%%%%%%%%%%%��Ϊ�µ����Ž�%%%%%%%%%%%%%%%%%%%%%%
                BestX=NextX;
            end
            %%%%%%%%%%%%%%%%%%%%%%%% Metropolis����%%%%%%%%%%%%%%%%%%%
            if( func1(PreX) - func1(NextX) > 0 )
                %%%%%%%%%%%%%%%%%%%%%%%�����½�%%%%%%%%%%%%%%%%%%%%%%%%
                PreX=NextX;
                P=P+1;
                fes=fes+2;
            else
                changer = -1*(func1(NextX)-func1(PreX))/ T ;
                p1=exp(changer);
                %%%%%%%%%%%%%%%%%%%%%%%%���ܽϲ�Ľ�%%%%%%%%%%%%%%%%%%%%
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
		tall = tall + etime(clock,t0); %�ۼӼ�����ʱ����λ�룬�ų�д�ļ���ʱ��
        fprintf(onerunfile,'%d\t%d\t%g\r\n',P,fes,trace(P+1)); %д���gen�����
        t0 = clock; %��¼��ǰʱ��
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
    %�����run����������ֵ����ʱ
    if trace(P+1) < error
        success = success+1;
    end
    index = find(bestfrecord == bestRecord);
    bestTime = tallrecord(index);
    bestG = bestGen(index);
    bestfes = bestFes(index);
    fprintf(funfile,'�������ź���ֵ:%g\t������:%d\t���۴�����%d\tʱ��:%g\r\n',bestRecord,bestG,bestfes,bestTime);
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
fprintf(allfile,'���ź���ֵ:%g\t����ֵ:%g\tƽ��ֵ:%g\t��׼��:%g\r\n',min(bestfrecord),max(bestfrecord),mean(bestfrecord),std(bestfrecord));
fprintf(allfile,'�ɹ���%s\tƽ������:%g\tƽ�����۴���:%g\tƽ����ʱ:%g\r\n\n',successPercent,mean(bestGen),mean(bestFes),mean(tallrecord));
fclose(allfile);