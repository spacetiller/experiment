//生产消费模式是等待唤醒机制的一个经典案例
public class TestProductorAndconsumer2 {
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
class Clerk{
    private int product = 0;//共享数据
    public synchronized void get(){ //进货
        while (product >= 1){ // if 10
            System.out.println("产品已满");
            try {
                this.wait();//满了就等待
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }//else {
        System.out.println(Thread.currentThread().getName()+":"+ (++product));
        this.notifyAll();//没满就可以进货
        //}
    }
    public synchronized void sell(){//卖货
        while (product <= 0){ // if
            System.out.println("缺货");
            try {
                this.wait();//缺货就等待
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }//else {
            System.out.println(Thread.currentThread().getName()+":"+ (--product));
            this.notifyAll();//不缺货就可以卖
        //}
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
