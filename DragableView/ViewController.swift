//
//  ViewController.swift
//  DragableView
//
//  Created by Shinya Yamamoto on 2016/08/15.
//  Copyright © 2016年 Shinya Yamamoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let view = UIView(frame: CGRectMake(0,0,60,60))
        view.backgroundColor = UIColor.redColor()
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        self.view.addSubview(view)
        
    
        
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action:#selector(pan(_:)))
        view.addGestureRecognizer(gestureRecognizer)
        
        
        
        let leftWobble = CGAffineTransformRotate(CGAffineTransformIdentity, CGFloat(-3 * M_PI / 180))
        let rightWobble = CGAffineTransformRotate(CGAffineTransformIdentity, CGFloat(3 * M_PI / 180))
        
        view.transform = leftWobble //start
        UIView.beginAnimations("wobble", context: nil)
        UIView.setAnimationRepeatAutoreverses(true)
        UIView.setAnimationRepeatCount(10000)
        UIView.setAnimationDuration(0.1)
        UIView.setAnimationDelegate(self)
        UIView.setAnimationDidStopSelector(#selector(wobbleEnded))
        
        view.transform = rightWobble // end here & auto-reverse
        
        UIView.commitAnimations()
        
        
    }
    
    func wobbleEnded() {
        
        //item.transform = CGAffineTransformIdentity;
    }

    @IBAction func pan(sender: UIPanGestureRecognizer) {
        
        let translation = sender.translationInView(self.view)
        
        sender.view!.center = CGPoint(x: sender.view!.center.x + translation.x, y: sender.view!.center.y + translation.y)
        
        sender.setTranslation(CGPointZero, inView: self.view)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

