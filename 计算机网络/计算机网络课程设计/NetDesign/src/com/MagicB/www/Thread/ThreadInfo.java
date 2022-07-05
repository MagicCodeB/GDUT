package com.MagicB.www.Thread;


import java.util.concurrent.Executors;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.ThreadPoolExecutor.AbortPolicy;
import java.util.concurrent.TimeUnit;

public class ThreadInfo {
    private static ThreadPool threadPool;
    //线程池
    public static class ThreadPool{
        private int coreThreadCount;//核心线程数
        private int maxThreadCount;//最大线程数
        private long KeepAliveTime;//线程活跃时间

        private ThreadPoolExecutor executor;

        private ThreadPool(int coreThreadCount,int maxThreadCount,long KeepAliveTime){
            this.coreThreadCount=coreThreadCount;
            this.maxThreadCount=maxThreadCount;
            this.KeepAliveTime=KeepAliveTime;
        }

        public void execute(Runnable runnable){
            if (executor == null) {
                executor = new ThreadPoolExecutor(coreThreadCount,
                        maxThreadCount, KeepAliveTime, TimeUnit.SECONDS,
                        new LinkedBlockingQueue<Runnable>(),
                        Executors.defaultThreadFactory(), new AbortPolicy());
            }
            executor.execute(runnable);
        }
    }

    public static ThreadPool getThreadPool(){
        if(threadPool==null){
            synchronized (ThreadInfo.class){
                if(threadPool==null){
                    int threadCount=10;
                    threadPool=new ThreadPool(threadCount,threadCount, 0l);
                }
            }
        }
        return threadPool;
    }
}
