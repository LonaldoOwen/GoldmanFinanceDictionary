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
    let nameArray = ["A", "B", "C"];
    let screanWidth = UIScreen.main.bounds.width
    let screanHeight = UIScreen.main.bounds.height
    let itemWidth = 60
    var selectedIndex: Int = 0
    var topScrollView: UIScrollView!
    //var contentScrollView: UIScrollView!
    var pageVC: DictionaryPageViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 添加构造的顶部滚动view
        view.addSubview(getTopScrollView())
        topScrollView.showsHorizontalScrollIndicator = false
        topScrollView.showsVerticalScrollIndicator = false
    
        // 添加page view
        //let pageVC: DictionaryPageViewController = storyboard?.instantiateViewController(withIdentifier: "DicPageVC") as! DictionaryPageViewController
        pageVC = storyboard?.instantiateViewController(withIdentifier: "DicPageVC") as! DictionaryPageViewController
        self.addChildViewController(pageVC)
        pageVC.view.frame = CGRect(x: 0, y: 60+46, width: screanWidth, height: screanHeight-60-46)
        view.addSubview(pageVC.view)
        pageVC.pageCount = nameArray.count
        
        // 默认第一个button选中
        let defaulBtn: IndexButton = topScrollView.subviews[0] as! IndexButton
        defaulBtn.scale = 1
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
            //let buttonItem: UIButton = UIButton(type: UIButtonType.custom)
            let buttonItem: IndexButton = IndexButton()
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
        print("button click: \(button.tag)")
        // 切换index button
        let currentBtn: IndexButton = button as! IndexButton
        selectedIndex = topScrollView.subviews.index(of: currentBtn)!  // 获取当前点击button的index
        updateIndexButton(of: selectedIndex)
//        for (index, subBtn) in topScrollView.subviews.enumerated() {
//            if index == selectedIndex {
//                currentBtn.scale = 1.0
//            } else {
//                let indexBtn: IndexButton = subBtn as! IndexButton
//                indexBtn.scale = 0
//            }
//        }
        // 显示index对应的VC
        pageVC.setViewControllers([pageVC.loadVC(withPage: button.tag-10)], direction: .forward, animated: false, completion: nil)
    }
    
    func updateIndexButton(of index: Int) {
        print("index: \(index)")
        for (id, subBtn) in topScrollView.subviews.enumerated() {
            let indexBtn: IndexButton = subBtn as! IndexButton
            if id == index {
                indexBtn.scale = 1.0
            } else {
                let indexBtn: IndexButton = subBtn as! IndexButton
                indexBtn.scale = 0
            }
        }
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
