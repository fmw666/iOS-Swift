//
//  VCSecond.swift
//  Transfer Parameter
//
//  Created by student on 2019/12/5.
//  Copyright © 2019 fmw666. All rights reserved.
//

import UIKit

protocol EditBgColorDelegate {
    func editBgColor(_ color: UIColor)
}

class VCSecond: UIViewController {
    
    var delegate: EditBgColorDelegate?
    var blockSetColor: ((UIColor)->())?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "第二页"

        // layout
        let btn1 = UIButton(frame: CGRect(x: 20, y: 200, width: self.view.bounds.width-40, height: 30))
        btn1.setTitle("设置上一页背景为红色（参数方法）", for: .normal)
        btn1.setTitleColor(.red, for: .normal)
        btn1.layer.backgroundColor = UIColor.lightGray.cgColor
        btn1.addTarget(self, action: #selector(btn1Action(button:)), for: .touchDown)
        self.view.addSubview(btn1)
        
        let btn2 = UIButton(frame: CGRect(x: 20, y: 260, width: self.view.bounds.width-40, height: 30))
        btn2.setTitle("设置上一页背景为蓝色（代理方法）", for: .normal)
        btn2.setTitleColor(.blue, for: .normal)
        btn2.layer.backgroundColor = UIColor.lightGray.cgColor
        btn2.addTarget(self, action: #selector(btn2Action(button:)), for: .touchDown)
        self.view.addSubview(btn2)
        
        let btn3 = UIButton(frame: CGRect(x: 20, y: 320, width: self.view.bounds.width-40, height: 30))
        btn3.setTitle("设置上一页背景为绿色（闭包方法）", for: .normal)
        btn3.setTitleColor(.green, for: .normal)
        btn3.layer.backgroundColor = UIColor.lightGray.cgColor
        btn3.addTarget(self, action: #selector(btn3Action(button:)), for: .touchDown)
        self.view.addSubview(btn3)
    }
    
    @objc func btn3Action(button: UIButton) {
        blockSetColor!(UIColor.green)
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func btn2Action(button: UIButton) {
        if delegate != nil {
            delegate?.editBgColor(.blue)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @objc func btn1Action(button: UIButton) {
        let vc1 = self.navigationController?.viewControllers[(self.navigationController?.viewControllers.count)!-2] as! VCFirst
        
        vc1.setBgColor(color: UIColor.red)
        self.navigationController?.popViewController(animated: true)
    }
    
    public func setBgColor(color: UIColor) {
        self.view.backgroundColor = color
    }

}
