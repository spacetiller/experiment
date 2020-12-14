import java.util.concurrent.CountDownLatch;

public class TestCountDownLatch1 {
    public static void main(String[] args){
        LatchDemo ld = new LatchDemo();
        long start = System.currentTimeMillis();
        for (int i = 0;i<10;i++){
            new Thread(ld).start();
        }
        long end = System.currentTimeMillis();
        System.out.println("耗费时间为："+(end - start)+"秒");
    }
}

class LatchDemo implements Runnable{
    private CountDownLatch latch;
    public LatchDemo(){
    }
    @Override
    public void run() {
        for (int i = 0;i<5001;i++){
            if (i % 2 == 0){//50000以内的偶数
                if(i % 1000 == 0)
                    System.out.println(i);
            }
        }
    }
}
