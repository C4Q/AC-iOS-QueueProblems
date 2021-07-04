import Foundation

//1. Find the smallest element in a queue

func smallestElement<T: Comparable>(in q: Queue<T>) -> T? {
    guard !q.isEmpty else {
        return nil
    }
    
    var q = q
    var smallestElement = q.peek()!
    
    while !q.isEmpty {
        if smallestElement > q.peek()! {
            smallestElement = q.deQueue()!
        } else {
            q.deQueue()
        }
    }
    
    return smallestElement
}

//2. Find the sum of a queue of Ints

func sum(of q: Queue<Int>) -> Int {
    var q = q
    var sumOfQ = 0
    
    while !q.isEmpty {
        sumOfQ += q.deQueue()!
    }
    
    return sumOfQ
}

//3. Find out whether or not a queue is in sorted order from smallest to biggest
/*
True example:   (Back) 9 - 6 - 2 - 1 (Front)
False example   (Back) 4 - 19 - 1 - 20 (Front)
False example   (Back) 4 - 19 - 134 - 200 (Front)
*/

func isSorted<T: Comparable>(q: Queue<T>) -> Bool {
    var q = q
    
    while !q.isEmpty {
        guard let currentQ = q.deQueue(), let nextQ = q.peek() else {
            break
        }
        
        if currentQ > nextQ {
            return false
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
    var q = q
    var reversedQ = Queue<T>()
    var reversedArr: [T] = []
    
    while !q.isEmpty {
        reversedArr.append(q.deQueue()!)
    }
    
    while !reversedArr.isEmpty {
        reversedQ.enQueue(reversedArr.popLast()!)
    }
    
    return reversedQ
}

//5. Determine if two Queues are equal

func areEqual<T: Equatable>(qOne: Queue<T>, qTwo: Queue<T>) -> Bool {
    var qOne = qOne
    var qTwo = qTwo
    var qArrOne: [T] = []
    var qArrTwo: [T] = []
    
    while !qOne.isEmpty {
        qArrOne.append(qOne.deQueue()!)
    }
    
    while !qTwo.isEmpty {
        qArrTwo.append(qTwo.deQueue()!)
    }
    
    if qArrOne.count != qArrTwo.count {
        return false
    }
    
    if qArrOne != qArrTwo {
        return false
    }
    
    return true
}

