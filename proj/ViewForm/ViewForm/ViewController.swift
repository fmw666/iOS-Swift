//
//  ViewController.swift
//  ViewForm
//
//  Created by student on 2019/10/12.
//  Copyright © 2019 范茂伟. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        /*
         backgroudcolor属性：设置视图背景颜色
         alpha属性：设置视图透明度
         hidden属性：设置视图隐藏状态
         */
//        self.view.backgroundColor = UIColor.red
//        self.view.alpha = 0.3
//        self.view.isHidden = true
        
//        let rect = CGRect(x: 50, y: 50, width: 200, height: 300)
//        let subView1 = UIView(frame: rect)
//        subView1.backgroundColor = UIColor.red
//        self.view.addSubview(subView1)
//
//        let subView2 = UIView(frame: CGRect(x: 100, y: 100, width: 200, height: 300))
//        subView2.backgroundColor = UIColor.orange
//        self.view.addSubview(subView2)
//
//        let subView4 = UIView(frame: CGRect(x: 200, y: 200, width: 200, height: 300))
//        subView4.backgroundColor = UIColor.green
//        self.view.addSubview(subView4)
//
//        let subView3 = UIView(frame: CGRect(x: 150, y: 150, width: 200, height: 300))
//        subView3.backgroundColor = UIColor.yellow
//        self.view.insertSubview(subView3, belowSubview: subView4)
//
//        self.view.bringSubviewToFront(subView1)
//
//        self.view.exchangeSubview(at: 0, withSubviewAt: 1)
//
//        subView4.removeFromSuperview()
        
        // 获取屏幕尺寸
        let screenWidth = Int(self.view.bounds.width)
        let screenHeight = Int(self.view.bounds.height)
        
        for _ in 0..<100 {
            // 随机生成子视图坐标
            let x = Int(arc4random()) % screenWidth - 65
            let y = Int(arc4random()) % screenHeight
            let rect = CGRect(x: x, y: y, width: 130, height: 30)
        
            // 创建label对象
            let label = UILabel(frame: rect)
            label.text = "Hello Student Fan"
            label.textColor = randomColor()
            
            // 添加子视图
            self.view.addSubview(label)
        }
    }
    func randomColor() -> UIColor {
        switch arc4random() % 7 {
        case 0:
            return UIColor.red
        case 1:
            return UIColor.orange
        case 2:
            return UIColor.yellow
        case 3:
            return UIColor.green
        case 4:
            return UIColor.cyan
        case 5:
            return UIColor.blue
        case 6:
            return UIColor.purple
        default:
            return UIColor.black
        }
    }

}

