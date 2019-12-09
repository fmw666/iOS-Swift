//
//  VCRecent.swift
//  Contacts
//
//  Created by student on 2019/12/9.
//  Copyright © 2019 fmw666. All rights reserved.
//

import UIKit

class VCRecent: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        self.navigationItem.title = "最近通话"
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 64, width: self.view.bounds.width, height: 622))
        imageView.image = UIImage(named: "Recent_Screenshot")
        self.view.addSubview(imageView)
    }

}
