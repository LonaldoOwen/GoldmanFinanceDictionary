//
//  DictionaryTableViewCell.swift
//  GoldmanFinanceDictionary
//
//  Created by libowen on 2017/6/6.
//  Copyright © 2017年 libowen. All rights reserved.
//

import UIKit

class DictionaryTableViewCell: UITableViewCell {
    
    /// property
    // 报错？？？
    
    /*
    问题：1、在自定义cell的contentView上添加UIView，@IBOutlet报错？2、加了该View后，再添加label时，自动布局无法准确显示（约束并不报错）？
    解决：参考myUITableView（demo）
    */
    //@IBOutlet var backgroundView: UIView!
    @IBOutlet weak var englishTitle: UILabel!
    @IBOutlet weak var chineseTitle: UILabel!
    @IBOutlet weak var explainLable: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
