//
//  ViewController.swift
//  UILabel
//
//  Created by student on 2019/11/21.
//  Copyright © 2019 fmw666. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel(frame: CGRect(x: 20, y: 100, width: 280, height: 30))
        label.text = "Hello World"
        // 设置背景颜色
        label.backgroundColor = UIColor.red
        // 设置字体和字号
        label.font = UIFont.systemFont(ofSize: 23)
        // 设置字体颜色
        label.textColor = UIColor.white
        // 设置对齐模式
        label.textAlignment = .center
        // 设置引用颜色
        label.shadowColor = UIColor.green
        // 设置阴影偏移量
        label.shadowOffset = CGSize(width: 10, height: 10)
        // 设置断行模式
        label.lineBreakMode = .byWordWrapping
        self.view.addSubview(label)
    }


}

