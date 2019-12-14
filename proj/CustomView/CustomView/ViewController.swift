//
//  ViewController.swift
//  CustomView
//
//  Created by student on 2019/10/31.
//  Copyright © 2019 范茂伟. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    public var myImageView: UIImageView
    public var myTitle: UILabel
    public var image1: UIImageView
    public var image2: UIImageView
    public var imageStars: UIImageView
    public var subTitle: UILabel
    public var price: UILabel
    public var typeTitle: UILabel
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        myImageView = UIImageView(frame: CGRect(x: 15, y: 15, width: 100, height: 80))
        myImageView.layer.cornerRadius = 10
        myImageView.layer.masksToBounds = true
        
        myTitle = UILabel(frame: CGRect(x: 130, y: 15, width: 90, height: 30))
        myTitle.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        image1 = UIImageView(frame: CGRect(x: 265, y: 18, width: 24, height: 24))
        image2 = UIImageView(frame: CGRect(x: 293, y: 18, width: 24, height: 24))
        imageStars = UIImageView(frame: CGRect(x: 130, y: 50, width: 70, height: 15))
        subTitle = UILabel(frame: CGRect(x: 130, y: 75, width: 90, height: 20))
        price = UILabel(frame: CGRect(x: 15, y: 110, width: 100, height: 30))
        price.textColor = .red
        price.textAlignment = .center
        typeTitle = UILabel(frame: CGRect(x: 130, y: 110, width: 200, height: 30))
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // todo: 修改属性
        self.contentView.addSubview(myImageView)
        self.contentView.addSubview(myTitle)
        self.contentView.addSubview(image1)
        self.contentView.addSubview(image2)
        self.contentView.addSubview(imageStars)
        self.contentView.addSubview(subTitle)
        self.contentView.addSubview(price)
        self.contentView.addSubview(typeTitle)
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
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID) as!CustomCell?
        if cell == nil {
            cell = CustomCell(style: .default, reuseIdentifier: cellID)
        }
        
        if indexPath.row == 0 {
            cell?.myImageView.image = UIImage(named: "andelusen")
            cell?.myTitle.text = "安德鲁森"
            cell?.image1.image = UIImage(named: "tuan")
            cell?.imageStars.image = UIImage(named: "star")
            cell?.subTitle.text = "面包店"
            cell?.price.text = "¥124.2"
            cell?.typeTitle.text = "蛋糕4选1，约6寸"
        }
        if indexPath.row == 1 {
            cell?.myImageView.image = UIImage(named: "yangjichuanchuan")
            cell?.myTitle.text = "杨记串串"
            cell?.image1.image = UIImage(named: "tuan")
            cell?.image2.image = UIImage(named: "juan")
            cell?.imageStars.image = UIImage(named: "star")
            cell?.subTitle.text = "串串香"
            cell?.price.text = "¥78"
            cell?.typeTitle.text = "100元代金券"
        }
        if indexPath.row == 2 {
            cell?.myImageView.image = UIImage(named: "tamikafei")
            cell?.myTitle.text = "塔米咖啡"
            cell?.image1.image = UIImage(named: "tuan")
            cell?.imageStars.image = UIImage(named: "star")
            cell?.subTitle.text = "咖啡厅"
            cell?.price.text = "¥7.9"
            cell?.typeTitle.text = "10元代金券"
        }
        
        return cell!
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
}

