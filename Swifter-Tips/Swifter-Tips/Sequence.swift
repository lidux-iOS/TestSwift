
//
//  Sequence.swift
//  Swifter-Tips
//
//  Created by dx l on 2020/5/8.
//  Copyright © 2020 dx l. All rights reserved.
//

import Foundation

/// 序列话

/// 迭代器
struct ReverseInterator<T>: IteratorProtocol {
    typealias Element = T
    
    var array: [Element]
    var currentIndex = 0
    
    init(array: [Element]) {
        self.array = array
        currentIndex = array.count - 1
    }
    
    mutating func next() -> Element? {
        if currentIndex < 0 {
            return nil
        } else {
            let element = self.array[currentIndex]
            currentIndex -= 1
            return element
        }
    }
}

struct ReverseSequence<T>: Sequence {
    var array: [T]
    
    init(array: [T]) {
        self.array = array
    }
    
    typealias Iterator = ReverseInterator<T>
    
    func makeIterator() -> ReverseInterator<T> {
        return ReverseInterator(array: self.array)
    }
}
