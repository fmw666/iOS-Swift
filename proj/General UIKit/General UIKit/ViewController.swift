//
//  ViewController.swift
//  General UIKit
//
//  Created by student on 2019/12/12.
//  Copyright © 2019 fmw666. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var dpDate: UITextField!
    @IBOutlet weak var beginCityText: UITextField!
    @IBOutlet weak var endCityText: UITextField!
    @IBOutlet weak var switchInternal: UISwitch!
    @IBOutlet weak var textViewInfo: UITextView!
    
    // 加载 "出发日期" 选择器
    var pvDate: UIDatePicker!
    
    // 加载 "出发城市" 选择器
    var pvDepartCity: UIPickerView!
    // 加载 "到达城市" 选择器
    var pvArrivalCity: UIPickerView!
    // 设置地点选择器
    let arrProvince = ["四川省", "辽宁省", "广东省"]
    let dicCity = [0: ["成都", "绵阳", "达州"], 1: ["沈阳", "大连", "鞍山"], 2: ["广州", "深圳", "珠海"]]
    var departProvinceIndex = 0     // 当前选中的 "出发城市" 省份索引
    var arrivalProvinceIndex = 0    // 当前选中的 "到达城市" 省份索引
    var arrDepartCitys: [String]!   // 当前选中的 "出发城市" 城市列表
    var arrArrivalCitys: [String]!  // 当前选中的 "到达城市" 城市列表
    var departCityIndex = 0         // 当前选中的 "出发城市" 城市索引
    var arrivalCityIndex = 0        // 当前选中的 "到达城市" 城市索引
    
    // 加载 工具条
    var toolBar: UIToolbar!
    
    // 购买信息
    var buyInfo = ""
    // 购买记录
    var buyInfoRecord = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // "出发日期" 的时间pickerView
        pvDate = UIDatePicker(frame: CGRect(x: 0, y: self.view.bounds.height - 220, width: self.view.bounds.width, height: 220))
        // 设置日期选择器
        pvDate.locale = Locale(identifier: "zh")  // 设置时区
        pvDate.datePickerMode = .date
        
        // 设置 "出发/到达 城市" 地点选择器
        // "出发城市"
        pvDepartCity = UIPickerView(frame: CGRect(x: 0, y: self.view.bounds.height - 220, width: self.view.bounds.width, height: 220))
        pvDepartCity.delegate = self
        pvDepartCity.dataSource = self
        // "到达城市"
        pvArrivalCity = UIPickerView(frame: CGRect(x: 0, y: self.view.bounds.height - 220, width: self.view.bounds.width, height: 220))
        pvArrivalCity.delegate = self
        pvArrivalCity.dataSource = self
        
        //  工具条
        toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 40))
        let bbiDone = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(pickerViewDone))
        let bbiFlex = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.items = [bbiFlex, bbiDone]
        
        // "出发日期" 加载设置（包含调用工具条）
        dpDate.inputView = pvDate           // input 的加载视图为 日期选择器
        dpDate.tintColor = UIColor.clear    // 清除光标
        dpDate.borderStyle = .roundedRect   // 文本框边框类型
        dpDate.returnKeyType = .done        // 返回键类型
        dpDate.inputAccessoryView = toolBar // 辅助 input视图 为 工具条
        dpDate.delegate = self
        
        // "出发城市" 加载设置（包含调用工具条）
        beginCityText.inputView = pvDepartCity      // input 的加载视图为 城市选择器
        beginCityText.tintColor = UIColor.clear     // 清除光标
        beginCityText.borderStyle = .roundedRect    // 文本框边框类型
        beginCityText.returnKeyType = .done         // 返回键类型
        beginCityText.inputAccessoryView = toolBar  // 辅助 input视图 为工具条
        beginCityText.delegate = self
        
        // "到达城市" 加载设置（包含调用工具条）
        endCityText.inputView = pvArrivalCity       // input 的加载视图为 城市选择器
        endCityText.tintColor = UIColor.clear       // 清除光标
        endCityText.borderStyle = .roundedRect      // 文本框边框类型
        endCityText.returnKeyType = .done           // 返回键类型
        endCityText.inputAccessoryView = toolBar    // 辅助 input视图 为工具条
        endCityText.delegate = self
        
        // 数据初始化
        arrDepartCitys = dicCity[0]
        arrArrivalCitys = dicCity[1]
        let df = DateFormatter()
        df.dateFormat = "yyyy年MM月dd日"
        dpDate.text = df.string(from: pvDate.date)
        
        // 购买信息，设置不可编辑不可选中
        textViewInfo.isEditable = false
        textViewInfo.isSelectable = false
    }
    
    // 出发到达城市数据的更新
    func cityViewInit() {
        departProvinceIndex = 0
        departCityIndex = 0
        arrivalProvinceIndex = 0
        arrivalCityIndex = 0
    }
    
    // 点击 工具条 done 执行按钮
    @objc func pickerViewDone() {
        dpDate.resignFirstResponder()
        let df = DateFormatter()
        df.dateFormat = "yyyy年MM月dd日"
        dpDate.text = df.string(from: pvDate.date)
        
        beginCityText.resignFirstResponder()
        endCityText.resignFirstResponder()
        
    }
    
    // 设置选择器列数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
    // 设置选择器每行的标题
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // 判断是出发城市选择器
        if pickerView == pvDepartCity {
            cityViewInit()
            // 第一列。省份处理
            // 第二列。城市处理
            if component == 0 {
                return arrProvince[row]
            } else {
                return arrDepartCitys[row]
            }
        }
            // 判断是到达城市选择器
        else if pickerView == pvArrivalCity {
            cityViewInit()
            // 第一列。省份处理
            // 第二列。城市处理
            if component == 0 {
                return arrProvince[row]
            } else {
                return arrArrivalCitys[row]
            }
        } else {
            return "Error"
        }
    }
    
    // 当用户选中选择器的某行时回调方法
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == pvDepartCity {
            if component == 0 {
                arrDepartCitys = dicCity[row]
                pvDepartCity.selectRow(0, inComponent: 1, animated:true)
                pvDepartCity.reloadComponent(1)
                departProvinceIndex = row
            } else {
                departCityIndex = row
                beginCityText.text = arrDepartCitys[departCityIndex]
            }
        } else if pickerView == pvArrivalCity {
            if component == 0 {
                arrArrivalCitys = dicCity[row]
                pvArrivalCity.selectRow(0, inComponent: 1, animated: true)
                pvArrivalCity.reloadComponent(1)
                arrivalProvinceIndex = row
            } else {
                arrivalCityIndex = row
                endCityText.text = arrArrivalCitys[arrivalCityIndex]
            }
        }
    }
    
    // "点击购买" 按钮执行
    @IBAction func btnPurchase(_ sender: UIButton) {
        buyInfo = ""
        // 格式化日期
        let df = DateFormatter()
        df.dateFormat = "yyyy年MM月dd日"
        buyInfo = "购买" + df.string(from: pvDate.date)

        buyInfo += "\n"
        buyInfo += beginCityText.text!
        buyInfo += "市出发前往"
        buyInfo += endCityText.text!
        buyInfo += "市"

        if switchInternal.isOn {
            buyInfo += "国内机票"
        } else {
            buyInfo += "非国内机票"
        }

        // 使用动作表和提醒显示
        let alertCtrl = UIAlertController(title: "购票信息", message: buyInfo, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "好", style: .cancel, handler: nil)
        alertCtrl.addAction(cancelAction)
        present(alertCtrl, animated: true, completion: nil)

        if buyInfoRecord != "" {
            buyInfoRecord += "\n---\n"
        }
        buyInfoRecord += buyInfo

        segmentRecord(UISegmentedControl(items: nil))
    }
    
    // "购买信息/购买记录" 按钮执行
    @IBAction func segmentRecord(_ sender: UISegmentedControl) {
        dpDate.resignFirstResponder()
        beginCityText.resignFirstResponder()
        endCityText.resignFirstResponder()
        
        // 购买信息==0  购买记录==1
        if sender.selectedSegmentIndex == 0 {
            textViewInfo.text = buyInfo
        } else {
            textViewInfo.text = buyInfoRecord
        }
    }
    
}



