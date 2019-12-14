//
//  ViewController.swift
//  Alert
//
//  Created by student on 2019/10/21.
//  Copyright © 2019 范茂伟. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnAction(_ sender: UIButton) {
        let alertCtrl = UIAlertController(title: "你用手机做什么", message: "选择一下，你计划用手机做什么？", preferredStyle: .alert)
        
        // 创建提醒动作
        let actionB = UIAlertAction(title: "看B站", style: .default, handler: nil)
        let actionV = UIAlertAction(title: "追剧", style: .default, handler: nil)
        let actionClass = UIAlertAction(title: "看慕课", style: .default) { (actionClass) in self.label.text = "欢迎学习iOS课程"}
        let actionBoom = UIAlertAction(title: "手机自爆", style: .destructive, handler: nil)
        let actionCancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        
        // 添加到动作表中
        alertCtrl.addAction(actionB)
        alertCtrl.addAction(actionV)
        alertCtrl.addAction(actionClass)
        alertCtrl.addAction(actionBoom)
        alertCtrl.addAction(actionCancel)
        
        // 显示动作表
        present(alertCtrl, animated: true, completion: nil)
    }
    
}

