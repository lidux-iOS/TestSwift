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

        
        let myFirstClosure: (Int, Int) -> Int = {
            print($0);
            return $1 + $0
        }
        let value = myFirstClosure(1,2)
        print(value)
        
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
