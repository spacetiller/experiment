/* SimpleSVD.scala */
import org.apache.spark.SparkContext
import org.apache.spark.SparkContext._
import org.apache.spark.SparkConf
import org.apache.spark.mllib.linalg.{Vector, Vectors}
import org.apache.spark.mllib.linalg.Vector
import org.apache.spark.mllib.linalg.Matrix
import org.apache.spark.mllib.linalg.distributed.RowMatrix
import org.apache.spark.mllib.linalg.SingularValueDecomposition

object SimpleSVD {
  def main(args: Array[String]) {
    val sF = "svd123.txt" // Should be some file on your system
    val conf = new SparkConf().setAppName("Simple SVD Application")
    val sc = new SparkContext(conf)
	val mat: RowMatrix = new RowMatrix(sc.textFile(sF).map(_.split(' ')).map(_.map(_.toDouble)).map(_.toArray).map(line => Vectors.dense(line)))
    val svd: SingularValueDecomposition[RowMatrix, Matrix] = mat.computeSVD(20, computeU = true)
	val U: RowMatrix = svd.U
	val S: Vector = svd.s
	val V: Matrix = svd.V
	U.rows.foreach(println)
	println("S: %s".format(S.toArray))
	println("V: %s".format(V.toString))
  }
}
