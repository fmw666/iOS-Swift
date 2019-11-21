//
//  ViewController.swift
//  Hello World
//
//  Created by student on 2019/9/2.
//  Copyright © 2019年 fmw666. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let label = UILabel(frame: CGRect( x: 20, y: 100, width: 280, height: 30))
        
        label.text = "文本代码创建"
        self.view.addSubview(label)
    }

}

