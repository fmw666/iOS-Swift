//
//  VCWechat.swift
//  WeChat App
//
//  Created by student on 2019/12/12.
//  Copyright © 2019 fmw666. All rights reserved.
//

import UIKit

class ChatCell:UITableViewCell{
    public var myImageView:UIImageView
    public var myTitle:UILabel
    public var typeTitle:UILabel
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        myImageView = UIImageView(frame: CGRect(x: 20, y: 10, width: 60, height: 60))
        myImageView.layer.cornerRadius = 10
        myImageView.layer.masksToBounds = true
        
        myTitle = UILabel(frame: CGRect(x: 100, y: 10, width: 150, height: 30))
        myTitle.font = UIFont.systemFont(ofSize:15,weight:.bold)
        
        typeTitle=UILabel(frame: CGRect(x: 100, y: 40, width: 250, height: 30))
        typeTitle.font = UIFont.systemFont(ofSize:15,weight:.light)
        super.init(style:style,reuseIdentifier:reuseIdentifier)
        
        self.contentView.addSubview(myImageView)
        self.contentView.addSubview(myTitle)
        self.contentView.addSubview(typeTitle)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class VCWechat: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = "发现"
        
        let btnAdd = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        btnAdd.tintColor = UIColor.white
        self.navigationItem.rightBarButtonItem = btnAdd
        
        let tableView = UITableView(frame: self.view.bounds, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        // TableView上有一段留白的解决方法
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 60))
        tableView.contentInsetAdjustmentBehavior = .never
        self.view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "cell_id"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)as! ChatCell?
        if cell == nil{
            cell = ChatCell(style: .default, reuseIdentifier: cellID)
        }
        
        if indexPath.row == 0 {
            cell?.myImageView.image = UIImage(named: "中国银行")
            cell?.myTitle.text = "中国银行"
            cell?.typeTitle.text = "【中国银行】您有一笔1000000.00元收入..."
            //checkmark：被勾选的,disclosureIndicator:箭头
            cell?.accessoryType = .disclosureIndicator
        }
        
        if indexPath.row == 1 {
            cell?.myImageView.image = UIImage(named: "微信")
            cell?.myTitle.text = "微信运动"
            cell?.typeTitle.text = "【应用信息】"
        }
        
        if indexPath.row == 2 {
            cell?.myImageView.image = UIImage(named: "华西医院")
            cell?.myTitle.text = "华西第二医院"
            cell?.typeTitle.text = "孕宝视频直播课程|四川大学华西第二医院..."
        }
        if indexPath.row == 3 {
            cell?.myImageView.image = UIImage(named: "订阅号")
            cell?.myTitle.text = "订阅号"
            cell?.typeTitle.text = "学术中国：高校替课成产业链：规模化经营震惊..."
        }
        if indexPath.row == 4 {
            cell?.myImageView.image = UIImage(named: "文件传输助手")
            cell?.myTitle.text = "文件传输助手"
            cell?.typeTitle.text = "【小视频】"
        }
        
        //checkmark：被勾选的,disclosureIndicator:箭头
        cell?.accessoryType = .disclosureIndicator
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
