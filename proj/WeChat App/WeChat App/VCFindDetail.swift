//
//  VCFindDetail.swift
//  WeChat App
//
//  Created by student on 2019/12/12.
//  Copyright © 2019 fmw666. All rights reserved.
//

import UIKit

class VCFindDetail: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "朋友圈"
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        imageView.image = UIImage(named: "朋友圈截图")
        self.view.addSubview(imageView)
    }
    
}
