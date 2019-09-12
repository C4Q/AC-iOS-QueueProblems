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
    guard q.isEmpty == false else { return true }
    var copyOfq = q  //5, 10, 13, 17
    var previous = copyOfq.dequeue()! //returns 5 first time
    
    while copyOfq.isEmpty == false {
        var next = copyOfq.dequeue()! //value is 10 first time
        if previous > next {
            return false
        } else {
            previous = next
        }
    }
    return true
}

//4. Given a Queue as input, return a reversed queue. (Hint: A stack can be helpful here)

/*
Sample Input:   (Back) 9 - 16 - 2 - 31 (Front)
Sample Output:  (Back) 31 - 2 - 16 - 9 (Front)
 */
//
func reversed<T>(q: Queue<T>) -> Queue<T> {
    var copyOfq = q //makes copy of queue
    var reveresedq = Queue<T>() //initialization of queue to be returned
    var helperArray = [T]() //array to hold values of elements being queue
    
    while copyOfq.isEmpty == false {
        let element = copyOfq.dequeue()! //dequeue first element of queue
        helperArray.append(element) //adds dequeued element to helper
    }
    
    while !helperArray.isEmpty {
        let element = helperArray.popLast()! //pops last element of array
        reveresedq.enqueue(element) //adds deleted element to queue to be returned
    }
    
    return reveresedq
}

//5 Determine if two Queues are equal

func areEqual<T: Equatable>(qOne: Queue<T>, qTwo: Queue<T>) -> Bool {
    var queueOne = qOne
    var queueTwo = qTwo
    
    while queueOne.isEmpty == false && queueTwo.isEmpty == false { //checks both queues are not empty
        if queueOne.dequeue()! != queueTwo.dequeue()! { // if element being dequeue  are not the  same in both q's, return false.
            return false
        }
    }
    
    if queueOne.isEmpty == true && queueTwo.isEmpty == true {
        //if after dequeing both queue, both should be empty for the queues to be equal
        //checks both queues are not empty
        return true
    } else {
        return false
    }
}

