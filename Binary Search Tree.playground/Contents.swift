//: Data structures in Swift: Binary Search Tree
indirect enum BinarySearchTree<T:Comparable>: CustomStringConvertible {
    case Empty
    case Node(T, left: BinarySearchTree, right: BinarySearchTree)
    
    // Insert a new value in the tree
    mutating func insert(newValue: T) -> BinarySearchTree{
        switch self {
        case .Empty:
            self = BinarySearchTree.Node(newValue, left: BinarySearchTree.Empty, right: BinarySearchTree.Empty)
        case .Node(let value, var left, var right):
            if newValue > value {
                self = BinarySearchTree.Node(value, left: left, right: right.insert(newValue))
            } else {
                self = BinarySearchTree.Node(value, left: left.insert(newValue), right: right)
            }
        }
        return self
    }
    
    var depth: Int {
        switch self {
        case .Empty:
            return 0
        case let .Node(_, left, right):
            return 1 + max(left.depth, right.depth)
        }
    }
    
    var description: String {
        switch self {
        case .Empty:
            return ""
        case let .Node(value, left, right):
            return "\(left)\(value) \(right)" // Traverse inorder
        }
    }
}

var numberTree = BinarySearchTree<Int>.Empty
let numbers = [7,3,11,9,2,4,18,21,1,8]
for number in numbers {
    print("depth:\(numberTree.depth), contents:\(numberTree.insert(number))")
}
print("\(numberTree)")

var wordTree = BinarySearchTree<String>.Empty
let words = ["a","quick","brown","fox","jumps","over","the","lazy","dog"]
for word in words{
    print("depth:\(wordTree.depth), contents:\(wordTree.insert(word))")
}
print("\(wordTree)")
