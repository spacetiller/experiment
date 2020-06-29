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
        private int i = 0;

        void increasementAndPrint() {
            System.out.print(i++ + "\n");
        }
    }


}
