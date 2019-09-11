import Foundation

//1. Find the smallest element in a queue

func smallestElement<T: Comparable>(in q: Queue<T>) -> T? {
    var myQ = q
    if myQ.isEmpty {
        return nil
    }
    var small = myQ.dequeue()!
    while !myQ.isEmpty {
        let secondSmall = myQ.dequeue()!
        if small > secondSmall {
            small = secondSmall
        }
    }
    return small
}

//2. Find the sum of a queue of Ints

func sum(of q: Queue<Int>) -> Int {
    var myQ = q
    if myQ.isEmpty {
        return 0
    }
    var placeHolder = 0
    while !myQ.isEmpty {
        let a = myQ.dequeue()
        placeHolder += a!
    }
    
    return placeHolder
}

//3. Find out whether or not a queue is in sorted order from smallest to biggest
/*
True example:   (Back) 9 - 6 - 2 - 1 (Front)
False example   (Back) 4 - 19 - 1 - 20 (Front)
False example   (Back) 4 - 19 - 134 - 200 (Front)
*/

func isSorted<T: Comparable>(q: Queue<T>) -> Bool {
    var myQ = q
    if myQ.isEmpty {
        return true
    }
    var a = myQ.dequeue()!
    while !myQ.isEmpty {
        let b = myQ.dequeue()!
        if a > b {
            return false
        } else {
           a = b
        }
    }
    
    return true
}

//4. Given a Queue as input, return a reversed queue. (Hint: A stack can be helpful here)

/*
Sample Input:   (Back) 9 - 16 - 2 - 31 (Front)
Sample Output:  (Back) 31 - 2 - 16 - 9 (Front)
 */

func reversed<T>(q: Queue<T>) -> Queue<T> {
    var myQ = q
    var arrOne = [T]()
    var newQueue = Queue<T>()
    
    if myQ.isEmpty {
        return q
    }
    
    while !myQ.isEmpty {
        let a = myQ.dequeue()!

        arrOne.insert(a, at: 0)
        
    }
    
    for i in arrOne {
        newQueue.enqueue(i)
    }
    
    return newQueue
}

//5 Determine if two Queues are equal

func areEqual<T: Equatable>(qOne: Queue<T>, qTwo: Queue<T>) -> Bool {
    var myQOne = qOne
    var myQTwo = qTwo
    if myQOne.isEmpty && myQTwo.isEmpty {
        return true
    } else if myQOne.isEmpty && !myQTwo.isEmpty {
        return false
    } else if !myQOne.isEmpty && myQTwo.isEmpty {
        
        return false
    }

    while !myQOne.isEmpty && !myQTwo.isEmpty {
        let a = myQOne.dequeue()
        let b = myQTwo.dequeue()
        if a != b {
            return false
        }
    }
    return true
}

