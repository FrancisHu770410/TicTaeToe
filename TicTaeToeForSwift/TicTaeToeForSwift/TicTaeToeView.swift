//
//  TicTaeToeView.swift
//  TicTaeToeForSwift
//
//  Created by 胡珀菖 on 2015/11/3.
//  Copyright © 2015年 胡珀菖. All rights reserved.
//

import UIKit

class TicTaeToeView: UIView {
    
    var circleArray = NSMutableArray()
    var xArray = NSMutableArray()
    var isCircle = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        let currentContext = UIGraphicsGetCurrentContext()
        CGContextMoveToPoint(currentContext, 70, 200)
        CGContextAddLineToPoint(currentContext, 340, 200)
        CGContextMoveToPoint(currentContext, 70, 290)
        CGContextAddLineToPoint(currentContext, 340, 290)
        CGContextMoveToPoint(currentContext, 160, 110)
        CGContextAddLineToPoint(currentContext, 160, 380)
        CGContextMoveToPoint(currentContext, 250, 110)
        CGContextAddLineToPoint(currentContext, 250, 380)
        CGContextDrawPath(currentContext, CGPathDrawingMode.Stroke)
        CGContextSetStrokeColorWithColor(currentContext, UIColor.blackColor().CGColor)
        
        self.drawCircle(currentContext!)
        self.drawX(currentContext!)
    }
    
    func drawCircle(currentContext: CGContextRef) {
        for circleObject in circleArray {
            let districtRange = (circleObject as! NSString).rangeOfString(",")
            let centerX = (circleObject as! NSString).substringToIndex(districtRange.location)
            
            let centerY = (circleObject as! NSString).substringFromIndex(districtRange.location + districtRange.length)
            
            let xCenterValue = (centerX as NSString).floatValue
            let xValue = (centerX as NSString).floatValue + 30.0
            let yValue = (centerY as NSString).floatValue
            CGContextMoveToPoint(currentContext, CGFloat(xValue), CGFloat(yValue))
            CGContextAddArc(currentContext, CGFloat(xCenterValue), CGFloat(yValue), 30.0, 0, CGFloat(M_PI * 2), 0)
        }
        CGContextDrawPath(currentContext, CGPathDrawingMode.Stroke)

    }
    
    func drawX(currentContext: CGContextRef) {
        for xObject in xArray {
            let districtRange = (xObject as! NSString).rangeOfString(",")
            let centerX = (xObject as! NSString).substringToIndex(districtRange.location)
            
            let centerY = (xObject as! NSString).substringFromIndex(districtRange.location + districtRange.length)
            let xLeftValue = (centerX as NSString).floatValue - 30.0
            let yLeftValue = (centerY as NSString).floatValue - 30.0
            let xRightValue = (centerX as NSString).floatValue + 30.0
            let yRightValue = (centerY as NSString).floatValue + 30.0
            
            CGContextMoveToPoint(currentContext, CGFloat(xLeftValue), CGFloat(yLeftValue))
            CGContextAddLineToPoint(currentContext, CGFloat(xRightValue), CGFloat(yRightValue))
            CGContextMoveToPoint(currentContext, CGFloat(xRightValue), CGFloat(yLeftValue))
            CGContextAddLineToPoint(currentContext, CGFloat(xLeftValue), CGFloat(yRightValue))
        }
        CGContextDrawPath(currentContext, CGPathDrawingMode.Stroke)

    }
    
    func resetAction(_: Void) {
        self.circleArray = NSMutableArray()
        self.xArray = NSMutableArray()
        self.isCircle = true
        self.setNeedsDisplay()
    }
}
