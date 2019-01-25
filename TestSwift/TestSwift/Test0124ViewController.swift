//
//  Test0124ViewController.swift
//  TestSwift
//
//  Created by dx l on 2019/1/24.
//  Copyright © 2019 dx l. All rights reserved.
//

import UIKit

class Test0124ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        testProtoclMethods()
        testOptionalMap()
        
        // 宏在 build setting 里面设置
        #if TESTMACRO
        print("ttttt");
        #endif
    }
    
    func testOptionalMap() {
        let name : String? = "lili"
        let newName = name.map {
            $0 + "ds"
        }
        print(newName ?? "")
        
    }
    
    func testProtoclMethods() {
        let model = TestProtocolModel.init()
        model.method1()
        model.method2()
        
        let protocolModel : A1 = model as A1
        protocolModel.method1()
        protocolModel.method2()
        
        /** 协议方法和协议扩展方法的调用：
         *  1、类型推断是实际类型：类型中的实现被调用，类型中没有实现，协议扩展中的实现被调用
         *  2、类型推断得到的是协议，不是实际类型：方法在协议中进行了定义，name类型中的实现被调用（protocolModel.method1()），类型中没有实现，协议扩展中的方法实现被调用（protocolModel.method2()）；协议中没有定义的方法，默认扩展中的实现被调用。
         */
    }

}



protocol A1 {
    func method1()
    func myCopy() ->Self
    /**
     *  协议可选实现的方式：
     *  1、@objc optional 修饰，按照oc的方式实现，缺点是：只能用于class（继承于NSObject，或@objc修饰的class），不能修饰enum或struct
     *  2、协议扩展，扩展后默认实现的方法就变成了可选的类型。
     */
}

extension A1 {
    func method1() {
        print("method1 called in extension")
    }
    func method2() {
        print("method2 called in extension")
    }
}

final class TestProtocolModel: A1 {
    var name : String?
    
    /**
     *  required init() 方法
     *  final class,保证没有子类
     */
    
    func myCopy() -> Self {
        let newModel = type(of: self).init()
        newModel.name = name
        return newModel
    }
    
//    required init() {
//
//    }
    
    func method1() {
        print("method1 in model")
    }
    
    func method2() {
        print("method2 in model")
    }
    
    
}
