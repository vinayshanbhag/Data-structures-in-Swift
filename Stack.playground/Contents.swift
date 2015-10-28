// Data structures in Swift - Stack
// Vinay Shanbhag

import Foundation // for arc4random

class Node<T>{
    var data:T!
    var next:Node?
    
    init(){}
    
    init (data:T){
        self.data = data
    }
    
    deinit{
        print("Node(\(data!)) deinitialized")
    }
}

class Stack<T>{
    var top:Node<T>?
    
    var count:Int {
        var count = 0
        var current = top
        while current != nil {
            count++
            current = current?.next
        }
        return count
    }
    
    func push(data:T){
        let newNode = Node<T>(data:data)
        newNode.next = top
        top = newNode
    }
    
    func pop()->T?{
        let poppedValue = top?.data
        top = top?.next
        return poppedValue
    }
    
    func peek()->T?{
        return top?.data
    }
    
    func printStack(){
        var current = top
        if top == nil {
            print("Empty Stack")
            return
        }
        while current != nil {
            print((current === top ? "top: ":"") + "\(current!.data!) ", terminator:"")
            current = current?.next
        }
        print(":bottom")
    }
}

var numberStack = Stack<Int>()
numberStack.peek()
numberStack.count
numberStack.pop()

for i in 1...5{
    var n = Int(arc4random_uniform(101))
    numberStack.push(n)
    numberStack.printStack()
}

while numberStack.pop() != nil {
    print("popped stack- ",terminator:"")
    numberStack.printStack()
}


// A Stack using Swift Array
class ArrayStack<T> {
    var stack = Array<T>()
    
    var count:Int {
        return stack.count
    }
    
    func push(data:T){
        stack.append(data)
    }
    
    func pop()->T? {
        if stack.count > 0 {
            return stack.removeAtIndex(stack.count-1)
        }
        return nil
    }
    
    func peek()->T?{
        if stack.count > 0 {
            return stack[stack.count-1]
        }
        return nil
    }
    
    func printStack(){
        if stack.count > 0{
            print("bottom: \(stack) :top")
        } else {
            print("Empty stack")
        }
    }
    
}

var aStack = ArrayStack<Int>()
for i in 1...10{
    aStack.push(i)
    //aStack.printStack()
}
for i in 1...10{
    aStack.pop()
    //aStack.printStack()
}
aStack.pop()
aStack.peek()

