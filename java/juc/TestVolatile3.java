public class TestVolatile3 {
    public static void main(String[] args){ //这个线程是用来读取flag的值的
        DemoThread threadDemo = new DemoThread();
        Thread thread = new Thread(threadDemo);
        thread.start();
        while (true){
            if (threadDemo.isFlag()){
                System.out.println("主线程读取到的flag = " + threadDemo.isFlag());
                break;
            }
        }
    }
}

//@Data
class DemoThread implements Runnable{ //这个线程是用来修改flag的值的
    public volatile boolean flag = false;
    @Override
    public void run() {
        try {
            Thread.sleep(200);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        flag = true;
        System.out.println("ThreadDemo线程修改后的flag = " + isFlag());
    }
    public boolean isFlag(){
        return this.flag;
    }
}
