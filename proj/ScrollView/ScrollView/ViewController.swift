//
//  ViewController.swift
//  ScrollView
//
//  Created by student on 2019/10/28.
//  Copyright © 2019 范茂伟. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 实际尺寸
        scrollView.contentSize = CGSize(width: 3840/2.6, height: 2400/2.6)
        
        // 设置View属性——隐藏指示条
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        
        // 图像视图
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 3840/2.6, height: 2400/2.6))
        
        // 图像对象
        let image = UIImage(named: "food")
        imageView.image = image
        
        scrollView.addSubview(imageView)
    }


}

