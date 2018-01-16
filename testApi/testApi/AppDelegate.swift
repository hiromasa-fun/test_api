//
//  AppDelegate.swift
//  testApi
//
//  Created by 川北紘正 on 2018/01/16.
//  Copyright © 2018年 川北紘正. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var navigationController: UINavigationController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // rootになるViewControllerの設定
        let root: ViewController = ViewController()
        navigationController = UINavigationController(rootViewController: root)
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = navigationController
        return true
        
    }
    
    func applicationWillResignActive(_ application: UIApplication) {}
    
    func applicationDidEnterBackground(_ application: UIApplication) {}
    
    func applicationWillEnterForeground(_ application: UIApplication) {}
    
    func applicationDidBecomeActive(_ application: UIApplication) {}
    
    func applicationWillTerminate(_ application: UIApplication) {}
    
    
}

