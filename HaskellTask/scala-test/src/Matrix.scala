import java.util

import scala.collection.+:

/**
  * @Author is flystyle 
  *         Created on 27.09.16.
  */


object Main extends App {

   def multiply(a : List[List[Int]], b : List[List[Int]]) = {
      var m = 0
      for (i <- 0 to 3) {
         for (j <- 0 to 3) {
            for (k <- 0 to 3) {
               m += a(i)(j) * b(j)(i)
            }
            print(" " + m)
            m = 0
         }
         println()
      }

   }

   override def main(args: Array[String]): Unit = {

      val list : List[List[Int]] = List(
         List(1,2,3,4),
         List(1,2,3,4),
         List(1,2,3,4),
         List(1,2,3,4)
      )


      multiply(list, list)

   }
}



