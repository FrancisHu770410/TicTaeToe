//
//  TicTaeToeModel.swift
//  TicTaeToeForSwift
//
//  Created by 胡珀菖 on 2015/11/3.
//  Copyright © 2015年 胡珀菖. All rights reserved.
//

import UIKit

class TicTaeToeModel: NSObject {

    let centerArray = ["115,155", "205,155", "295,155", "115,245", "205,245", "295,245", "115,335", "205,335", "295,335"]
    let winArray = [["0", "1", "2"], ["3", "4", "5"], ["6", "7", "8"], ["0", "4", "8"], ["1", "4", "7"], ["2", "4", "6"], ["2", "5", "8"], ["0", "3", "6"]]
    
    func findCenterWithPoint(touchPoint: CGPoint) -> String {
        for center in centerArray {
            let districtRange = (center as NSString).rangeOfString(",")
            let centerX = (center as NSString).substringToIndex(districtRange.location)
            
            let centerY = (center as NSString).substringFromIndex(districtRange.location + districtRange.length)
            
            let centerMaxXValue = (centerX as NSString).floatValue + 45.0
            
            let centerMaxYValue = (centerY as NSString).floatValue + 45.0
            
            let centerMinXValue = (centerX as NSString).floatValue - 45.0
            
            let centerMinYValue = (centerY as NSString).floatValue - 45.0
            
            let centerMaxXCGValue = CGFloat(centerMaxXValue)
            let centerMinXCGValue = CGFloat(centerMinXValue)
            let centerMaxYCGValue = CGFloat(centerMaxYValue)
            let centerMinYCGValue = CGFloat(centerMinYValue)
            
            if centerMaxYCGValue > touchPoint.y && centerMinYCGValue < touchPoint.y && centerMaxXCGValue > touchPoint.x && centerMinXCGValue < touchPoint.x {
                
                return center
            }
        }
        return ""
    }
    
    func findWinnerWithArray(userArray: NSMutableArray) -> Bool {
        let tempIndexArray = NSMutableArray()
        for userPoint in userArray {
            tempIndexArray.addObject(centerArray.indexOf(userPoint as! String)!)
        }
        var tempWinCount = 0
        
        for winContentArray in winArray {
            tempWinCount = 0
            for winObj in winContentArray {
                let numberOfWinObj = NSNumberFormatter().numberFromString(winObj)
                if tempIndexArray.indexOfObject(numberOfWinObj!) < tempIndexArray.count {
                    tempWinCount++
                }
            }
            
            if tempWinCount == 3 {
                return true
            }
        }
        return false
    }
}
