//
//  AppDelegate.swift
//  TicTaeToeForSwift
//
//  Created by 胡珀菖 on 2015/11/3.
//  Copyright © 2015年 胡珀菖. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let tictaetoeController = TicTaeToeController()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window = UIWindow.init(frame: UIScreen.mainScreen().bounds)
        self.window?.rootViewController = tictaetoeController
        self.window?.makeKeyAndVisible()
        return true
    }



}

