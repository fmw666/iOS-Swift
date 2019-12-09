//
//  VCContacterDetail.swift
//  Contacts
//
//  Created by student on 2019/12/9.
//  Copyright © 2019 fmw666. All rights reserved.
//

import UIKit

class VCContacterDetail: UIViewController {
    
    var imageHeader: UIImage!
    var strName: String!
    var strID: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        let imageView = UIImageView(frame: CGRect(x: (self.view.bounds.width-200)/2, y: 100, width: 200, height: 200))
        imageView.image = imageHeader
        imageView.layer.cornerRadius = 100
        imageView.layer.masksToBounds = true
        self.view.addSubview(imageView)
        
        let labelName = UILabel(frame: CGRect(x: 0, y: 350, width: self.view.bounds.width, height: 30))
        labelName.text = strName
        labelName.textAlignment = .center
        labelName.font = UIFont.systemFont(ofSize: 30)
        self.view.addSubview(labelName)
        
        let labelID = UILabel(frame: CGRect(x: 0, y: 400, width: self.view.bounds.width, height: 30))
        labelID.textAlignment = .center
        labelID.text = strID
        self.view.addSubview(labelID)
        
        self.navigationItem.title = strName
    }
  
}
