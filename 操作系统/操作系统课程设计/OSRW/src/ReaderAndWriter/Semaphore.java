package ReaderAndWriter;

public class Semaphore {//信号量Semaphore的PV操作类
    int count=0;//计数器初始化为0
    public Semaphore(int count){//构造器为带count数据的
        this.count=count;
    }
    public synchronized void p(){//编写信号量类下的p操作方法
        count--;
        if(count<0){//等于0则表示又一个进程进入了临界区
            try{
                this.wait();//进程进入阻塞队列，等待唤起
            }
            catch (InterruptedException e){
                e.printStackTrace();
            }
        }
    }
    public synchronized void v(){//编写信号量类下的v操作方法
        count++;
        if(count<=0){//如果有进程阻塞，则唤起该进程
            this.notify();
        }
    }
}
