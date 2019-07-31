//
//  BlockViewController.swift
//  TestSwift
//
//  Created by dx l on 2018/11/14.
//  Copyright © 2018 dx l. All rights reserved.
//

import UIKit

class BlockViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        ///闭包 简化过程
        // MARK: step1
//        let testBlock:(Int)->Int = {
//            (a:Int)->Int in
//            return a + 10
//        }
        
        // MARK: step2,去掉类型
//        let testBlock = {
//            (a:Int)->Int in
//            return a + 10
//        }
        // MARK: step3,
//        let testBlock = {
//            (a) in
//            return a + 10
//        }
        
        // MARK: step4,
//        let testBlock = {
//            return $0 + 10
//        }

        // MARK: step5, 只有一句return，可以省略return
        let testBlock = {
            $0 + $1 + 2.2
        }
        print(testBlock(2.2, 2.3))
        
        
        let myFirstClosure:(Int, Int) -> Int = {
            $1 + $0
        }
        let value = myFirstClosure(1,2)
        print(value)
        
        
//        collectionUsingBLock()
        step1()
    }
    
    fileprivate
    
    func step1() {
        typealias NamesClosures = (_ s1: String, _ s2: String) -> String
        
        var aNamesClosures: NamesClosures?
        
        /// 闭包的主体由in关键字引入。这个关键字表示闭包的参数和返回类型的定义已经完成，闭包的主体即将开始
//        aNamesClosures = { (_ s1: String, _ s2: String) -> String in
//            return s1 + s2;
//        }
        /// 因为Swift可以推断出它的参数类型以及它返回值的类型。所以可以省略返回箭头（->）和参数名称周围的括号(String: String)
//        aNamesClosures = { s1, s2 in
//            return s1 + s2;
//        }
        
        /// 单表达式闭包  可以隐式返回单个表达式的结果，所以我们可以省略关键字return
//        aNamesClosures = { s1, s2 in
//            s1 + s2;
//        }
        
        //由于swift自动为内联闭包提供速记参数名,参数名依照参数顺序指的是$0,$1,$2...
        //如果我们想省略闭包的参数列表，那么必须要在主体中实现所有参数值的简写
        //同时也可以省略in关键字，因为闭包表达式完全由其主体组成
        //在这里，$0和$1依次等于闭包中的String参数s1和s2
        
        aNamesClosures = {$0 + $1}
        
        print(aNamesClosures!("1000", "3"))
    }
    
    
    func collectionUsingBLock() {
        
        /**
         *  排序：sort、sorted
         *  遍历：forEach、filter、map、reduce
         */
        
        let names = [10,2,39,4,58,6,7,8]
        // sort() ：可变对象
        // sorted(): 不可变对象, 可以自定义规则
        let newNames = names.sorted()
        let newnames_desc = names.sorted {
            $0 > $1
        }
        print("newNames:\(newNames)")
        print("newnames_desc:\(newnames_desc)")
        
        
        
        names.forEach {
            print("each item:\($0)")
        }
        
        // 筛选
        let filterArr = names.filter {
            $0 > 10
        }
        print("filterArr:\(filterArr)")
        
        let mapNames = names.map { (value:Int) -> IntModel in
            return IntModel.init(value)
        }
        print("mapNames:\(mapNames)")
        
        
        //reduce: 初始化了一个initialResult为20，对元素做相加，每次相加后的结果作为下次闭包的参数，$1就是数组的每个元素
//        let reduceNames = names.reduce(20) { (x, y)->Int in
//            x + y
//        }
        let reduceNames = names.reduce(0) { (x, y) in
            x+y
        }
        
        print("reduceNames:\(reduceNames)")
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


class IntModel {
    var value : Int = 0
    
    init(_ number:Int) {
        self.value = number
    }
}
