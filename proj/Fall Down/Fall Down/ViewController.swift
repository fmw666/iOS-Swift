//
//  ViewController.swift
//  Fall Down
//
//  Created by student on 2019/12/12.
//  Copyright © 2019 fmw666. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var segmented: UISegmentedControl!
    var imageView: UIImageView!
    
    // 物理环境
    var animator: UIDynamicAnimator!
    // iOS重力行为
    var gravity: UIGravityBehavior!
    // 碰撞
    var collision: UICollisionBehavior!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 初始化重力等一些物理因素
        animator = UIDynamicAnimator(referenceView: self.view)
        gravity = UIGravityBehavior()
        gravity.magnitude = 0.4
        collision = UICollisionBehavior()
        collision.translatesReferenceBoundsIntoBoundary = true
        // 碰撞添加
        animator.addBehavior(gravity)
        // 下落添加
        animator.addBehavior(collision)
        
        
        // 选项
        let items = ["正方形","圆角矩形","圆形"] as [AnyObject]
        // 创建分段选择控件
        segmented = UISegmentedControl(items: items)
        segmented.center = CGPoint(x: self.view.center.x, y: 40)
        segmented.selectedSegmentIndex = 0 // 默认选择第一项
        self.view.addSubview(segmented)
        // 添加 值改变 监听
        segmented.addTarget(self, action: #selector(segmentedDidChange), for: UIControl.Event.valueChanged)
    }
    
    /**
     监听方法
     */
    @objc func segmentedDidChange(segmented:UISegmentedControl) {
        // 下落图片
        let randomX = Int(arc4random()%UInt32(self.view.bounds.width-70))
        imageView = UIImageView(frame: CGRect(x: randomX, y: 70, width: 70, height: 70))
        imageView.image = UIImage(named: "image")
        
        // 重力
        if segmented.selectedSegmentIndex == 0 {
            
            self.view.addSubview(imageView)
            gravity.addItem(imageView)
            collision.addItem(imageView)
            
        } else if segmented.selectedSegmentIndex == 1 {
            
            imageView.layer.cornerRadius = 20
            imageView.layer.masksToBounds = true
            self.view.addSubview(imageView)
            gravity.addItem(imageView)
            collision.addItem(imageView)
            
        } else if segmented.selectedSegmentIndex == 2 {
            
            imageView.layer.cornerRadius = 35
            imageView.layer.masksToBounds = true
            self.view.addSubview(imageView)
            gravity.addItem(imageView)
            collision.addItem(imageView)
            
        }
    }
    
}

