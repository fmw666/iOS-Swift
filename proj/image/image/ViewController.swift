//
//  ViewController.swift
//  image
//
//  Created by student on 2019/11/7.
//  Copyright © 2019 fmw666. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1 设置图标
        // 2 设置启动图片
        // 3 放置ImageView
        // 4 图片选择器里面选择头像
        
        Thread.sleep(forTimeInterval: 1.0)  // 线程休眠，显示启动图片
        
        // 创建ImageView
        imageView = UIImageView(frame: CGRect(x: (self.view.bounds.width-200)/2, y: 100, width: 200, height: 200))
        imageView.backgroundColor = .lightGray
        imageView.layer.cornerRadius = 100
        imageView.layer.masksToBounds = true
        self.view.addSubview(imageView)
        
        // 创建按钮
        let btn = UIButton(frame: CGRect(x: 20, y: 350, width: self.view.bounds.width-40, height: 30))
        btn.setTitle("请选择头像", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.setTitleColor(.red, for: .highlighted)
        self.view.addSubview(btn)
        btn.addTarget(self, action: #selector(btnSelectImageAction), for: .touchDown)
    }


    // 按钮的目标动作方法
    @objc func btnSelectImageAction() {
        // 创建图片选择器
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        // imagePicker.sourceType = .camera // 启动设备摄像头
        imagePicker.allowsEditing = true    // 支持编辑
        present(imagePicker, animated: true, completion: nil)
    }
    
    // MARK: UIImagePicker Delegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let selImage = info[.originalImage] as! UIImage
        imageView.image = selImage
        
        dismiss(animated: true, completion: nil)    // 关闭模态对话框
    }
}

