package mllib


import org.apache.log4j.{Level, Logger}
import org.apache.spark.{SparkContext, SparkConf}

import scala.collection.mutable.HashMap

/**
  * 随机梯度下降算法
  * Created by 汪本成 on 2016/8/5.
  */
object SGD {

  //屏蔽不必要的日志显示在终端上
  Logger.getLogger("org.apache.spark").setLevel(Level.WARN)
  Logger.getLogger("org.apache.eclipse.jetty.server").setLevel(Level.OFF)

  //程序入口
  val conf = new SparkConf()
    .setMaster("local[1]")
    .setAppName(this.getClass().getSimpleName()
    .filter(!_.equals('$')))
  
  println(this.getClass().getSimpleName().filter(!_.equals('$')))

  val sc = new SparkContext(conf)

  //创建存储数据集HashMap集合
  val data = new HashMap[Int, Int]()
  //生成数据集内容
  def getData(): HashMap[Int, Int] = {
    for(i <- 1 to 50) {
      data += (i -> (2 * i))  //写入公式y=2x
    }
    data
  }

  //假设a=0
  var a: Double = 0
  //设置步进系数
  var b: Double = 0.1

  //设置迭代公式
  def sgd(x: Double, y: Double) = {
    a = a - b * ((a * x) - y)
  }

  def main(args: Array[String]) {
    //获取数据集
    val dataSource = getData()
    println("data: ")
    dataSource.foreach(each => println(each + " "))
    println("\nresult: ")
    var num = 1
    //开始迭代
    dataSource.foreach(myMap => {
      println(num + ":" + a + "("+myMap._1+","+myMap._2+")")
      sgd(myMap._1, myMap._2)
      num = num + 1
    })
    //显示结果
    println("最终结果a为 " + a)
  }

}