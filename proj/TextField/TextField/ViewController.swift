//
//  ViewController.swift
//  TextField
//
//  Created by student on 2019/10/21.
//  Copyright © 2019 范茂伟. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        
        textField.placeholder = "iphone 11"
        textField.clearButtonMode = .always
        textField.isSecureTextEntry = true
    }

    @IBAction func searchBtn(_ sender: Any) {
        label.text = textField.text!
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()    // 隐藏键盘
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        label.text = textField.text!
    }
    
}

