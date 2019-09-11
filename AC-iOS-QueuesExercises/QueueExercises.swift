import Foundation

//1. Find the smallest element in a queue

func smallestElement<T: Comparable>(in q: Queue<T>) -> T? {
    //make sure queue is not empty
    guard !q.isEmpty else {return nil}
    //set q to variable q to access queue mutating methods
    var someQ = q
    var smallest = someQ.peek()!
    while !someQ.isEmpty {
        var current = someQ.dequeue()!
        if current < smallest {
            smallest = current
        }
    }
    return smallest
    
}

//2. Find the sum of a queue of Ints

func sum(of q: Queue<Int>) -> Int {
    guard !q.isEmpty else {return 0}
    var someQ = q
    var sum = 0
    while !someQ.isEmpty {
        sum += someQ.dequeue()!
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
    var someQ = q
    guard !someQ.isEmpty else {return true}
    var previous = someQ.dequeue()!
    
    while !someQ.isEmpty {
        var current = someQ.dequeue()!
        if current < previous {
        return false
        }
        previous = current
    }
    return true
}

//4. Given a Queue as input, return a reversed queue. (Hint: A stack can be helpful here)

/*
Sample Input:   (Back) 9 - 16 - 2 - 31 (Front)
Sample Output:  (Back) 31 - 2 - 16 - 9 (Front)
 */

func reversed<T>(q: Queue<T>) -> Queue<T> {
    var someQ = q
    var arr = [T]()
    var reveresedQ = Queue<T>()
    while !someQ.isEmpty {
        arr.append(someQ.dequeue()!)
    }
    while !arr.isEmpty {
        reveresedQ.enqueue(arr.popLast()!)
    }
    
    return reveresedQ
}

//5 Determine if two Queues are equal

func areEqual<T: Equatable>(qOne: Queue<T>, qTwo: Queue<T>) -> Bool {
    var queueOne = qOne
    var queueTwo = qTwo
    while !queueOne.isEmpty && !queueTwo.isEmpty {
        if queueOne.dequeue()! != queueTwo.dequeue()! {
            return false
        }
    }
    //this only runs if both queues are dequeued of their values then they are equal
    return queueOne.isEmpty && queueTwo.isEmpty
}



