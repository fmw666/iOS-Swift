//
//  VCFind.swift
//  WeChat App
//
//  Created by student on 2019/12/12.
//  Copyright © 2019 fmw666. All rights reserved.
//

import UIKit

class VCFind: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myTableView = UITableView(frame: self.view.bounds,style:.grouped)
        myTableView.delegate = self
        myTableView.dataSource = self
        
        self.navigationItem.title = "发现"
        
        // 下一页左侧返回按钮的属性设置
        let btnBack = UIBarButtonItem(title: "发现", style: .plain, target: self, action: nil)
        btnBack.tintColor = UIColor.white
        self.navigationItem.backBarButtonItem = btnBack
        
        //隐藏多余的cell分割线
        myTableView.tableFooterView = UIView()
        
        // 设置背景颜色
        myTableView.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        self.view.addSubview(myTableView)
        self.navigationController?.navigationBar.backgroundColor = UIColor.black
    }
    
    // 设置TableView的节（Section）数量
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    // 设置节高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    // 分别设置每节的cell数量
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 2
        }
    }
    // 设置每行高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    // 返回每个行的cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.accessoryType = .disclosureIndicator
        
        if indexPath.section == 0 {
            cell.textLabel?.text = "朋友圈"
            cell.imageView?.image = UIImage(named: "朋友圈")
        } else if indexPath.section == 1 {
            if indexPath.row == 0 {
                cell.textLabel?.text = "扫一扫"
                cell.imageView?.image = UIImage(named: "扫一扫")
            } else if indexPath.row == 1 {
                cell.textLabel?.text = "摇一摇"
                cell.imageView?.image = UIImage(named: "摇一摇")
            }
        } else if indexPath.section == 2 {
            if indexPath.row == 0 {
                cell.textLabel?.text = "附近的人"
                cell.imageView?.image = UIImage(named: "附近的人")
            } else if indexPath.row == 1 {
                cell.textLabel?.text = "漂流瓶"
                cell.imageView?.image = UIImage(named: "漂流瓶")
            }
        } else if indexPath.section == 3 {
            if indexPath.row == 0 {
                cell.textLabel?.text = "购物"
                cell.imageView?.image = UIImage(named: "购物")
            } else if indexPath.row == 1 {
                cell.textLabel?.text = "游戏"
                cell.imageView?.image = UIImage(named: "游戏")
            }
        }
        return cell
    }
    
    // 选中某行
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0{
            let vcFindDetail = VCFindDetail()
            self.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vcFindDetail, animated: true)
            self.hidesBottomBarWhenPushed = false
        }
    }
    
}
