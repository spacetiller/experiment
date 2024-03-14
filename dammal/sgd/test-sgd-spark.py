package mllib


import org.apache.log4j.{Level, Logger}
import org.apache.spark.{SparkContext, SparkConf}

import scala.collection.mutable.HashMap

/**
  * ����ݶ��½��㷨
  * Created by ������ on 2016/8/5.
  */
object SGD {

  //���β���Ҫ����־��ʾ���ն���
  Logger.getLogger("org.apache.spark").setLevel(Level.WARN)
  Logger.getLogger("org.apache.eclipse.jetty.server").setLevel(Level.OFF)

  //�������
  val conf = new SparkConf()
    .setMaster("local[1]")
    .setAppName(this.getClass().getSimpleName()
    .filter(!_.equals('$')))
  
  println(this.getClass().getSimpleName().filter(!_.equals('$')))

  val sc = new SparkContext(conf)

  //�����洢���ݼ�HashMap����
  val data = new HashMap[Int, Int]()
  //�������ݼ�����
  def getData(): HashMap[Int, Int] = {
    for(i <- 1 to 50) {
      data += (i -> (2 * i))  //д�빫ʽy=2x
    }
    data
  }

  //����a=0
  var a: Double = 0
  //���ò���ϵ��
  var b: Double = 0.1

  //���õ�����ʽ
  def sgd(x: Double, y: Double) = {
    a = a - b * ((a * x) - y)
  }

  def main(args: Array[String]) {
    //��ȡ���ݼ�
    val dataSource = getData()
    println("data: ")
    dataSource.foreach(each => println(each + " "))
    println("\nresult: ")
    var num = 1
    //��ʼ����
    dataSource.foreach(myMap => {
      println(num + ":" + a + "("+myMap._1+","+myMap._2+")")
      sgd(myMap._1, myMap._2)
      num = num + 1
    })
    //��ʾ���
    println("���ս��aΪ " + a)
  }

}