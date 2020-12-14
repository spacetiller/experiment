/*
 * 在JDK1.5之前，解决多线程安全问题有两种方式(sychronized隐式锁)：
 * 同步代码块
 * 同步方法
 * 在JDK1.5之后，出现了更加灵活的方式(Lock显式锁)：同步锁
 * Lock需要通过lock()方法上锁，通过unlock()方法释放锁。
 * 为了保证锁能释放，所有unlock方法一般放在finally中去执行。
 */

public class TestLock1 {
    public static void main(String[] args) {
        DemoTicket td = new DemoTicket();
        new Thread(td, "窗口1").start();
        new Thread(td, "窗口2").start();
        new Thread(td, "窗口3").start();
    }
}

class DemoTicket implements Runnable {
    private int ticket = 100;
    @Override
    public void run() {
        while (true) {
            if (ticket > 0) {
                try {
                    Thread.sleep(200);
                } catch (Exception e) {
                }
                System.out.println(Thread.currentThread().getName() + "完成售票，余票为：" + (--ticket));
            }
        }
    }
}
