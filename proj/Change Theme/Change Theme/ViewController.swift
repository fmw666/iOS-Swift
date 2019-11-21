//
//  ViewController.swift
//  Change Theme
//
//  Created by student on 2019/11/21.
//  Copyright © 2019 fmw666. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myLabel.backgroundColor = UIColor.yellow
        
        myLabel.text = "Hello fmw666.\nA Software Developer."
        myLabel.numberOfLines = 0
        myLabel.textColor = UIColor.blue
        myLabel.textAlignment = .center
        myLabel.font = UIFont(name: "Zapfino", size: 20)
    }

    @IBAction func btnThemeAction(_ sender: UIButton) {
        self.view.backgroundColor = randomColor()
    }
    
    func randomColor() -> UIColor {
        switch arc4random() % 3 {
        case 0:
            return UIColor.red
        case 1:
            return UIColor.yellow
        case 2:
            return UIColor.blue
        default:
            return UIColor.black
        }
    }
    
}
