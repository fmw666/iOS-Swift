//
//  AppDelegate.swift
//  Navigation Controller
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
        
        let nav = UINavigationController()
        window?.rootViewController = nav
        
        let vc1 = VCFirst()
        nav.pushViewController(vc1, animated: true)
        
        
        return true
    }
}

