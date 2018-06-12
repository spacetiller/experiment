package main.scala
import org.apache.spark._
import SparkContext._
object SparkSimRank {
  def main(args: Array[String]) {
    val iters = 10
    val conf = new SparkConf()
             .setMaster("local")
             .setAppName("PagRank")
             .set("spark.executor.memory", "1g")
    //         .setSparkHome("/home/wang/spark-0.9.0")           //(System.getenv("SPARK_HOME"))
    //         .setJars(Seq(System.getenv("SPARK_TEST_JAR")))
    val cs = new SparkContext(conf)
    val simrankline = cs.textFile("/home/wang/Desktop/experiment/input/5")
    val graphline = cs.textFile("/home/wang/Desktop/input/5")
    val indegreeline = cs.textFile("/home/wang/Desktop//input1/5")
    val graph = graphline.map{ s => 
      val key = s.split("\t")
      (key(0), key(1))
    }.distinct().groupByKey().cache()
   // graph.foreach(println _)
    var simrank = simrankline.map{ s =>
      val part = s.split("\t")
      (part(0),part(1).toDouble)
    }
    //simrank.foreach(println _)
    val indegree = indegreeline.map{ s =>
      val part = s.split("\t")
      (part(0), part(1).toDouble)
    }cache()
    //indegree.foreach(println _)
    def find(s: (String,Double)): (String,Double) = {
      val key = s._1.split("_")
      if(key(0).equals(key(1))){
        (s._1,1.0)
       } else s
    }
    for(i <- 1 to iters) {
      val con = graph.join(simrank).values.flatMap{ case (urls, sim) =>
        urls.map(url => (url, sim))
      }
      //con.foreach(println _)
      simrank = con.reduceByKey(_+_).join(indegree).mapValues{sim => 
        if(sim._2 > 10e-10) sim._1 / sim._2 * 0.8
        else 0.0
      }
      simrank=simrank.map(s => find(s))
      //simrank.foreach(println _)
    }


    simrank.saveAsTextFile("./simrank")
  }
}
