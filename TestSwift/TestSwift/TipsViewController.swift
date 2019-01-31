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
        var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 0, secondValue: 0)
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
        
        bbb.newNameA = "dsa"
        
        
        ClassA.testClassFunction()
    }

}

struct FixedLengthRange {
    var firstValue : Int
    let length : Int
    var secondValue : Int
    
    var center : CGPoint {
        get {
            return CGPoint.init(x: self.firstValue, y: self.secondValue)
        }
        set {
            self.firstValue = Int(newValue.x)
            self.secondValue = Int(newValue.y)
        }
    }
}


class ClassA {
    var result : String
    
    var nameA : String {
        // init 方法中的赋值操作 会走get和set方法
        get {
            return self.result
        }
        set {
            self.result = newValue + newValue
        }
    }
    
    var newNameA : String = "" {
        // init 方法中的赋值操作不会走willSet和didSet方法
        willSet(newName) {
            print("new:\(newName)")
        }
        
        didSet{
            print("old:\(oldValue)")
        }
    }
    
    
    init(name:String) {
        result = ""
        self.nameA = name
        self.newNameA = name
    }
    // convenience swift初始化方法中的二等公民，只为提供补充和提供使用上的方便，所有的convenience初始化方法必须使用同类中的designated方法初始化设置。另外convenience初始化方法不能被子类重写，或从子类x中以super的方式调用。
    // 只要在子类中实现了父类的convenience方法所需的init方法，我们的子类就可以使用父类的convenience方法
    convenience init(isFamel:Bool) {
        self.init(name: (isFamel ? "lili":"mimi"))
    }
    
    required convenience init(age:Int) {
        self.init(name: age > 10 ? "age>10":"age<10")
    }
    
    class func testClassFunction() {
        print("testClassFunction")
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

