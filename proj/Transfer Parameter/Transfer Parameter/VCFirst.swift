//
//  VCFirst.swift
//  Transfer Parameter
//
//  Created by student on 2019/12/5.
//  Copyright © 2019 fmw666. All rights reserved.
//

import UIKit

class VCFirst: UIViewController, EditBgColorDelegate {
    
    func editBgColor(_ color: UIColor) {
        self.view.backgroundColor = color
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.navigationItem.title = "第一页"
        
        // layout
        let btn1 = UIButton(frame: CGRect(x: 20, y: 200, width: self.view.bounds.width-40, height: 30))
        btn1.setTitle("设置下一页背景为红色", for: .normal)
        btn1.setTitleColor(.red, for: .normal)
        btn1.layer.backgroundColor = UIColor.lightGray.cgColor
        btn1.addTarget(self, action: #selector(btnAction(button:)), for: .touchDown)
        self.view.addSubview(btn1)
        btn1.tag = 1
        
        let btn2 = UIButton(frame: CGRect(x: 20, y: 260, width: self.view.bounds.width-40, height: 30))
        btn2.setTitle("设置下一页背景为蓝色", for: .normal)
        btn2.setTitleColor(.blue, for: .normal)
        btn2.layer.backgroundColor = UIColor.lightGray.cgColor
        btn2.addTarget(self, action: #selector(btnAction(button:)), for: .touchDown)
        self.view.addSubview(btn2)
        btn2.tag = 2
    }
    
    @objc func btnAction(button: UIButton) {
        let vc2 = VCSecond()
        
        vc2.delegate = self
        vc2.blockSetColor = setBgColor
        
        if button.tag == 1 {
            vc2.setBgColor(color: .red)
        } else if button.tag == 2 {
            vc2.setBgColor(color: .blue)
        }
        
        self.navigationController?.pushViewController(vc2, animated: true)
    }
    
    func setBgColor(color: UIColor) {
        self.view.backgroundColor = color
    }

}
