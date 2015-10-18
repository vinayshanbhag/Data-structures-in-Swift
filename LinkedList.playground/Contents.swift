//  Data structures in Swift - Linked List
//  Vinay Shanbhag

import Foundation

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

class List<T:Comparable> {
    var head:Node<T>?
    
    //count: Number of nodes in list
    var count:Int {
        var count = 0
        var current = head
        while (current != nil){
            count++
            current = current?.next
        }
        return count
    }

    //sortedInsert: create a new node with data and insert in its sorted position
    func sortedInsert(data:T) -> Node<T> {
        let newNode = Node<T>(data: data) // create new node
        
        if head == nil { // list is empty. Add new node to the list.
            head = newNode
            return head!
        }
    
        var current = head, previous = head
        
        while current != nil { // while there is a node in the list
            if current!.data > data { // Node inserted is lower than current node
                if current === head { // insert new node at the head of the list
                    newNode.next = head
                    head = newNode
                } else { // insert new node before current node
                    previous!.next = newNode
                    newNode.next = current
                }
                return newNode
            }
            // Node inserted is higher than current node and cannot be inserted here. 
            // Move to next node in the list
            previous = current
            current = current?.next
        }
        // reached end of the list. append node to the end of list.
        previous!.next = newNode
        return newNode
    }
    
    // remove: remove the first node that contains data from the list
    func remove(data:T) {
        var previous = head, current = head
        while current != nil {
            if current?.data == data {
                if current === head {
                    head = head?.next
                } else {
                    previous?.next = current?.next
                }
                return // remove only the first match
            }
            previous = current
            current = current?.next
        }
    }
    
    // printList: print data in all nodes in list
    func printList(){
        var current = head
        while current != nil {
            print("\(current!.data) ",terminator:"")
            current = current!.next
        }
        print("")
    }
}

let numberList = List<Int>()
for i in 1...20{
    numberList.sortedInsert(Int(arc4random_uniform(11)))
    
}
numberList.printList()
numberList.remove(0)
numberList.remove(1)

let wordList = List<String>()
let words = ["now","is","the","time","for","all","good","men","to","come","to","the","aid","of","their","country"]
for word in words {
    wordList.sortedInsert(word)
}
wordList.printList()


