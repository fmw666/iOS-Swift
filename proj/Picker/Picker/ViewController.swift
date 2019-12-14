//
//  ViewController.swift
//  Picker
//
//  Created by student on 2019/10/21.
//  Copyright © 2019 范茂伟. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var dpDepart: UIDatePicker!
    @IBOutlet weak var tfPersonNum: UITextField!
    @IBOutlet weak var pDestination: UIPickerView!
    
    // step2 设置地点选择器
    let arrProvince = ["四川省", "辽宁省", "广东省"]
    let dicCity = [0: ["成都市", "绵阳市", "达州市"], 1: ["沈阳市", "大连市", "鞍山市"], 2: ["广州市", "深圳市", "珠海市"]]
    var provinceIndex = 0   // 当前选中的省份索引
    var cityIndex = 0       // 当前选中的城市索引
    var arrCitysForSelectedProvince = ["成都市", "绵阳市", "达州市"] // 保存对应省份的城市
    
    // step4 pickerview person number
    var pPersonNum: UIPickerView!
    var toolBar: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // step1 设置日期选择器
        dpDepart.locale = Locale(identifier: "zh")  // 设置时区
        dpDepart.datePickerMode = .date
        
        // step2 设置地点选择器
        pDestination.delegate = self
        pDestination.dataSource = self
        
        pPersonNum = UIPickerView(frame: CGRect(x: 0, y: self.view.bounds.height - 220, width: self.view.bounds.width , height: 220))
        pPersonNum.delegate = self
        pPersonNum.dataSource = self
        
        toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 40))
        let bbiDone = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(pickerDone))
        let bbiFlex = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.items = [bbiFlex, bbiDone]
        
        tfPersonNum.inputView = pPersonNum
        tfPersonNum.tintColor =  UIColor.clear
        tfPersonNum.inputAccessoryView = toolBar
    }
    
    @objc func pickerDone() {
        tfPersonNum.resignFirstResponder()
    }
    
    // MARK: step2 设置地点选择器数据源
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView == pDestination {
            return 2
        }
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == pDestination {
            return 3
        } else if pickerView == pPersonNum {
            return 8
        }
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == pDestination {
            if component == 0 {
                return arrProvince[row]
            } else if component == 1 {
                return arrCitysForSelectedProvince[row]
            }
        } else if pickerView == pPersonNum {
            return "\(row+1)"
        }
        
        return ""
    }

    // pickerView delegate
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == pDestination {
            if component == 0 {
                provinceIndex = row
                arrCitysForSelectedProvince = dicCity[provinceIndex]!
                pDestination.reloadComponent(1)
                pDestination.selectRow(0, inComponent: 1, animated: true)
            } else if component == 1 {
                cityIndex = row
            }
        }
        
        if pickerView == pPersonNum {
            tfPersonNum.text = "\(row+1)"
        }
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        var strInfo = "计划"
        
        let df = DateFormatter()
        df.dateFormat = "yyyy年MM月dd日"
        strInfo += df.string(from: dpDepart.date)
        
        strInfo += tfPersonNum.text!
        strInfo += "人去"
        
        strInfo += arrProvince[provinceIndex]
        strInfo += arrCitysForSelectedProvince[cityIndex]
        strInfo += "😊"
        
        let ac = UIAlertController(title: "出行计划", message: strInfo, preferredStyle: .alert)
        let actionCancel = UIAlertAction(title: "确定", style: .cancel, handler: nil)
        ac.addAction(actionCancel)
        present(ac, animated: true, completion: nil)
    }
    
}

