//
//  ViewController.swift
//  WebView
//
//  Created by student on 2019/10/28.
//  Copyright © 2019 范茂伟. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 创建视图
        let webView = UIWebView(frame: UIScreen.main.bounds)
        
        // 保存地址
        let url = URL(string: "https://github.com/fmw666")
        // url请求
        let urlRequest = NSURLRequest(url: url!)
        webView.loadRequest(urlRequest as URLRequest)
        
        self.view.addSubview(webView)
    }


}

