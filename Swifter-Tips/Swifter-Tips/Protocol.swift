//
//  Protocol.swift
//  Swifter-Tips
//
//  Created by dx l on 2020/5/8.
//  Copyright © 2020 dx l. All rights reserved.
//

import UIKit


protocol MutatingMethodProtocol {
    
    
//    associatedtype MethodType
    
    var numOfWheels :Int{get}
    var color :UIColor{set get}
    /// mutating:为了能在协议方法中修改 struct 或是 enum 的变量, 对class是透明的
//    mutating func changeColor()
    
}

extension MutatingMethodProtocol {
    func changeColor() {
        print("协议扩展")
    }
}

struct MyCar: MutatingMethodProtocol {
    
    typealias MethodType = Int16
    
    let numOfWheels = 4
    
    var color: UIColor = .red
    
    mutating func changeColor() {
        color = .green
        print("协议实现")
    }
}


