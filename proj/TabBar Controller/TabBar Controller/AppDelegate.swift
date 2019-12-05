//
//  AppDelegate.swift
//  TabBar Controller
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
        
        let vc1 = VCFirst()
        let vc2 = VCSecond()
        let vc3 = VCThird()
        let vc4 = VCForth()
        let vc5 = VCFifth()
        let vc6 = VCSixth()
        let vc7 = VCSeventh()
        
        // 创建分栏控制器
        let tabBar = UITabBarController()
        tabBar.viewControllers = [vc1, vc2, vc3, vc4, vc5, vc6, vc7]
        
        // 创建窗口
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = tabBar
        
        vc1.view.backgroundColor = .red
        vc2.view.backgroundColor = .orange
        vc3.view.backgroundColor = .yellow
        vc4.view.backgroundColor = .green
        vc5.view.backgroundColor = .cyan
        vc6.view.backgroundColor = .blue
        vc7.view.backgroundColor = .purple
        
        var imageSelected = UIImage(named: "通讯录选中图标")
        var imageUnSelected = UIImage(named: "通讯录未选中图标")
        imageSelected = imageSelected?.withRenderingMode(.alwaysOriginal)
        imageUnSelected = imageUnSelected?.withRenderingMode(.alwaysOriginal)
        let tabBarItem1 = UITabBarItem(title: "通讯录", image: imageUnSelected, selectedImage: imageSelected)
        vc1.tabBarItem = tabBarItem1
        
        let tabBarItem2 = UITabBarItem(tabBarSystemItem: .favorites, tag: 201)
        vc2.tabBarItem = tabBarItem2
        let tabBarItem3 = UITabBarItem(tabBarSystemItem: .downloads, tag: 301)
        vc3.tabBarItem = tabBarItem3
        let tabBarItem4 = UITabBarItem(tabBarSystemItem: .history, tag: 401)
        vc4.tabBarItem = tabBarItem4
        let tabBarItem5 = UITabBarItem(tabBarSystemItem: .search, tag: 501)
        vc5.tabBarItem = tabBarItem5
        let tabBarItem6 = UITabBarItem(tabBarSystemItem: .contacts, tag: 601)
        vc6.tabBarItem = tabBarItem6
        let tabBarItem7 = UITabBarItem(tabBarSystemItem: .mostViewed, tag: 701)
        vc7.tabBarItem = tabBarItem7
       
        // 背景透明
        tabBar.tabBar.isTranslucent = false
        
        tabBarItem1.badgeValue = "99+"
        tabBarItem3.badgeValue = "12"
        
        tabBar.selectedIndex = 2
        
        return true
    }

}

