import java.util.concurrent.locks.ReentrantLock;

public class TestSync {

	public static void main(String[] args){
        Increase increase = new Increase();
        int count = 10;
        while (count != 0){
            new Thread(() -> {
                increase.increasementAndPrint();
            }).start();
            count --;
        }
    }

    static class Increase {
		private ReentrantLock reentrantLock = new ReentrantLock(); // 3. ReentrantLock
        private int i = 0; // 1. private volatile int i = 0;

        void increasementAndPrint() { //2. synchronized void ...
			reentrantLock.lock();
            System.out.print(i++ + "\n");
			reentrantLock.unlock();
        }
    }


}
