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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        //tableView.dataSource = self
        //tableView.delegate = self
        // 自动适应行高
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        let cell: DictionaryTableViewCell = tableView.dequeueReusableCell(withIdentifier: "DictonaryCell", for: indexPath) as! DictionaryTableViewCell

        // Configure the cell...
        //cell.englishTitle.text = dataArray[indexPath.row].englishTitle
        //cell.chineseTitle.text = dataArray[indexPath.row].chineseTitle
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
