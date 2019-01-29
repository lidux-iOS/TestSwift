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
        
        
        collectionUsingBLock()
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
