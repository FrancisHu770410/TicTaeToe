//
//  TicTaeToeController.swift
//  TicTaeToeForSwift
//
//  Created by 胡珀菖 on 2015/11/3.
//  Copyright © 2015年 胡珀菖. All rights reserved.
//

import UIKit

class TicTaeToeController: UIViewController {

    let tictaetoeView = TicTaeToeView()
    let tictaetoeModel = TicTaeToeModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = tictaetoeView
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        let touch = touches.first! as UITouch
        let touchCenter = tictaetoeModel.findCenterWithPoint(touch.locationInView(self.view))
        
        if (touchCenter as NSString).length > 0 && tictaetoeView.xArray.indexOfObject(touchCenter) > tictaetoeView.xArray.count && tictaetoeView.circleArray.indexOfObject(touchCenter) > tictaetoeView.circleArray.count {
            if tictaetoeView.isCircle {
                tictaetoeView.circleArray.addObject(touchCenter)
                tictaetoeView.isCircle = false
            } else {
                tictaetoeView.xArray.addObject(touchCenter)
                tictaetoeView.isCircle = true
            }
        }
        
        if self.tictaetoeModel.findWinnerWithArray(self.tictaetoeView.circleArray) {
            let alertController = UIAlertController(title: "系統訊息", message: "oo贏惹", preferredStyle: UIAlertControllerStyle.Alert)
            let endAction = UIAlertAction(title: "確定", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in
                alertController.dismissViewControllerAnimated(true, completion: { () -> Void in
                })
                self.tictaetoeView.resetAction()
            }
            alertController.addAction(endAction)
            self.presentViewController(alertController, animated: true, completion: { () -> Void in
                
            })
            
        } else if self.tictaetoeModel.findWinnerWithArray(self.tictaetoeView.xArray) {
            let alertController = UIAlertController(title: "系統訊息", message: "xx贏惹", preferredStyle: UIAlertControllerStyle.Alert)
            let endAction = UIAlertAction(title: "確定", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in
                alertController.dismissViewControllerAnimated(true, completion: { () -> Void in
                    
                })
                self.tictaetoeView.resetAction()
            }
            alertController.addAction(endAction)
            self.presentViewController(alertController, animated: true, completion: { () -> Void in
                
            })
        } else if self.tictaetoeView.circleArray.count + self.tictaetoeView.xArray.count == 9 {
            let alertController = UIAlertController(title: "系統訊息", message: "平手惹", preferredStyle: UIAlertControllerStyle.Alert)
            let endAction = UIAlertAction(title: "確定", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in
                alertController.dismissViewControllerAnimated(true, completion: { () -> Void in
                    
                })
                self.tictaetoeView.resetAction()
            }
            alertController.addAction(endAction)
            self.presentViewController(alertController, animated: true, completion: { () -> Void in
                
            })
        }
        
        self.tictaetoeView.setNeedsDisplay()
    }

}
