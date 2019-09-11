import Foundation

//1. Find the smallest element in a queue

func smallestElement<T: Comparable>(in q: Queue<T>) -> T? {
    
    guard q.isEmpty == false else { return nil }
    var copyOfq = q //makes copy of queue
    var smallest = copyOfq.peek()! // assigns the value of first element in queue to var smallestElement
    
    while copyOfq.isEmpty == false {
        let helperq = copyOfq.dequeue()! //helperq removes first element of queue each time.
        
        if helperq < smallest {
            //1st loop value of smallest is 5. Value of helper is 10. Is 10 less than 5? false. Smallest remain 5.
            //2nd loop value of smallest is 5. Value of helper is 13. Is 13 less than 5? false. smallest remain 5.
            //3rd loop value of smallest is 5. Value of helper is 17.  Is 17 less than 5? false. smallest remain 5.
            smallest = copyOfq as! T
        }
    }
    return smallest //value of smallest is 5.
}

//2. Find the sum of a queue of Ints

func sum(of q: Queue<Int>) -> Int {
    guard q.isEmpty == false else { return 0 }
    var copyOfq = q //5, 10, 13, 17
    var sum = 0
    
    while copyOfq.isEmpty == false {
      let helperq = copyOfq.dequeue()!
        //returns current head of helper in each loop starting at 5
        //1st loop 5 + 0 = 5
        // 2nd loop 5 + 10 = 15
        // 3rd loop 15 + 13 = 28
        // 4th loop 28 + 17 = 45
      sum += helperq
    }
    return sum
}

//3. Find out whether or not a queue is in sorted order from smallest to biggest
/*
True example:   (Back) 9 - 6 - 2 - 1 (Front)
False example   (Back) 4 - 19 - 1 - 20 (Front)
False example   (Back) 4 - 19 - 134 - 200 (Front)
*/

func isSorted<T: Comparable>(q: Queue<T>) -> Bool {
    return true
}

//4. Given a Queue as input, return a reversed queue. (Hint: A stack can be helpful here)

/*
Sample Input:   (Back) 9 - 16 - 2 - 31 (Front)
Sample Output:  (Back) 31 - 2 - 16 - 9 (Front)
 */

func reversed<T>(q: Queue<T>) -> Queue<T> {
    return q
}

//5 Determine if two Queues are equal

func areEqual<T: Equatable>(qOne: Queue<T>, qTwo: Queue<T>) -> Bool {
    return false
}

