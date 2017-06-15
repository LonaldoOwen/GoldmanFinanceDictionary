//
//  DictionaryViewController.swift
//  GoldmanFinanceDictionary
//
//  Created by owen on 17/6/15.
//  Copyright © 2017年 libowen. All rights reserved.
//

import UIKit

class DictionaryViewController: UIViewController {
    
    //
    let nameArray = ["A", "B", "C", "D", "E", "F", "G"];
    let screanWidth = UIScreen.main.bounds.width
    let screanHeight = UIScreen.main.bounds.height
    let itemWidth = 60
    var topScrollView: UIScrollView!
    var contentScrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        // 添加page view
        let pageVC: DictionaryPageViewController = storyboard?.instantiateViewController(withIdentifier: "DicPageVC") as! DictionaryPageViewController
        self.addChildViewController(pageVC)
        pageVC.view.frame = CGRect(x: 0, y: 60+46, width: screanWidth, height: screanHeight-60-46)
        view.addSubview(pageVC.view)
        
        // 添加构造的顶部滚动view
        view.addSubview(getTopScrollView())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // 构造顶部滚动view
    func getTopScrollView() -> UIView {
        // 顶部background
        let topScrollBackView = UIView(frame: CGRect(x: 0, y: 60, width: screanWidth, height: 46))
        topScrollBackView.backgroundColor = UIColor.yellow
        
        // 顶部滚动scrollView
        topScrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: screanWidth, height: 46))
        topScrollView.backgroundColor = UIColor.gray
        topScrollView.contentSize = CGSize(width: (nameArray.count)*itemWidth, height: 46)
        
        // 顶部各button
        for index in 0..<nameArray.count {
            let buttonItem: UIButton = UIButton(type: UIButtonType.custom)
            buttonItem.frame = CGRect(x: index * itemWidth, y: 0, width: itemWidth, height: 46)
            buttonItem.setTitle(nameArray[index], for: UIControlState.normal)
            topScrollView.addSubview(buttonItem)
            buttonItem.tag = 10+index
            buttonItem.addTarget(self, action: #selector(switchClick), for: UIControlEvents.touchUpInside)
        }
        
        topScrollBackView.addSubview(topScrollView)
        return topScrollBackView
    }
    
    @objc func switchClick(button: UIButton) {
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
