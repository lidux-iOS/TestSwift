//
//  ProtocolTestViewController.swift
//  TestSwift
//
//  Created by dx l on 2019/7/31.
//  Copyright © 2019 dx l. All rights reserved.
//

import UIKit

class ProtocolTestViewController: UIViewController {

    var ppp: Person?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        // Do any additional setup after loading the view.
        ppp = Person()
        ppp?.name = "ll"
        
        let newP = ppp?.copy_bySelf()
        ppp?.name = "dd"
        
        let newP2 = ppp?.copy_bySelf222()
        ppp?.name = "xx"
    
    
        print("ppp:\(String(describing: ppp?.name)), newP:\(String(describing: newP?.name)), newP2:\(String(describing: newP2?.name))")
        
        let nmae = "name"
        ppp?.addObserver(self, forKeyPath: nmae, options: .new, context: nil)
        
        let num1: Int = 2
        let num2: Int = Int(3.2)
        print(testMin(num1, num2))
        
    }
    
    func testMin<T: Comparable>(_ a: T, _ b: T) -> T {
        return a < b ? a : b;
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        print(change ?? [:])
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.ppp!.name = self.ppp!.name! + self.ppp!.name!
    }

}

class Person: NSObject, Copyable {
    typealias T = Person
    
    func copy_bySelf() -> Self {
        /// t需要通过一个与当前上下文无关的，初始化
        let p = type(of: self).init()
        p.name = self.name
        return p
    }
    
    func copy_bySelf222() -> Person {
        let p = Person()
        p.name = self.name
        return p
    }
    
    /// 保证子类都能响应这个方法
    /// 或者使用final关键字
    required override init() {
        
    }
    
    @objc dynamic var name : String?
    
}


protocol Copyable {

    associatedtype T
    
    /// 协议本身没有上下文信息 Self指的实现协议的类型或子类的类型
    
    func copy_bySelf() -> Self
    
    func copy_bySelf222() -> T
}
