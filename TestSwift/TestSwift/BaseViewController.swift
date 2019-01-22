//
//  BaseViewController.swift
//  TestSwift
//
//  Created by dx l on 2018/9/19.
//  Copyright © 2018年 dx l. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 基础部分
        
        //MARK:-
        //MARK:类型安全和类型推断
        //MARK:-
        /**
         *  Swift 是一个类型安全（type safe）的语言。类型安全的语言可以让你清楚地知道代码要处理的值的类型。如果你的代码需要一个String，你绝对不可能不小心传进去一个Int。
         *  由于 Swift 是类型安全的，所以它会在编译你的代码时进行类型检查（type checks），并把不匹配的类型标记为错误。这可以让你在开发的时候尽早发现并修复错误。
         *  当你要处理不同类型的值时，类型检查可以帮你避免错误。然而，这并不是说你每次声明常量和变量的时候都需要显式指定类型。如果你没有显式指定类型，Swift 会使用类型推断（type inference）来选择合适的类型。有了类型推断，编译器可以在编译代码的时候自动推断出表达式的类型。原理很简单，只要检查你赋的值即可。
         */
        
        /**
         *  一个十进制数，没有前缀
         *  一个二进制数，前缀是0b
         *  一个八进制数，前缀是0o
         *  一个十六进制数，前缀是0x
         */
        
        let testLet = 2.3
        print(type(of: testLet))//Double
        
        
        // 类型别名
        typealias NotificationNameType = String
        
        
        /** 可选类型：处理值可能缺失
         *  有值，等于 x
         *  没有值
         *  可以使用if语句来判断一个可选是否包含值
         */
        var convertedNumber :String? = nil
        convertedNumber = "name"
        if convertedNumber != nil {
            print("has an integer value of \"\(convertedNumber!)\"")
        } else {
            print("convertedNumber could not be converted to an integer")
        }
        
        // 可选绑定 if while
//        if let constantName = someOptional {
//
//        }
//        if let actualNumber = possibleNumber.toInt() {
//            println("\(possibleNumber) has an integer value of \(actualNumber)")
//        } else {
//            println("\(possibleNumber) could not be converted to an integer")
//        }
        
        
        /**
         *  Swift 的nil和 Objective-C 中的nil并不一样。在 Objective-C 中，nil是一个指向不存在对象的指针。在 Swift 中，nil不是指针——它是一个确定的值，用来表示值缺失。任何类型的可选状态都可以被设置为nil，不只是对象类型。
         */
        
        
        //隐式解析可选类型
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
