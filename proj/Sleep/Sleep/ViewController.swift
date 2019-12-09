//
//  ViewController.swift
//  Sleep
//
//  Created by student on 2019/11/7.
//  Copyright © 2019 fmw666. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 1 获取屏幕的宽度和高度
    // 2 随机位置创建Label
    // 3 添加动画
    
    let SCREEN_WIDTH = Int(UIScreen.main.bounds.width)
    let SCREEN_HEIGHT = Int(UIScreen.main.bounds.height)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 0..<100 {
            let startX = Int(arc4random()) % SCREEN_WIDTH - 65
            let startY = Int(arc4random()) % SCREEN_HEIGHT
            
            // 随机创建Label
            let label = UILabel(frame: CGRect(x: startX, y: startY, width: 130, height: 30))
            label.text = "Hello fmw666."
            label.textColor = randomColor()
            self.view.addSubview(label)
            
            // 设置动画
            let endX = Int(arc4random()) % SCREEN_WIDTH - 65
            let endY = Int(arc4random()) % SCREEN_HEIGHT
            
            UIView.animate(withDuration: 3, delay: 0, options: [.repeat, .autoreverse], animations: {
                label.frame.origin = CGPoint(x: endX, y: endY)
                label.alpha = 0
            }, completion: nil)
        }
    }

    func randomColor() -> UIColor {
        switch arc4random()%7 {
        case 0:
            return .red
        case 1:
            return .orange
        case 2:
            return .yellow
        case 3:
            return .green
        case 4:
            return .cyan
        case 5:
            return .blue
        case 6:
            return .purple
        default:
            return .black
        }
    }

}

