//
//  MethodSwizzlingViewController.swift
//  TestSwift
//
//  Created by dx l on 2019/8/13.
//  Copyright © 2019 dx l. All rights reserved.
//

import UIKit



class PersonModelClass {
    dynamic func sayHello() {
        print("sayHello")
    }
}

extension PersonModelClass {
    @_dynamicReplacement(for: sayHello())
    private func sayHelloA() {
        print("sayHelloA")
        sayHello()
    }
}

//extension UIViewController {
//    @_dynamicReplacement(for: viewDidLoad())
//    func viewDidLoadA() {
//        print("viewDidLoadA")
//        self.view.backgroundColor = UIColor.red
//        PersonModelClass().sayHello()
//        viewDidLoad();
//    }
//}


class MethodSwizzlingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        // Do any additional setup after loading the view.
        PersonModelClass().sayHello()
    }
}


