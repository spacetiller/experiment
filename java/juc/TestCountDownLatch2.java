import java.util.concurrent.CountDownLatch;

public class TestCountDownLatch2 {
    public static void main(String[] args) {
        final CountDownLatch latch = new CountDownLatch(10);//有多少个线程这个参数就是几
        LatchDemo ld = new LatchDemo(latch);
        long start = System.currentTimeMillis();
        for (int i = 0; i < 10; i++) {
            new Thread(ld).start();
        }
        try {
            latch.await();//这10个线程执行完之前先等待
        } catch (InterruptedException e) {
        }
        long end = System.currentTimeMillis();
        System.out.println("耗费时间为：" + (end - start));
    }
}

class LatchDemo implements Runnable {
    private CountDownLatch latch;
    public LatchDemo(CountDownLatch latch) {
        this.latch = latch;
    }
    @Override
    public void run() {
        synchronized (this) {
            try {
                for (int i = 0; i < 5000; i++) {
                    if (i % 2 == 0) {//50000以内的偶数
                        if(i % 1000 == 0)
                            System.out.println(i);
                    }
                }
            } finally {
                latch.countDown();//每执行完一个就递减一个
            }
        }
    }
}
