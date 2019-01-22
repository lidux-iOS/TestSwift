//
//  CollectionCopyViewController.swift
//  TestSwift
//
//  Created by dx l on 2018/11/15.
//  Copyright © 2018 dx l. All rights reserved.
//

import UIKit

class CollectionCopyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        /*  数组：
            1、数组里面是基本类型（包括结构和枚举）
                1.1、赋值，地址改变
                1.2、赋值后改变数组内元素，只会更改 对应更改的数组
                1.3、赋值后改变数组元素个数，只会更改 对应更改的数组
            2、数组里面不是基本类型
                2.1、赋值，地址不变
                2.2、赋值后改变数组内元素，只会更改对应更改的数组，地址改变
                2.3、赋值后改变数组内元素属性，地址不会改变，两个相应的数组内的元素属性都会改变
                2.4、赋值后改变数组元素个数，只会更改对应更改的数组，地址改变
            3、更改数组内的元素，地址改变
         */
        
        /*
            字典：
            只要是赋值，就会发发生地址的改变，不是基本类型元素也都是深copy
         */
        
        let model = TestModel.init(index: 2)
        let isModel = model[3]
        print(isModel)
        
        
        let arrr = [TestModel.init(index: 10),TestModel.init(index: 11),TestModel.init(index: 12),TestModel.init(index: 13)]
        let newArr = arrr.map {
            return $0.index
        }
        
        print(newArr)
        
        print(arrr)
        
        let newFilterArr = arrr.filter { (model:TestModel) -> Bool in
            return model.index == 10
        }
        
        print(newFilterArr)
        
        print(arrr)
        
//        let dict = ["1":TestModel.init(index: 2),"2":TestModel.init(index: 3)]
//        var dict2 = dict
//
//        print("dict",dict)
//        print("dict2",dict2)
//        print("dictAddress:",String(format: "%p", dict))
//        print("dict2Address:",String(format: "%p", dict2))
//
//
//        dict2["2"]?.index = 4
//
//        print("dict",dict)
//        print("dict2",dict2)
//        print("dictAddress:",String(format: "%p", dict))
//        print("dict2Address:",String(format: "%p", dict2))
//
//
//
//        dict2["3"] = TestModel.init(index: 5)
//
//        print("dict",dict)
//        print("dict2",dict2)
//        print("dictAddress:",String(format: "%p", dict))
//        print("dict2Address:",String(format: "%p", dict2))
        
        
//        let arrr = [TestModel.init(index: 1),TestModel.init(index: 2)]
//        let arrr = [TestStruct.init(width: 1.0),TestStruct.init(width: 2.0)]
//        let arrr = ["1","2"]
//        var arrr2 = arrr
//
//        print("arrr",arrr)
//        print("arrr2",arrr2)
//        print("arrrAddress:",String(format: "%p", arrr))
//        print("arrr2Address:",String(format: "%p", arrr2))
        
//        arrr2[0] = TestModel.init(index: 4)
//        arrr2[0] = TTestStruct.init(width: 4.0)
//        arrr2[0].width = 4.0
//        arrr2[0] = "4"
        
//        print("arrr",arrr)
//        print("arrr2",arrr2)
//        print("arrrAddress:",String(format: "%p", arrr))
//        print("arrr2Address:",String(format: "%p", arrr2))
        
//        arrr2.append(TestStruct.init(width: 3.0))
////        arrr2.append("3")
//        print("append----arrr",arrr)
//        print("append----arrr2",arrr2)
//        print("append----arrrAddress:",String(format: "%p", arrr))
//        print("append----arrr2Address:",String(format: "%p", arrr2))
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


class TestModel:NSObject {
    var index : Int
    
    init(index : Int) {
        self.index = index
        super.init()
    }
    override var description: String {
        return String(format: "testModel:%d", index)
    }
    subscript(index:Int) ->Bool {
       return self.index == index
    }
}

struct TestStruct {
    var width = 0.0
}
