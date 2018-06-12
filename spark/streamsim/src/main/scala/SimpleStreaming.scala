/* SimpleGraph.scala */
import org.apache.spark.SparkContext
import org.apache.spark.SparkContext._
import org.apache.spark.SparkConf

import org.apache.log4j.{Level, Logger}
import org.apache.spark._
import org.apache.spark.streaming._

object SimpleStreaming{
  def main(args: Array[String]) {
	// 0. 
	// 参数
	if (args.length > 0) {
      System.err.println("args: %s ".format(args.length))
    } 
	// Logger
	Logger.getLogger("org.apache.spark").setLevel(Level.ERROR)
	//定义更新状态方法，参数values为当前批次单词频度，state为以往批次单词频度
    val updateFunc = (values: Seq[Int], state: Option[Int]) => {
      val currentCount = values.foldLeft(0)(_ + _)
      val previousCount = state.getOrElse(0)
      Some(currentCount + previousCount)
    }

  	// 1. Config
    val conf = new SparkConf().setMaster("local[2]").setAppName("Simple Streaming Application - Network Wordcount")
    val ssc = new StreamingContext(conf,Seconds(10))
	ssc.checkpoint(".")

	// 2. Datasource
	// Create a DStream that will connect to hostname:port, like localhost:9999
	val lines = ssc.socketTextStream("localhost", 9999)
	//val lines = ssc.textFileStream("/user/h_zhanghui/spark/stream-test")

	// 3. MR Task
	// Split each line into words
	val words = lines.flatMap(_.split(" "))
	// Count each word in each batch
	val pairs = words.map(word => (word, 1))
	val wordCounts = pairs.reduceByKey(_ + _)
	val stateDstream = pairs.updateStateByKey[Int](updateFunc)

	// 4. Set output
	// Print the first ten elements of each RDD generated in this DStream to the console
	//wordCounts.print()
	stateDstream.print()
	//stateDstream.saveAsTextFile("abc")

	// 5. Start
	ssc.start()             // Start the computation
	ssc.awaitTermination()  // Wait for the computation to terminate
  }
}
