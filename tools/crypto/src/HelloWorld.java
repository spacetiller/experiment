package com.ctfo.datastatic.util;

import  com.ctfo.datastatic.util.DES;

public class HelloWorld
{
      //程序的主函数入门
	  public static void main(String args[])
	  {
	      //输出打印字符语句
	  
	      System.out.println("Hello, DES !");
          DES des = new DES();
          System.out.println(des.encrypt("123456"));
	  }
}
