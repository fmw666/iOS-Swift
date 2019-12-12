//
//  ViewController.swift
//  Pop Animate
//
//  Created by student on 2019/12/12.
//  Copyright © 2019 fmw666. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var imgContent: UIImageView!
    var isHide = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let addBtn = UIButton(frame: CGRect(x: self.view.bounds.width-45, y: 20, width: 60, height: 60))
        addBtn.setTitle("+", for: .normal)
        addBtn.setTitleColor(.black, for: .normal)
        addBtn.setTitleColor(.black, for: .highlighted)
        addBtn.addTarget(self, action: #selector(btnAction(_:)), for: .touchDown)
        self.view.addSubview(addBtn)
        
        let image = UIImage(named: "QQMenu")
        imgContent = UIImageView(frame: CGRect(x: self.view.bounds.width-20, y: 50, width: 20, height: 20))
        imgContent.frame.size = CGSize(width: 0, height: 0)
        imgContent.image = image
        self.view.addSubview(imgContent)
    }
    
    @objc func btnAction(_ sender: UIButton) {
        if isHide {
            UIView.animate(withDuration: 1, animations: {
                self.imgContent.frame.size = CGSize(width: 150, height: 200)
                self.imgContent.frame.origin.x = self.view.bounds.width - 175
            }, completion: nil)
            isHide = false
        } else {
            UIView.animate(withDuration: 1, animations: {
                self.imgContent.frame.size = CGSize(width: 0, height: 0)
                self.imgContent.frame.origin.x = self.view.bounds.width - 20
            }, completion: nil)
            isHide = true
        }
        
    }
    
}


