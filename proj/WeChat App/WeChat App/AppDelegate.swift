//
//  AppDelegate.swift
//  WeChat App
//
//  Created by student on 2019/12/12.
//  Copyright © 2019 fmw666. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let vcWechat = VCWechat()
        let vcContacter = VCContacter()
        let vcFind = VCFind()
        let vcMe = VCMe()
        
        // 导航栏文字样式
        let dict:NSDictionary = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        let navWechat = UINavigationController(rootViewController: vcWechat)
        // 导航栏背景设为黑色
        navWechat.navigationBar.barTintColor = UIColor.black
        // 导航栏文字设为白色
        navWechat.navigationBar.titleTextAttributes = dict as? [NSAttributedString.Key:AnyObject];
        
        let navContacter = UINavigationController(rootViewController: vcContacter)
        navContacter.navigationBar.barTintColor = UIColor.black
        navContacter.navigationBar.titleTextAttributes = dict as? [NSAttributedString.Key:AnyObject];
        
        let navFind = UINavigationController(rootViewController: vcFind)
        navFind.navigationBar.barTintColor = UIColor.black
        navFind.navigationBar.titleTextAttributes = dict as? [NSAttributedString.Key:AnyObject];
        
        let navMe = UINavigationController(rootViewController: vcMe)
        navMe.navigationBar.barTintColor = UIColor.black
        navMe.navigationBar.titleTextAttributes = dict as? [NSAttributedString.Key:AnyObject];
        
        
        let tabBar = UITabBarController()
        tabBar.viewControllers = [navWechat, navContacter, navFind, navMe]
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = tabBar
        
        var imgSelected1 = UIImage(named: "微信选中图标")
        var imgUnSelected1 = UIImage(named: "微信未选中图标")
        imgSelected1 = imgSelected1?.withRenderingMode(.alwaysOriginal)
        imgUnSelected1 = imgUnSelected1?.withRenderingMode(.alwaysOriginal)
        let tabBarItem1 = UITabBarItem(title: "微信", image: imgUnSelected1, selectedImage: imgSelected1)
        vcWechat.tabBarItem = tabBarItem1
        
        var imgSelected2 = UIImage(named: "通讯录选中图标")
        var imgUnSelected2 = UIImage(named: "通讯录未选中图标")
        imgSelected2 = imgSelected2?.withRenderingMode(.alwaysOriginal)
        imgUnSelected2 = imgUnSelected2?.withRenderingMode(.alwaysOriginal)
        let tabBarItem2 = UITabBarItem(title: "通讯录", image: imgUnSelected2, selectedImage: imgSelected2)
        vcContacter.tabBarItem = tabBarItem2
        
        var imgSelected3 = UIImage(named: "发现选中图标")
        var imgUnSelected3 = UIImage(named: "发现未选中图标")
        imgSelected3 = imgSelected3?.withRenderingMode(.alwaysOriginal)
        imgUnSelected3 = imgUnSelected3?.withRenderingMode(.alwaysOriginal)
        let tabBarItem3 = UITabBarItem(title: "发现", image: imgUnSelected3, selectedImage: imgSelected3)
        vcFind.tabBarItem = tabBarItem3
        
        var imgSelected4 = UIImage(named: "我选中图标")
        var imgUnSelected4 = UIImage(named: "我未选中图标")
        imgSelected4 = imgSelected4?.withRenderingMode(.alwaysOriginal)
        imgUnSelected4 = imgUnSelected4?.withRenderingMode(.alwaysOriginal)
        let tabBarItem4 = UITabBarItem(title: "我", image: imgUnSelected4, selectedImage: imgSelected4)
        vcMe.tabBarItem = tabBarItem4
        
        
        return true
    }
}

