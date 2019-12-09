//
//  AppDelegate.swift
//  Transfer Parameter
//
//  Created by student on 2019/12/5.
//  Copyright © 2019 fmw666. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let vc1 = VCFirst()
        let nav = UINavigationController(rootViewController: vc1)
        
        window?.rootViewController = nav
        
        return true
    }
}

