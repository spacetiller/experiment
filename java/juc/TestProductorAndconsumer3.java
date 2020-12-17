import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

//生产消费模式是等待唤醒机制的一个经典案例
public class TestProductorAndconsumer3 {
    public static void main(String[] args){
        Clerk clerk = new Clerk();
        Productor productor = new Productor(clerk);
        Consumer consumer = new Consumer(clerk);
        new Thread(productor,"生产者A").start();
        new Thread(consumer,"消费者B").start();
        new Thread(productor,"生产者C").start();
        new Thread(consumer,"消费者D").start();
    }
}
//店员
class Clerk {
    private int product = 0;//共享数据
    private Lock lock = new ReentrantLock();//创建锁对象
    private Condition condition = lock.newCondition();//获取condition实例
    public  void get() { //进货
        lock.lock();//上锁
        try {
            while (product >= 1) {
                System.out.println("产品已满");
                try {
                    condition.await();//满了就等待
                } catch (InterruptedException e) {
                }
            }
            System.out.println(Thread.currentThread().getName() + ":" + (++product));
            condition.signalAll();//没满就可以进货
        }finally {
            lock.unlock();//释放锁
        }
    }

    public  void sell() {//卖货
        lock.lock();//上锁
        try {
            while (product <= 0) {
                System.out.println("缺货");
                try {
                    condition.await();//缺货就等待
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
            System.out.println(Thread.currentThread().getName() + ":" + (--product));
            condition.signalAll();//不缺货就可以卖
        }finally {
            lock.unlock();//释放锁
        }
    }
}
//生产者
class Productor implements Runnable{
    private Clerk clerk;
    public Productor(Clerk clerk){
        this.clerk = clerk;
    }
    @Override
    public void run() {
        for (int i = 0;i<20;i++){
            clerk.get();
        }
    }
}
//消费者
class Consumer implements Runnable{
    private Clerk clerk;
    public Consumer(Clerk clerk){
        this.clerk = clerk;
    }
    @Override
    public void run() {
	    try {
            Thread.sleep(200);//睡0.2秒
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        for (int i = 0;i<20;i++){
            clerk.sell();
        }
    }
}
