//
//  VCContacter.swift
//  Contacts
//
//  Created by student on 2019/12/9.
//  Copyright © 2019 fmw666. All rights reserved.
//

import UIKit

class VCContacter: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var stuData: [String: String] = ["2017090415": "李聪", "2017100410": "蒋雯丽", "2017100518": "刘鑫芮", "2017110102": "曹思琦", "2017110103": "陈朝金", "2017110105": "陈倩", "2017110106": "陈晓青", "2017110107": "陈昕玥", "2017110108": "陈震东", "2017110109": "邓涵文", "2017110110": "范茂伟", "2017110111": "方海涛", "2017110112": "韩凤英", "2017110113": "韩瑜", "2017110114": "郝彩霞", "2017110115": "何炳毅", "2017110116": "何炯", "2017110117": "何琪", "2017110118": "何怡", "2017110119": "黄静心", "2017110120": "贾安军", "2017110121": "贾坤", "2017110122": "介来拉石", "2017110123": "李佳琪", "2017110124": "李璐", "2017110125": "李倩", "2017110126": "李思杏", "2017110127": "李文慧", "2017110128": "李晓晓", "2017110129": "李岩", "2017110130": "李雨涵", "2017110131": "李云祥", "2017110132": "梁菥颖", "2017110133": "刘建廷", "2017110134": "龙伍丹", "2017110135": "罗清耀", "2017110136": "罗巍", "2017110137": "罗懿", "2017110138": "欧云龙", "2017110139": "帕提古丽·买买提江", "2017110140": "蒲璐茜", "2017110141": "苏怀成", "2017110142": "孙甜甜", "2017110143": "王科睿", "2017110144": "王澜淞", "2017110145": "王强", "2017110146": "王巧玲", "2017110147": "王秋映", "2017110148": "吴建伟", "2017110149": "吴亚文", "2017110150": "鲜成心", "2017110151": "徐偲翊", "2017110152": "徐何烨", "2017110153": "阳杰", "2017110154": "杨诚鑫", "2017110155": "杨慧", "2017110156": "袁茂", "2017110157": "曾国涛", "2017110158": "张健玮", "2017110159": "张涛", "2017110160": "张心怡", "2017180216": "吴雨林", "2017180415": "唐梦莹", "2017180424": "向大林"]
    
    var arrLastNameAlphabet = ["C", "D", "F", "H", "J", "L", "O", "P", "S", "W", "X", "Y", "Z"]
    
    var dicMapID: [String: [String]] = ["C": ["2017110102", "2017110103", "2017110105", "2017110106", "2017110107", "2017110108"], "D":["2017110109"], "F": [
        "2017110110", "2017110111"], "H": ["2017110112", "2017110113", "2017110114", "2017110115", "2017110116", "2017110117", "2017110118", "2017110119"], "J": ["2017100410", "2017110120", "2017110121", "2017110122"], "L": ["2017090415", "2017110123", "2017110124", "2017110125", "2017110126", "2017110127", "2017110128", "2017110129", "2017110130", "2017110131", "2017110132", "2017100518", "2017110133", "2017110134", "2017110135", "2017110136", "2017110137"
        ], "O":["2017110138"], "P":["2017110139", "2017110140"], "S": ["2017110141", "2017110142"], "W": ["2017110143", "2017110144", "2017110145", "2017110146"
            , "2017110147", "2017110148", "2017110149"], "X": ["2017110150", "2017110151", "2017110152"], "Y": ["2017110153", "2017110154", "2017110155", "2017110156"], "Z": ["2017110157", "2017110158", "2017110159", "2017110160", "2017180216", "2017180415", "2017180424"]]
    
    // 创建表视图
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "联系人"
        
        let btnAdd = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBtnAction))
        self.navigationItem.rightBarButtonItem = btnAdd
        
        // 创建表视图
        tableView = UITableView(frame: self.view.bounds, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
    }
    
    @objc func addBtnAction() {
        dicMapID["L"]?.append("20150015")
        stuData["20150015"] = "李老师"
        tableView.reloadData()
    }
    
    // MARK: TableView Datasource
    // 设置Section数量
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrLastNameAlphabet.count
    }
    
    // 每节标题
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrLastNameAlphabet[section]
    }
    
    // 每节行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = arrLastNameAlphabet[section]
        return dicMapID[key]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "cell_id"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)    // 复用已有的单元格
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)   // 创建新的单元格
        }
        
        let lastNameAlphabet = arrLastNameAlphabet[indexPath.section]       // 获得姓氏首字母
        let arrIDs = dicMapID[lastNameAlphabet]!                            // 获得姓氏首字母相同的所有学生学号
        let strID = arrIDs[indexPath.row]                                   // 获得第i个学生的学号，i是行数
        let name = stuData[strID]                                           // 获得对应学号学生的姓名
        
        cell?.textLabel?.text = name
        cell?.detailTextLabel?.text = strID
        
        let strImageIndex = String(strID.suffix(2))                         // 获取学号后两位
        let imageHeader = UIImage(named: strImageIndex)                     // 获得头像图片
        cell?.imageView?.image = imageHeader
        
        cell?.accessoryType = .disclosureIndicator                          // 访问类型
        
        return cell!
    }
    
    // 节高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    // 行高
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    // MARK: TableView Delegate
    // 选中某行的回调方法
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let lastNameAlphabet = arrLastNameAlphabet[indexPath.section]       // 获得姓氏首字母
        let arrIDs = dicMapID[lastNameAlphabet]!                            // 获得姓氏首字母相同的所有学生学号
        let strID = arrIDs[indexPath.row]                                   // 获得第i个学生的学号，i是行数
        let name = stuData[strID]!                                          // 获得对应学号学生的姓名
        
        let strImageIndex = String(strID.suffix(2))
            // 获得学号后两位
        let imageHeader = UIImage(named: strImageIndex)
            // 获得头像图片
        let vcCDetail = VCContacterDetail()
        // 传参
        vcCDetail.strName = name
        vcCDetail.strID = strID
        vcCDetail.imageHeader = imageHeader
        
        self.navigationController?.pushViewController(vcCDetail, animated: true)
        
    }
    
    // 删除某行
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let key = arrLastNameAlphabet[indexPath.section]
            dicMapID[key]!.remove(at: indexPath.row)
            
            tableView.reloadData()                                          // 重新访问数据源对象，重新加载数据
        }
    }
}

