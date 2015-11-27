//: Playground - noun: a place where people can play

import UIKit

//快排
func quickSort(list: [Int]) -> [Int] {
    guard let (pivot, rest) = list.decompose else {
        return []
    }
    
    let lesser = rest.filter { $0 < pivot }
    let greater = rest.filter { $0 >= pivot }
    return quickSort(lesser) + [pivot] + quickSort(greater)
    
}

//分解成首元素和剩余数组
extension Array {
    var decompose : (head: Element, tail: [Element])? {
        return (count > 0) ? (self[0], Array(self[1..<count])) : nil
    }
}

//累加
func sum(list: [Int]) -> Int {
    if let (head, tail) = list.decompose {
        return head + sum(tail)
    } else {
        return 0
    }
}

//山寨reduce
func reduce<T>(list: [T], initValue: T, function: (lhs: T, rhs: T) -> T) -> T {
    if let (head, tail) = list.decompose {
        return function(lhs: head, rhs: reduce(tail, initValue: initValue, function: function))
    } else {
        return initValue
    }
}

//累加
func betterSum(list: [Int]) -> Int {
    guard let (head, tail) = list.decompose else {
        return 0
    }
    
    return head + sum(tail)
}

let sortedList = quickSort([3, 9, 30, 0])

let sumResult = sum([1, 2, 3, 4])
betterSum([1, 2, 3, 4])

let multiResult = reduce([2, 3, 5], initValue: 1, function: *)
