//
//  VCFirst.swift
//  Navigation Controller
//
//  Created by student on 2019/12/5.
//  Copyright © 2019 fmw666. All rights reserved.
//

import UIKit

class VCFirst: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .yellow
        
        // layout
        let btnNext = UIButton(frame: CGRect(x: 20, y: 200, width: self.view.bounds.width-40, height: 30))
        btnNext.setTitle("下一页", for: .normal)
        btnNext.setTitleColor(.black, for: .normal)
        btnNext.addTarget(self, action: #selector(btnNextAction), for: .touchDown)
        self.view.addSubview(btnNext)
        
        // set nav
        self.navigationItem.title = "第一页"
        
        let btnRight = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(btnRightAction))
        self.navigationItem.rightBarButtonItem = btnRight
        
        let btnLeft = UIBarButtonItem(title: "编辑", style: .done, target: self, action: nil)
        self.navigationItem.leftBarButtonItem = btnLeft
        
    }
    
    @objc func btnNextAction() {
        let vc2 = VCSecond()
        self.navigationController?.pushViewController(vc2, animated: true)
    }

    @objc func btnRightAction() {
        print("press down")
    }
}
