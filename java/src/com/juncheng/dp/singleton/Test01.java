package com.juncheng.dp.singleton;

/**
 * 饿汉式
 * 
 *
 */
public class Test01 {
  private static final Test01 INSTANCE = new Test01();

  private Test01() {};

  private static Test01 getInstance() { return INSTANCE; }

  public void m() { System.out.println("m"); }

  public static void main(String[] args) {
  	Test01 t1 = Test01.getInstance();
	Test01 t2 = Test01.getInstance();
	System.out.println(t1 == t2);
  }
}
