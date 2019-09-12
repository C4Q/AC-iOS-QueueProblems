import Foundation

//1. Find the smallest element in a queue

func smallestElement<T: Comparable>(in q: Queue<T>) -> T? {
    var queue = q
    guard var smallestVal = queue.dequeue() else {return nil}
    
    while !queue.isEmpty {
        let currentVal = queue.dequeue()!
        if currentVal < smallestVal {
            smallestVal = currentVal
        }
    }
    
    return smallestVal
}

//2. Find the sum of a queue of Ints

func sum(of q: Queue<Int>) -> Int {
    var queue = q
    var sum = 0
    while !queue.isEmpty {
        let currentNum = queue.dequeue()!
        sum += currentNum
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
    var queue = q
    guard var smallestVal = queue.peek() else {return false}
    guard var currentVal = queue.dequeue() else {return false}
    
    while !queue.isEmpty {
        currentVal = queue.dequeue()!
        if currentVal > smallestVal {
            smallestVal = currentVal
        } else {
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

struct Stack<T: Equatable> {
    private var items = [T]()
    
    public var isEmpty: Bool {
        return items.isEmpty
    }
    
    public var count: Int {
        return items.count
    }
    
    public var peek: T? {
        return items.last
    }
    
    public mutating func push(_ item: T) {
        items.append(item)
    }
    
    @discardableResult
    public mutating func pop() -> T? {
        guard !isEmpty else { return nil }
        return items.removeLast()
    }
}

func reversed<T: Equatable>(q: Queue<T>) -> Queue<T> {
    var queue = q
    var stack = Stack<T>()
    var newque = Queue<T>()

    while !queue.isEmpty {
        let returnElement = queue.dequeue()!
        stack.push(returnElement)
    }
    
    while !stack.isEmpty {
        let returnElement = stack.pop()!
        newque.enqueue(returnElement)
    }
    
    return newque
}

//5 Determine if two Queues are equal

func areEqual<T: Equatable>(qOne: Queue<T>, qTwo: Queue<T>) -> Bool {
    var queueOne = qOne
    var queueTwo = qTwo
    
    while !queueOne.isEmpty && !queueTwo.isEmpty {
        let valOne = queueOne.dequeue()
        let valTwo = queueTwo.dequeue()
        if valOne != valTwo {
            return false
        }
    }
    return queueOne.isEmpty && queueTwo.isEmpty
}

