//
//  ViewController.swift
//  DragableView
//
//  Created by Shinya Yamamoto on 2016/08/15.
//  Copyright © 2016年 Shinya Yamamoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    let appView = UIView(frame: CGRectMake(100,100,60,60))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        appView.backgroundColor = UIColor.redColor()
        appView.layer.cornerRadius = 8
        appView.clipsToBounds = true
        self.view.addSubview(appView)
        
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action:#selector(pan(_:)))
        appView.addGestureRecognizer(gestureRecognizer)
        
        let longGesture = UILongPressGestureRecognizer(target: self, action:#selector(longPress(_:)))
        appView.addGestureRecognizer(longGesture)
        
        gestureRecognizer.delegate = self
        longGesture.delegate = self
        
    }
    
    func longPress(seder: UILongPressGestureRecognizer) {
     
        let leftWobble = CGAffineTransformRotate(CGAffineTransformIdentity, CGFloat(-5 * M_PI / 180))
        let rightWobble = CGAffineTransformRotate(CGAffineTransformIdentity, CGFloat(5 * M_PI / 180))
        
        appView.transform = leftWobble //start
        UIView.beginAnimations("wobble", context: nil)
        UIView.setAnimationRepeatAutoreverses(true)
        UIView.setAnimationRepeatCount(10000)
        UIView.setAnimationDuration(0.1)
        UIView.setAnimationDelegate(self)
        UIView.setAnimationDidStopSelector(#selector(wobbleEnded))
        appView.transform = rightWobble // end here & auto-reverse
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
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

