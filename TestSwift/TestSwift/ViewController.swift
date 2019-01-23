//
//  ViewController.swift
//  TestSwift
//
//  Created by dx l on 2018/9/19.
//  Copyright © 2018年 dx l. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 初见
        
        /** 1、简单值
         *  如果初始值没有提供足够的信息（或者没有初始值），那你需要在变量后面声明类型，用冒号分割。
         *  值永远不会被隐式转换为其他类型。如果你需要把一个值转换成其他类型，请显式转换
         */
        
        let apple = 3
        let appleSummary = "i have \(apple) apples"
        let appleSummary2 = "my apple number is:" + String(apple)
        print(appleSummary)
        print(appleSummary2)
        
        var shoppingList = ["catfish","water"]
        shoppingList.append("tulips")
        var occupations = ["Malcolm": "Caption","Kayless": "Mechanic","Score":21.1] as [String : Any]
        occupations["Name"] = 221
        print(shoppingList)
        print(occupations)
        
        let emptyArr = [String]()
        let emptyDict = [String:Any]()
        print(emptyArr,emptyDict)
        
        
        
        //MARK:-
        //MARK:控制流
        //MARK:-
        
        let individualScores = [75,54,65,25,35]
        var teamScore = 0
        var average = 0.0 as Float
        for score in individualScores {
            if score > 50 {
                teamScore += 3
            } else {
                teamScore += 1
            }
        }
        average = Float(teamScore)/Float(individualScores.count)
        print(teamScore,average)
        
        
        print("\n============================\n\n")
        //可以一起使用if和let来处理值缺失的情况。有些变量的值是可选的，一个可选的值可能是一个具体的值或者是nil，表示值缺失。在类型后面加一个问号来标记这个变量的值是可选的。
        var optionalString : String?
        if let name = optionalString {
            print(name)
        } else {
            print("nil optionalString")
            optionalString = "nil"
        }
        
        //switch支持任意类型的数据以及各种比较操作
        // 运行switch中匹配到的子句之后，程序会退出switch语句，并不会继续向下运行，所以不需要在每个子句结尾写break。
        let vegetable = "sss"
        switch vegetable {
        case "red":
            print("red")
        case "green","yellow":
            print("green or yellow")
        case let x where x.hasPrefix("ss"):
            print("sss")
        default:
            print("other color")
        }
        
        
        // 你可以在循环中使用..<来表示范围，也可以使用传统的写法，两者是等价的：
        // 使用..<创建的范围不包含上界，如果想包含的话需要使用...。
        var firstForLoop = 0
        for i in 0..<4 {
            // 0 1 2 3
            print(i)
            firstForLoop += 1
        }
        for i in 0...4 {
            // 0 1 2 3 4
            print(i)
        }
//        for var i = 0;i < 4;i++ {
//            firstForLoop += 1
//        }
        print("firstForLoop = \(firstForLoop)")
        
        for _ in 0..<10 {
            print("aaa")
        }
        
        //MARK:-
        //MARK:函数和闭包
        //MARK:-

        /**
         *  使用func来声明一个函数，使用名字和参数来调用函数。使用->来指定函数返回值。
         */
        
        func greet(name:String,day:String) -> String {
            return name + " is " + day
        }
        let nameStr = greet(name: "ldx", day: "23")
        print(nameStr)
        
        /**
         *  使用元组来让一个函数返回多个值。该元组的元素可以用名称或数字来表示。
         */
        
        func calculateStatistics(scores:[Int]) -> (min:Int,max:Int,sum:Int) {
            var min = 0
            var max = 0
            var sum = 0
            
            if scores.count > 0 {
                min = scores[0]
                max = scores[0]
                
                for score in scores {
                    if score > max {
                        max = score
                    } else if score < min{
                        min = score
                    }
                    
                    sum += score
                }
            }
            return (min,max,sum)
        }
        
        let statistics = calculateStatistics(scores: [6,5,8,8,9,6,4,7,11,2])
        print(statistics)
        
        /**
         *  函数可以带有可变个数的参数，这些参数在函数内表现为数组的形式：
         */
        func sumOf(numbers: Int...) ->Int {
            var sum = 0
            for number in numbers {
                sum += number
            }
            return sum
        }
        
        let sumofList = sumOf(numbers: 1,2,3,4,5,6)
        print("sumofList = \(sumofList)")
        
        /**
         *  函数可以嵌套。被嵌套的函数可以访问外侧函数的变量，你可以使用嵌套函数来重构一个太长或者太复杂的函数。
         */
        
        func returnFifteen() -> Int {
            var y = 10
            func add() {
                y += 5
            }
            add()
            return y
        }
        
        let testY = returnFifteen()
        print("testY=\(testY)")
        
        /**
         *  函数是第一等类型，这意味着函数可以作为另一个函数的返回值。
         */
        
        func makeIncrementer() -> ((Int) -> Int) {
            func addOne(number:Int) ->Int {
                return number + 1
            }
            return addOne
        }
        
        let funcVar = makeIncrementer()
        print(funcVar(10))
        
        /**
         *  函数也可以当做参数传入另一个函数。
         */
        
        func hasAnyMatchs(_ list:[Int], condition: (Int) ->Bool) ->Bool {
            for item in list {
                if condition(item) {
                    return true
                }
            }
            return false
        }
        func lessThanTen(_ number:Int) ->Bool {
            return number < 10
        }
        let isHasLessThanTen = hasAnyMatchs([11,22,31,2], condition: lessThanTen)
        print("isHasLessThanTen----%%d",isHasLessThanTen);
        
        
        /**
         *  函数实际上是一种特殊的闭包，你可以使用{}来创建一个匿名闭包。使用in将参数和返回值类型声明与闭包函数体进行分离。
         */
        
        let numbers = [11,22,31,2]
        numbers.map { (num:Int) -> Void in
            print(num)
        }
        
        
        
        //MARK:-
        //MARK:对象和类
        //MARK:-

        let shape = NamedShape(name: "sanjiao")
        shape.numberIfSides = 3
        let simpleDesc = shape.simpleDescription()
        print(simpleDesc)
        
        
        
        let square = Square(sideLength: 5.2, name: "myTestSquare")
        let squareStr = square.simpleDescription()
        print(squareStr)
        
        
        //MARK:-
        //MARK:枚举和结构体
        //MARK:-

        enum Rank: Int {
            case Ace = 5
            case Two, Three, Four, Five
            case Jack, Queen
            
            func simpleDescription() -> String {
                switch self {
                case .Ace:
                    return "ace"
                case .Jack:
                    return "jack"
                case .Queen:
                    return "queen"
                default:
                    return String(self.rawValue)
                }
            }
        }
    
        let ace = Rank.Five
        
        let aceRawValue = ace.rawValue// 1,2,3,4,5,6
        let aceHashValue = ace.hashValue// 枚举中的位置
        /** log
         *  Five、9、4
         */
        
        print(ace)
        print(aceRawValue)
        print(aceHashValue)
        
        if let convertedRank = Rank(rawValue: 6) {
            print("有此枚举:\(convertedRank.simpleDescription())")
        }
        
        

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//MARK:-
//MARK:协议和扩展
//MARK:-
/** mutating
 *  在Swift中，包含三种类型(type): structure,enumeration,class
    其中structure和enumeration是值类型(value type),class是引用类型(reference type)
    structure和enumeration也可以拥有方法(method)，其中方法可以为实例方法(instance method)，也可以为类方法(type method)，实例方法是和类型的一个实例绑定的。
 
 *  虽然结构体和枚举可以定义自己的方法，但是默认情况下，实例方法中是不可以修改值类型的属性。
    为了能够在实例方法中修改属性值，可以在方法定义前添加关键字mutating.
    在值类型的实例方法中，也可以直接修改self属性值。
 */

protocol ExampleProtocol {
    var simpleDesc:String {get}
    mutating func adjust()
}


//MARK:-
//MARK:对象和类
//MARK:-



class NamedShape {
    var numberIfSides = 0
    var name :String
    
    /**
     *  注意self被用来区别实例变量。当你创建实例的时候，像传入函数参数一样给类传入构造器的参数。
     *  每个属性都需要赋值——无论是通过声明（就像numberOfSides）还是通过构造器（就像name）。
     */
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape named \(name) with \(numberIfSides) sides"
    }
}


class Square: NamedShape {
    var sideLength : Float
    
    init(sideLength: Float,name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberIfSides = 3
    }
    
    var perimeter: Double {
        get {
            return Double(3.0 * sideLength)
        }
        set {
            sideLength = Float(newValue / 3.0)
        }
//        willSet {
//            print(<#T##items: Any...##Any#>)
//        }
//
//        didSet {
//
//        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triagle with sides of length \(sideLength)"
    }
    
    
}


