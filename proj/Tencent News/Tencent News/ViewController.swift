//
//  ViewController.swift
//  Tencent News
//
//  Created by student on 2019/12/12.
//  Copyright © 2019 fmw666. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    public var myTitle: UILabel
    public var subTitle: UILabel
    public var myImageView: UIImageView
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        myTitle = UILabel(frame: CGRect(x: 15, y: 15, width: 225, height: 90))
        myTitle.numberOfLines = 0
        myTitle.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        myTitle.textAlignment = .justified
        subTitle = UILabel(frame: CGRect(x: 15, y: 110, width: 225, height: 30))
        subTitle.font = UIFont.systemFont(ofSize: 15, weight: .thin)
        myImageView = UIImageView(frame: CGRect(x: 250, y: 30, width: 150, height: 100))
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // todo:修改属性
        self.contentView.addSubview(myTitle)
        self.contentView.addSubview(subTitle)
        self.contentView.addSubview(myImageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "cell_id"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID) as!NewsCell?
        if cell == nil {
            cell = NewsCell(style: .default, reuseIdentifier: cellID)
        }
        
        if indexPath.row == 0 {
            cell?.myTitle.text = "ofo进军电动单车？传已申请专利，解决车辆突然加速问题"
            cell?.subTitle.text = "AI财经社  200评  2小时前"
            cell?.myImageView.image = UIImage(named: "p1")
        }
        if indexPath.row == 1 {
            cell?.myTitle.text = "剑指小米？三星手机超级省电模式被控涉专利侵权"
            cell?.subTitle.text = "财联社  252评  4小时前"
            cell?.myImageView.image = UIImage(named: "P2")
        }
        if indexPath.row == 2 {
            cell?.myTitle.text = "这次长二丙火箭运送了四个人的基因 将在太空长期保存"
            cell?.subTitle.text = "中国运载火箭技术研究院  33评  3小时前"
            cell?.myImageView.image = UIImage(named: "p3")
        }
        if indexPath.row == 3 {
            cell?.myTitle.text = "朋友圈“萌娃评选”刷票猫腻多 孩子展示平台为何变名战场？"
            cell?.subTitle.text = "中国之声  371评  5小时前"
            cell?.myImageView.image = UIImage(named: "p4")
        }
        if indexPath.row == 4 {
            cell?.myTitle.text = "马云要力推信用服务？支付宝信用能量上线：每次守约都能获取"
            cell?.subTitle.text = "需科技  10评  3小时前"
            cell?.myImageView.image = UIImage(named: "p5")
        }
        if indexPath.row == 5 {
            cell?.myTitle.text = "人工智能接受全新挑战：预测人类80岁的模样 还要辩什么呢"
            cell?.subTitle.text = "AI财经社  410评  4小时前"
            cell?.myImageView.image = UIImage(named: "p6")
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}

