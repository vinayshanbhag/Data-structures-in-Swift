// Sorting algorithms in Swift
// Vinay Shanbhag

import Foundation // for arc4random

// Efficient sorts
//   Quick sort O(nlog n)  Not stable
//   Merge sort O(nlog n)   Stable

// Simple sorts:
//   Insertion sort O(n^2)  Stable
//   Selection sort O(n^2)  Not Stable
//   Shell sort O(nlog^2 n) Not Stable


// Quicksort O(nlog n)  Not stable
func quicksort<T: Comparable>(var array: [T]) -> [T] {
    if array.count <= 1 {
        return array
    }
    
    let p = array.removeAtIndex(0)  // pivot for quicksort
    
    return quicksort(array.filter{$0 <= p }) + [p] + quicksort(array.filter { $0 >  p })
}

var numbers = [Int]()
for i in 1...10 {
    numbers.append(Int(arc4random_uniform(50)))
}
let n = numbers.filter{ $0 < 20}
n
quicksort(numbers)
numbers.sort()


// Insertion Sort O(n^2) Stable
func insertionsort<T:Comparable>(var array: [T]) -> [T] {
    for i in 1..<array.count {
        var j = i
        let t = array[i]
        
        while j > 0 && t < array[j - 1] {
            let temp = array[j]
            array[j] = array[j-1]
            array[j-1] = temp
            j--
        }
        array[j] = t
    }
    
    return array
}

var num = [3,5,2,3,7,8,1,9,5,10,21,33,12]
insertionsort(num)


// Selection Sort O(n^2) Not stable
func selectionsort<T:Comparable>(var array:[T])->[T] {
    guard !array.isEmpty else {
        return array
    }
    
    for i in 0..<array.count-1 {
        for j in (i+1)..<array.count {
            if array[i]>array[j]{
                let temp = array[i]
                array[i] = array[j]
                array[j] = temp
            }
        }
    }
    return array
}

num = []
for i in 1...10{
    num.append(Int(arc4random_uniform(100)))
}
selectionsort(num)





