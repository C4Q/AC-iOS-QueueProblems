import Foundation

//1. Find the smallest element in a queue

func smallestElement<T: Comparable>(in q: Queue<T>) -> T? {
    var newQueue = q
    var smallElement: T? = newQueue.deQueue()
    while !newQueue.isEmpty {
        if newQueue.peek()! < smallElement! {
            smallElement = newQueue.deQueue()
        }
        let _ = newQueue.deQueue()
    }
    return smallElement
}

//2. Find the sum of a queue of Ints

func sum(of q: Queue<Int>) -> Int {
    var sumQueue = 0
    var newQueue = q
    while !newQueue.isEmpty {
        guard let newElement = newQueue.deQueue() else {
            continue
        }
        sumQueue += newElement
    }
    return sumQueue
}

//3. Find out whether or not a queue is in sorted order from smallest to biggest
/*
True example:   (Back) 9 - 6 - 2 - 1 (Front)
False example   (Back) 4 - 19 - 1 - 20 (Front)
False example   (Back) 4 - 19 - 134 - 200 (Front)
*/

func isSorted<T: Comparable>(q: Queue<T>) -> Bool {
    var newQueue = q
    var currentElement = newQueue.deQueue()!
    while !newQueue.isEmpty {
        guard let nextElement = newQueue.deQueue() else {
            continue
        }
        if nextElement < currentElement {
            return false
        }
        currentElement = nextElement
    }
    return true
}

//4. Given a Queue as input, return a reversed queue. (Hint: A stack can be helpful here)

/*
Sample Input:   (Back) 9 - 16 - 2 - 31 (Front)
Sample Output:  (Back) 31 - 2 - 16 - 9 (Front)
 */

struct Stack<T> {
    private var arr = [T]()
    var isEmpty: Bool {
        return arr.isEmpty
    }
    mutating func push(_ newElement: T) {
        arr.append(newElement)
    }
    mutating func pop() -> T? {
        return arr.popLast()
    }
    func peek() -> T? {
        return arr.last
    }
}
func reversed<T>(q: Queue<T>) -> Queue<T> {
    var oneStack = q
    var twoStack = Stack<T>()
    while !oneStack.isEmpty {
        twoStack.push(oneStack.deQueue()!)
    }
    while !twoStack.isEmpty {
        oneStack.enQueue(twoStack.pop()!)
    }
    return oneStack
}

//5 Determine if two Queues are equal

func areEqual<T: Equatable>(qOne: Queue<T>, qTwo: Queue<T>) -> Bool {
    var oneQueue = qOne
    var twoQueue = qTwo
    while !oneQueue.isEmpty {
        guard let elementOne = oneQueue.deQueue(), let elementTwo = twoQueue.deQueue() else {
            return false
        }
        if elementOne != elementTwo {
            return false
        }
    }
    if !twoQueue.isEmpty {
        return false
    }
    return true
}

