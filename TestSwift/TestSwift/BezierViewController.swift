//
//  BezierViewController.swift
//  TestSwift
//
//  Created by dx l on 2018/10/26.
//  Copyright © 2018 dx l. All rights reserved.
//

import UIKit

class BezierViewController: UIViewController {

    var myLayer : CAShapeLayer?
    
    var testView : UIView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIView.animate(withDuration: 2) {
            
        }
        self.getACircle()
        
        let button = UIButton.init(type: UIButtonType.custom)
        button.frame = CGRect.init(x: 0, y: 44, width: 100, height: 30)
        button.backgroundColor = UIColor.green
        self.view.addSubview(button)
        button.addTarget(self, action: #selector(buttonAction), for: UIControlEvents.touchUpInside)
        
        self.testView = UIView.init(frame: CGRect.init(x: 0, y: 100, width: 100, height: 40))
        self.testView?.backgroundColor = UIColor.gray
        self.view.addSubview(self.testView!)
        
    }
    
    @objc func buttonAction() {
        myLayer?.removeFromSuperlayer()
        self.getACircle()
        
        var frame = self.testView?.frame
        frame?.origin.x = 0
        self.testView?.frame = frame ?? CGRect.zero
        self.testViewAnimation()
    }
    
    
    
    
    func testViewAnimation() {
        // ok
        UIView.animate(withDuration: 3) {
            var frame = self.testView?.frame
            frame?.origin.x = 200
            self.testView?.frame = frame ?? CGRect.zero
        };
    }
    
    func getACircle() -> Void {
        self.myLayer = CAShapeLayer.init()
        self.myLayer?.strokeColor = UIColor.red.cgColor
        self.myLayer?.lineWidth = 3;
//        myLayer.fillColor = UIColor.green.cgColor
        
        let path = UIBezierPath.init(arcCenter: self.view.center, radius: 100.0, startAngle: 0.0, endAngle: CGFloat(Double.pi), clockwise: true)
        self.myLayer?.path = path.cgPath;
        
        let anim = CABasicAnimation.init(keyPath: "strokeEnd")
        anim.fromValue = 0
        anim.toValue = 1
        anim.duration = 3
//         保持动画结束时的状态
//        anim.isRemovedOnCompletion = false
//        anim.fillMode = kCAFillModeForwards
        self.myLayer?.add(anim, forKey: "strokeEnd")
        self.view.layer.addSublayer(self.myLayer!)
        
    }
    
    deinit {
        
    }
    

}
