//
//  ProtocolTestViewController.swift
//  TestSwift
//
//  Created by dx l on 2019/7/31.
//  Copyright © 2019 dx l. All rights reserved.
//

import UIKit

class ProtocolTestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let ppp = Person()
        ppp.name = "ll"
        
        let newP = ppp.copy_bySelf()
        ppp.name = "dd"
        
        let newP2 = ppp.copy_bySelf222()
        ppp.name = "xx"
    
    
        print("ppp:\(String(describing: ppp.name)), newP:\(String(describing: newP.name)), newP2:\(newP2.name)")
        
    }

}

class Person: Copyable {
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
    required init() {
        
    }
    
    var name : String?
    
}


protocol Copyable {

    associatedtype T
    
    /// 协议本身没有上下文信息 Self指的实现协议的类型或子类的类型
    
    func copy_bySelf() -> Self
    
    func copy_bySelf222() -> T
}
