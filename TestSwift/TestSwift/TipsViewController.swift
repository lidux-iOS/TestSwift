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
        
        testAutoClosure(2>1)
        
        testStruct()
        
        
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
        _ = ClassB.init(name: <#T##String#>)
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
    
}

class ClassB: ClassA {
    var nameB : String
    
    override init(name: String) {
        nameB = name
        super.init(name: (name+nameB))
    }
    
}

