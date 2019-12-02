//
//  ViewController.swift
//  Track Bullet
//
//  Created by student on 2019/12/2.
//  Copyright © 2019 fmw666. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tankImg: UIImageView!
    var bulletImg: UIImageView!
    var targetImg: UIImageView!
    
    // 物理环境
    var animator: UIDynamicAnimator!
    // 吸附行为
    var snap: UISnapBehavior!
    // 碰撞行为
    var collision: UICollisionBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 初始化重力等一些物理因素
        animator = UIDynamicAnimator(referenceView: self.view)
        collision = UICollisionBehavior()
        collision.translatesReferenceBoundsIntoBoundary = true
        // 碰撞添加
        animator.addBehavior(collision)
        
        // tank
        tankImg = UIImageView(frame: CGRect(x: 50, y: self.view.bounds.height - 150, width: 150, height: 150))
        tankImg.image = UIImage(named: "tank")
        tankImg.isUserInteractionEnabled = true
        tankImg.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(moveImg)))
        self.view.addSubview(tankImg)
        
        // target
        targetImg = UIImageView(frame: CGRect(x: self.view.bounds.width - 150, y: 50, width: 100, height: 100))
        targetImg.image = UIImage(named: "target")
        //开启 isUserInteractionEnabled 手势否则点击事件会没有反应
        targetImg.isUserInteractionEnabled = true
        targetImg.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(tankShoot)))
        targetImg.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(moveImg)))
        self.view.addSubview(targetImg)
    }

    // target 点击事件
    @objc func tankShoot() -> Void {
        bulletImg = UIImageView(frame: CGRect(x: self.tankImg.center.x+15, y: self.tankImg.center.y-80, width: 25, height: 60))
        bulletImg.image = UIImage(named: "bullet")
        self.view.addSubview(bulletImg)
        
        /* 子弹初始化后旋转动画
        // 创建动画
        let anim = CABasicAnimation(keyPath: "transform.rotation")
        // 设置动画属性
        anim.toValue = 1*Double.pi
        anim.duration = 1
        anim.speed = 1
        anim.isRemovedOnCompletion = false
        bulletImg.layer.add(anim, forKey: nil)
         */
        
        snap = UISnapBehavior(item: bulletImg, snapTo: self.targetImg.center)
        // 剧烈程度
        snap.damping = 1
        // 吸附添加
        collision.addItem(bulletImg)
        animator.addBehavior(snap)
    }
    
    //图片 拖动事件
    @objc func moveImg(sender: UIPanGestureRecognizer) {
        var point = sender.translation(in: self.view)
        point = sender.location(in: self.view)
        sender.view?.center = point
    }
}

