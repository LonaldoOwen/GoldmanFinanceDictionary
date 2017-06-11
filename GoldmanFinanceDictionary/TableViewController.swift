//
//  TableViewController.swift
//  GoldmanFinanceDictionary
//
//  Created by libowen on 2017/6/6.
//  Copyright © 2017年 libowen. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    //
    struct GoldmanFinanceDictionary {
        var englishTitle: String
        var chineseTitle: String
        var explain: String
        
    }
    
    let dataArray: [GoldmanFinanceDictionary] = {
        // 构造数据
        let dic1 = GoldmanFinanceDictionary(englishTitle: "DJIA", chineseTitle: "道琼斯工业平均指数", explain: "道琼斯工业平均指数是30种在纽约股票交易所及纳斯达克交易所买卖的重要股票的股价加权平均。道琼斯工业平均指数于1896年由Charles Dow 始创")
        let dic2 = GoldmanFinanceDictionary(englishTitle: "Data Mining", chineseTitle: "数据探索", explain: "一种数据库应用，旨在探索大量数据之中存在的潜在模式")
        let dic3 = GoldmanFinanceDictionary(englishTitle: "Days Payable Outstanding(DPO)", chineseTitle: "应付账款天数", explain: "公司付款的平均天数;备注：公式也可以作：应收账款/（信用成本/天数）")
        var dataArray = [dic1, dic2, dic3]
        return dataArray
    }()
    
    //var htmlString: String

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        // 使用UITableViewController不用这两行
        //tableView.dataSource = self
        //tableView.delegate = self
        // 自动适应行高
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableViewAutomaticDimension
        
        //
        let urlString = "http://wiki.mbalib.com/wiki/%E9%AB%98%E7%9B%9B%E8%B4%A2%E7%BB%8F%E8%AF%8D%E5%85%B8%E8%8B%B1%E6%B1%89%E5%AF%B9%E7%85%A7_C"
        request(httpUrl: urlString)
        
        // 
        let cinema = "Are we going to the cinema at 3 pm or 5 pm?"
        print(listMatches(pattern: "\\d (am|pm)", inString: cinema))
        print(listGroups(pattern: "(\\d (am|pm))", inString: cinema))
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /// 请求url获取HTML源码
    func request(httpUrl: String) {
        
        let url: NSURL = NSURL(string: httpUrl)!
        var request = URLRequest(url: url as URL)
        request.timeoutInterval = 10
        request.httpMethod = "GET"
        
        let configuration: URLSessionConfiguration = URLSessionConfiguration.default
        let session:URLSession = URLSession(configuration: configuration)
        let dataTask:URLSessionDataTask = session.dataTask(with: request) { (data, response, error) in
            if error != nil {
                print("error")
            } else {
                print("//prints:\n response:\(response)")
                // NSData转String
                let dataString = (NSString(data: data!, encoding: String.Encoding.utf8.rawValue))! as String
                print("//prints:\n data:\(dataString)")
                // 匹配html tag--<table>
                //let pattern = "<([a-z][a-z0-9]*)\\b[^>]*>(.*?)</\\1>"
                //let pattern = "<(tr)>([\\s\\S]*?)</\\1>" // 正解
                let tablePattern = "<(table)\\b class=\"wikitable\">([\\s\\S]*?)</\\1>"
                let tableArray: [String] = self.listMatches(pattern: tablePattern, inString: dataString)
                print("matchTag:\(tableArray)")
                // 匹配html tag--<tr>
                let tableString: String? = tableArray.first
                print("tableString: \(tableString)")
                let trPattern = "<(tr)>([\\s\\S]*?)</\\1>"
                let trArray: [String]? = self.listMatches(pattern: trPattern, inString: (tableString)!)
                print("trArray: \(trArray)")
                // 匹配html tag--<td>
            }
        }
        dataTask.resume()
    }
    
    
    /// 正则表达式
    // 匹配字符串
    func listMatches(pattern: String, inString string: String) -> [String] {
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        let range = NSMakeRange(0, string.characters.count)
        let matches = regex.matches(in: string, options: [], range: range)
        
        return matches.map {
            let range = $0.range
            let matchString = (string as NSString).substring(with: range)
            //print("matchString: \(matchString)")
            return matchString
        }
    }
    
    //
    func listGroups(pattern: String, inString string: String) -> [String] {
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        let range = NSMakeRange(0, string.characters.count)
        let matches = regex.matches(in: string, options: [], range: range)
        
        var groupMatches = [String]()
        for match in matches {
            let rangeCount = match.numberOfRanges
            for group in 0..<rangeCount {
                let matchString = (string as NSString).substring(with: match.rangeAt(group))
                groupMatches.append(matchString)
            }
        }
        
        return groupMatches
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "DictonaryCell", for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "DictonaryCell") as! DictionaryTableViewCell

        // Configure the cell...
        cell.englishTitle.text = dataArray[indexPath.row].englishTitle
        cell.chineseTitle.text = dataArray[indexPath.row].chineseTitle
        cell.explainLable.text = dataArray[indexPath.row].explain

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
