//
//  AppDelegate.swift
//  Contacts
//
//  Created by student on 2019/12/9.
//  Copyright © 2019 fmw666. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        let vcFavorites = VCFavorites()
        let vcRecent = VCRecent()
        let vcContacter = VCContacter()
        
        let navFavorites = UINavigationController(rootViewController: vcFavorites)
        let navRecent = UINavigationController(rootViewController: vcRecent)
        let navContacter = UINavigationController(rootViewController: vcContacter)
        
        let tabBar = UITabBarController()
        tabBar.viewControllers = [navFavorites, navRecent, navContacter]
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = tabBar
        
        vcFavorites.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 101)
        vcRecent.tabBarItem = UITabBarItem(tabBarSystemItem: .recents, tag: 201)
        vcContacter.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 301)

//        vcFavorites.title = "个人收藏"
//        vcRecent.title = "最近通话"
//        vcContacter.title = "联系人"
            
        return true
    }

}

