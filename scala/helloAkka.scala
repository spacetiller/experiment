import akka.actor.{Actor, ActorRef, ActorSystem, Props}
object Sample extends App {
  val system = ActorSystem("Greeting")
  val benjamin = system.actorOf(Props[Benjamin], "Benjamin")
  val stanley = system.actorOf(Props[Stanley], "Stanley")
  benjamin ! stanley
}
class Stanley extends Actor {
  override def receive: Receive = {
    case msg: String => {
      println(msg) //output: Hello Stanley!
      val name = sender().path.name
      sender() ! s"Hello $name!";
    }
    case _ =>
  }
}
class Benjamin extends Actor {
  override def receive: Receive = {
    case friend: ActorRef => {
      val name = friend.path.name
      friend ! s"Hello $name!"
    }
    case msg: String => {
      print(msg) //output: Hello Benjamin!
      context.system.terminate()
    }
    case _ =>
  }
}
