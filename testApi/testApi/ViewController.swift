//
//  ViewController.swift
//  testApi
//
//  Created by 川北紘正 on 2018/01/16.
//  Copyright © 2018年 川北紘正. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // itemsをJSONの配列と定義
    var items: [JSON] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TableViewを作成
        let tableView = UITableView()
        tableView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        // QiitaのAPIからデータを取得
        let listUrl = "http://qiita-stock.info/api.json";
        Alamofire.request(listUrl).responseJSON{ response in
            let json = JSON(response.result.value ?? 0)
            json.forEach{(_, data) in
                self.items.append(data)
            }
            tableView.reloadData()
        }
    }
    
    // tableのcellにAPIから受け取ったデータを入れる
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "TableCell")
        cell.textLabel?.text = items[indexPath.row]["title"].string
        cell.detailTextLabel?.text = "投稿日 : \(items[indexPath.row]["send_date"].stringValue)"
        return cell
    }
    
    // cellの数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
