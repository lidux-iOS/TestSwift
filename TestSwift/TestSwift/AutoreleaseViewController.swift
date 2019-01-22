//
//  AutoreleaseViewController.swift
//  TestSwift
//
//  Created by dx l on 2018/10/10.
//  Copyright © 2018 dx l. All rights reserved.
//

import UIKit

class AutoreleaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        DispatchQueue.init(label: "llll").async {
            NSLog("%@", Thread.current)
            
        }
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
