//
//  TipsViewController.swift
//  TestSwift
//
//  Created by dx l on 2019/1/18.
//  Copyright © 2019 dx l. All rights reserved.
//

import UIKit

class TipsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        
        testAutoClosure(2>1)
        
        testStruct()
        
        testConvenience()
        
    }
    
    func testStruct() {
        var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 0)
        let newRangeOfThreeItems = rangeOfThreeItems;// a new object  值类型赋值就是新对象
        rangeOfThreeItems.firstValue = 3
        
        print("rangeOfThreeItems---\(rangeOfThreeItems.firstValue)")
        print("newRangeOfThreeItems---\(newRangeOfThreeItems.firstValue)")
    }
    
    func testAutoClosure(_ block: @autoclosure ()->Bool){
        print(block())
    }
    
    func testConvenience() {
        // 此时可以调用，但是没有提示
        let bbb = ClassB.init(isFamel: false)
        print("nameA:\(bbb.nameA),nameB:\(bbb.nameB)")
        bbb.updateCell(10)
        
        let bbbb = ClassB.init(age: 20)
        print("nameA:\(bbbb.nameA),nameB:\(bbbb.nameB)")
        _ = bbbb.updateCellWithBackData(32)
        
    }

}

struct FixedLengthRange {
    var firstValue : Int
    let length : Int
    
}


class ClassA {
    var nameA : String
    init(name:String) {
        nameA = name
    }
    
    convenience init(isFamel:Bool) {
        self.init(name: (isFamel ? "lili":"mimi"))
    }
    
    required convenience init(age:Int) {
        self.init(name: age > 10 ? "age>10":"age<10")
    }
    
}

class ClassB: ClassA, ClassAProtocol {
    var nameB : String
    
    override init(name: String) {
        nameB = name
        super.init(name: (name+nameB))
    }
    
    typealias T = Int
    typealias M = Int
    func updateCell(_ data: Int) {
        print("updateCell:\(data)")
    }
    
    func updateCellWithBackData(_ data: Int) -> Int {
        print("updateCellWithBackData:\(data)")
        return data
    }
    
}

protocol ClassAProtocol {
    associatedtype T
    associatedtype M
    func updateCell(_ data: T)
    func updateCellWithBackData(_ data:T) -> M
}

