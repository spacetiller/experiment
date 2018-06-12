/* SimpleGraph.scala */
import org.apache.spark.SparkContext
import org.apache.spark.SparkContext._
import org.apache.spark.SparkConf

import org.apache.spark._
import org.apache.spark.streaming._

object SimpleStreaming{
  def main(args: Array[String]) {
  	// 1. Config
    val conf = new SparkConf().setMaster("local[2]").setAppName("Simple Streaming Application - Network Wordcount")
    val ssc = new StreamingContext(conf,Seconds(5))

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

	// 4. Set output
	// Print the first ten elements of each RDD generated in this DStream to the console
	wordCounts.print()

	// 5. Start
	ssc.start()             // Start the computation
	ssc.awaitTermination()  // Wait for the computation to terminate
  }
}
