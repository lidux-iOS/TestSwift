//
//  Test0129ViewController.swift
//  TestSwift
//
//  Created by dx l on 2019/1/29.
//  Copyright © 2019 dx l. All rights reserved.
//

import UIKit

class Test0129ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        testReduce()
        testInoutParam()
        namessssss(dddd: 10, 20)
    }
    
    func testReduce() {
        let arrr = [1, 2, 3, 4, 5]
        let value = arrr.reduce(15, +)
        print("testReduce_value:\(value)")
        let intoValue = 10
        let value22 = arrr.reduce(into: intoValue) {
            print($0)
            print($1)
            $0 = $0 + $1
        }
        
        print("value22:\(value22)")
        print("intoValue:\(intoValue)")
        
    }
    
    func namessssss(dddd: Int...) {
        print("namessssss:\(dddd)")
    }
    
    func testInoutParam() {
        /** 让值类型以引用方式传递
         *  通过一个函数改变函数外面变量的值(将一个值类型参数以引用方式传递).
         *   inout 修饰的参数是不能有默认值的，有范围的参数集合也不能被修饰；
         *   一个参数一旦被 inout 修饰，就不能再被 var 和 let 修饰了
         */
        
        var value = 30
        print("value:\(value)")
        
        incrementInoutValue(&value)
        print("change_value:\(value)")
        
    }
    
    func incrementInoutValue(_ value: inout Int) {
        value += 10
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
