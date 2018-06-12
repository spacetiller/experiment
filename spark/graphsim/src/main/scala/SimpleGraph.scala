/* SimpleGraph.scala */
import org.apache.spark.SparkContext
import org.apache.spark.SparkContext._
import org.apache.spark.SparkConf
//import org.apache.spark._
import org.apache.spark.graphx._
import org.apache.spark.rdd.RDD

object SimpleGraph{
  def main(args: Array[String]) {
    val conf = new SparkConf().setAppName("Simple Graph Application")
    val sc = new SparkContext(conf)
    val users: RDD[(VertexId, (String, String))] = sc.parallelize(Array((3L, ("rxin", "student")), (7L, ("jgonzal", "postdoc")),(5L, ("franklin", "prof")), (2L, ("istoica", "prof"))))
	val relationships: RDD[Edge[String]] = sc.parallelize(Array(Edge(3L, 7L, "collab"),    Edge(5L, 3L, "advisor"), Edge(2L, 5L, "colleague"), Edge(5L, 7L, "pi")))
	val defaultUser = ("John Doe", "Missing")
	val graph = Graph(users, relationships, defaultUser)
	println("1. graph constructed")

	//println("2. graph attributes")
	//graph.vertices.filter { case (id, (name, pos)) => pos == "postdoc" }.count
	//graph.edges.filter(e => e.srcId > e.dstId).count
	//
	//val facts: RDD[String] =  graph.triplets.map(triplet => triplet.srcAttr._1 + " is the " + triplet.attr + " of " + triplet.dstAttr._1)
	//facts.collect.foreach(println(_))
	//
	//println("3. graph degrees")
	//graph.inDegrees.collect.foreach(println)	// 入度集合
	//graph.outDegrees.collect.foreach(println) 	// 出度集合
	//graph.degrees.collect.foreach(println(_))	// 出入度集合

	//println("4. subgraph")
	//var newGraph1 = graph.mapVertices[Int]((id, data) => if (id == 5L) 0 else 100) .vertices.collect.foreach(println)

	//// PageRank
	//println("5. page rank")
	//val inputGraph: Graph[Int, String] = graph.outerJoinVertices(graph.outDegrees)((vid, _, degOpt) => degOpt.getOrElse(0))
	//val outputGraph: Graph[Double, Double] = inputGraph.mapTriplets(triplet => 1.0 / triplet.srcAttr).mapVertices((id, _) => 1.0)
	//graph.pageRank(0.01).vertices.collect().foreach(println(_))

  }
}
