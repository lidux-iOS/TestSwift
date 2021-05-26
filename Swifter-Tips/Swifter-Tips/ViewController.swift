//
//  ViewController.swift
//  Swifter-Tips
//
//  Created by dx l on 2020/5/8.
//  Copyright © 2020 dx l. All rights reserved.
//

import UIKit


//struct Student {
//    var score = 0, name = ""
//}
// // case匹配
//extension Student {
//    static func ~= (pattern: Int, value: Student) -> Bool {
//        value.score >= pattern
//    }
//    static func ~= (pattern: Range<Int>, value: Student) -> Bool {
//        pattern.contains(value.score)
//    }
//    static func ~= (pattern: ClosedRange<Int>, value: Student) -> Bool {
//        pattern.contains(value.score)
//    }
//}
//
//// macOS/iOS/tvOS/watchOS/Linux/Android/Windows/FreeBSD
//#if os(macOS) || os(iOS)
//
//// i386/x86_74/arm/arm64
//#elseif arch(x86_64)
//
//#elseif swift(<5) || swift(>=3)
//
///// 模拟器环境
//#elseif targetEnvironment(simulator)
//
///// 可以导入框架
//#elseif canImport(Foundation)


//prefix operator ~>
//prefix func ~> (_ i: Int) -> ((Int)->Bool) { { $0 > i}}

//protocol TestProtocol {
//    func test1()
//}
//
//extension TestProtocol {
//    func test1() {
//        print("test1 - TestProtocol - extension")
//    }
//    func test2() {
//        print("test2 - TestProtocol - extension")
//    }
//}
//
//class TestClass: TestProtocol {}
//
//extension TestClass {
//    func test1() {
//        print("test1 - TestClass - extension")
//    }
//    func test2() {
//        print("test2 - 2")
//    }
//}

class Animal {
    var gender: Int? {
        willSet {
            yqlog(newValue)
        }
    }
    
    deinit {
        yqlog("Animal-deinit")
    }
}

final class PersonClass: Animal {
    var isTrue : Bool = false
//    open var value : Int?
//    public var value : Int?
    internal var value : Int?
//    private var value : Int?
//    fileprivate var value : Int?
    
    deinit {
        yqlog("deinit person")
    }
}

extension PersonClass: ExpressibleByBooleanLiteral {
    typealias BooleanLiteralType = Bool
    convenience init(booleanLiteral value: Bool) {
        self.init()
        isTrue = value
    }
}

extension Int: ExpressibleByBooleanLiteral {
    public typealias BooleanLiteralType = Bool
    public init(booleanLiteral value: BooleanLiteralType) {
        self = value ? 1 : 0
    }
}

struct Point {
    var x = 0.0
    var y = 0.0
    
    init?() {}
}

extension Point: ExpressibleByArrayLiteral, ExpressibleByDictionaryLiteral {
    init(arrayLiteral elements: Double...) {
        guard elements.count > 0 else { return }
        x = elements[0]
        guard elements.count > 1 else { return }
        y = elements[1]
    }
    
    init(dictionaryLiteral elements: (String, Double)...) {
        for (k, v) in elements {
            if k == "s" {
            
                x = v
            } else if k == "d" {
                y = v
            }
        }
    }
}

func yqlog(_ msgs: Any?..., file: NSString = #file, line: Int = #line, fn: String = #function) {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH-mm-ss.SSSSSS"
    let dattt = formatter.string(from: Date())
    let prefix = "\(dattt) 【\(file.lastPathComponent)】【\(line)】【\(fn)】"
    print(prefix, msgs)
}

class ViewController: UIViewController {
    
    static var age: Void = {
        print("12")
    }()
    
    func fib(_ n: Int) -> Int64 {
        if n < 2 {
            return Int64(n)
        }
        var last: Int64 = 1
        var lastLast: Int64 = 0
        var index: Int = 2
        while index < n {
            let tmp: Int64 = last
            last = last + lastLast
            lastLast = tmp
            index = index + 1
        }
        return lastLast + last
    }
    let pa = 701408733 + 433494437;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let date = Date()
        yqlog(1, 2, date)
        fib(2)
        
        
        
        let p: PersonClass = true
        
        print(p.isTrue, p.value ?? 0)
        
        
//        if case 0...9 = 2 {
//        }
//        guard case 0...9 = 2 else { return }
//        
//        var p3 :PersonClass? = PersonClass()
//        let p1 = PersonClass()
//        p3 = nil
        
//        yqlog(PersonClass.self == type(of: p1))
//        let ppp = p1.self
//        yqlog(ppp, type(of: ppp))
        
        
//        let age: [PersonClass?] = [p, p3, p2]
//        for case nil in age {
//            yqlog("ddd", "asd")
//        }
//
//        p3 = true
//        if case let x? = p3 {
//            print("xxx", x.isTrue)
//        }
        
        
//        let t = TestClass()
//        let ptr = unsafeBitCast(t, to: UnsafeRawPointer.self)
//        print(ptr)
//
//
//        t.test2()
//        let arrr = [0, 2, 4, 5, 6]
//        for item in ReverseSequence(array: arrr) {
//            print(item)
//        }
//
//        let p = Person("小米", 16)
//        let m = Mirror(reflecting: p)
//        print(m)
//        for child in m.children {
//            print(child.label ?? "")
//            print(child.value)
//        }
//
//        print("p.self = \(p.self)")
//
//        if 9 > 1 {
//            print("kklkkkk\(self)")
//        }
//
//        var arr = ["Pd", "p2", "As", "ds", "Mj"]
//        arr.sort { (p1, p2) -> Bool in
//            return false
//        }
//
//        let arrrr = arr.map { (str) -> String in
//            return str + "1"
//        }
//
//        let newArr = arr.sorted(by: >)
//
//        print(arrrr)
//        print(newArr)
//        print(arr)
//
//        let btn = UIButton(type: .custom)
//        btn.semanticContentAttribute = .forceLeftToRight
//
//
//
//        let str = "123456"
//        let subStr = str.prefix(2)
//        print(subStr)
        
//        let sem = DispatchSemaphore(value: 1)
//        sem.wait()
//        defer {
//            sem.signal()
//        }
        
//        let lock = NSRecursiveLock()
//        lock.lock()
//        lock.unlock()
        
        
//        let work1 = DispatchWorkItem {
////            for i in 0..<4 {
////                print("work1---\(i)")
////            }
//
//            print("work1-start")
//            sleep(5)
//            print("work1-end")
//        }
//        let work2 = DispatchWorkItem {
////            for i in 0..<4 {
////                print("work2---\(i)")
////            }
//
//            print("work2-start")
//            sleep(10)
//            print("work2-end")
//        }
//        let work3 = DispatchWorkItem {
//            for i in 0..<4 {
//                print("work3---\(i)")
//            }
//        }
//        let work4 = DispatchWorkItem {
//            for i in 0..<4 {
//                print("work4---\(i)")
//            }
//        }
        
//        let queue = DispatchQueue.global()
//        queue.async(execute: work1)
//        queue.async(execute: work2)
//        queue.async(execute: work3)
//        queue.async(execute: work4)
        // 串行队列，同步任务 ===> 死锁
        
//        print("over")
//        let group = DispatchGroup()
//        queue.async(group: group, execute: work1)
//        queue.async(group: group, execute: work2)
//        group.notify(queue: DispatchQueue.main) {
//            print("ok")
//        }
//        group.wait()
//        print("over-1")
    }
}


//class Person {
//    let name : String
//    let age: Int16
//    private let _nnn: Int16
//    init(_ aname:String, _ aAge:Int16) {
//        name = aname
//        age = aAge
//        _nnn = 1000
//    }
//
//}
