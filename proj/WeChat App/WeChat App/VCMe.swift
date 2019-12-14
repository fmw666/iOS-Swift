//
//  VCMe.swift
//  WeChat App
//
//  Created by student on 2019/12/12.
//  Copyright © 2019 fmw666. All rights reserved.
//

import UIKit

class VCMe: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        self.navigationItem.title = "我"
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 64, width: self.view.bounds.width, height: 622))
        imageView.image = UIImage(named: "微信我截图")
        self.view.addSubview(imageView)
    }
    
}
