//
//  ViewController.swift
//  LoginAnimate
//
//  Created by student on 2019/11/7.
//  Copyright © 2019 范茂伟. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var labelContent: UILabel!
    var isHide = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn = UIButton(frame: CGRect(x: 20, y: 50, width: self.view.bounds.width-40, height: 40))
        btn.setTitle("显示内容⬇️", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.setTitleColor(.red, for: .highlighted)
        btn.backgroundColor = .cyan
        btn.layer.cornerRadius = 20
        btn.layer.masksToBounds = true
        self.view.addSubview(btn)
        btn.addTarget(self, action: #selector(btnAction(_:)), for: .touchDown)
        
        labelContent = UILabel(frame: CGRect(x: 20, y: 100, width: self.view.bounds.width-40, height: 1))
        labelContent.backgroundColor = .cyan
        labelContent.textAlignment = .center
        self.view.addSubview(labelContent)
        
    }

    @objc func btnAction(_ sender: UIButton) {
        if isHide {
            sender.setTitle("隐藏内容⬆️", for: .normal)
            UIView.animate(withDuration: 1, animations: {
                self.labelContent.frame.size.height = 200
                self.labelContent.text = "用户名和密码"
            }, completion: nil)
            isHide = false
        } else {
            sender.setTitle("显示内容⬇️", for: .normal)
            UIView.animate(withDuration: 1, animations: {
                self.labelContent.frame.size.height = 1
            }, completion: {
                (Bool) -> () in self.labelContent.text = ""
            })
            isHide = true
        }
    }

}

