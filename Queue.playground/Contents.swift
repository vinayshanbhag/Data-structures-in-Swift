// Data structures in Swift - Queue
// Vinay Shanbhag

import Foundation // for arc4random

// An item in the queue
class Item<T>{
    var data:T!
    var next:Item?
    
    init (data:T){
        self.data = data
    }
    
    deinit{
        print("deinit: Item(\(data!))")
    }
}

// Queue data structure
class Queue<T>{
    var head:Item<T>?   // front of the queue
    var tail:Item<T>?   // back of the queue
    
    // initialize an empty queue
    init(){
        head = nil
        tail = nil
    }
    
    // initialize a queue with given variadic values
    init(_ values:T...){
        for value in values{
            self.enqueue(value)
        }
    }
    
    // count of items in queue
    var count:Int {
        var count = 0
        var current = head
        while current != nil {
            count++
            current = current?.next
        }
        return count
    }
    
    // add an item with specified data to the back of the queue
    func enqueue(data:T){
        let newItem = Item<T>(data:data)
        if head == nil { // add an item to an empty queue
            head = newItem
            tail = head
        } else { // add to the back of the queue
            tail!.next = newItem
            tail = newItem
        }
    }
    
    // remove an item from the front of the queue and return its value
    func dequeue()->T?{
        let dequeued = head?.data
        head = head?.next
        return dequeued
    }
    
    // Look at item at the front of the queue and return its data
    func peek()->T?{
        return head?.data
    }
    
    // print the queue
    func printQueue(){
        var current = head
        if head == nil {
            print("Empty")
            return
        }
        while current != nil {
            print((current === head ? "<":",") + "\(current!.data!)", terminator:"")
            current = current?.next
        }
        print("<")
    }
    
    deinit{
        print("deinit: Queue")
    }
}



// create an empty queue
var numberQueue = Queue<Int>()

// add items to queue
for i in 1...5{
    var n = Int(arc4random_uniform(100))
    numberQueue.enqueue(n)
    numberQueue.printQueue()
}

print("numberQueue has \(numberQueue.count) items.")

// dequeue items
var dequeued = numberQueue.dequeue()
while dequeued != nil {
    print("Dequeued - \(dequeued!)... Queue:",terminator:"")
    numberQueue.printQueue()
    dequeued = numberQueue.dequeue()
}

// create a queue with specified item values
let anotherQueue = Queue(10,20,30,40,50) // Int type is inferred
print("Queue:", terminator:"")
anotherQueue.printQueue()

