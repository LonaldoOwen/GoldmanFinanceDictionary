//
//  DictionaryPageViewController.swift
//  GoldmanFinanceDictionary
//
//  Created by owen on 17/6/15.
//  Copyright © 2017年 libowen. All rights reserved.
//

import UIKit

class DictionaryPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    //
    var pageCount: Int = 1

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //
        view.backgroundColor = UIColor.orange
        // 设置初始page
        self.setViewControllers([loadVC(withPage: 0)], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
        dataSource = self
        delegate = self
        /**
         transitionStyle\navigationOrientation（getter）
         注意：1、如果使用storyboard，需要在storyboard设置；2、如果使用代码，初始化UIPageViewController实例时创建
        */
        //self.transitionStyle = UIPageViewControllerTransitionStyle.scroll
        //self.navigationOrientation = UIPageViewControllerNavigationOrientation.horizontal
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: data source
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        // 进入下一个pageVC
        let currentPageVC: TableViewController = viewController as! TableViewController
        var index = currentPageVC.pageIndex
        if index == NSNotFound || index == pageCount-1 {
            return nil
        }
        index += 1

        return self.loadVC(withPage: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        // 返回上一个pageVC
        let currentPageVC: TableViewController = viewController as! TableViewController
        var index = currentPageVC.pageIndex
        if index == 0 || index == NSNotFound {
            return nil
        }
        index -= 1

        return self.loadVC(withPage: index)
    }
    
    
    // MARK：实现indicator（小圆点）
//    func presentationCount(for pageViewController: UIPageViewController) -> Int {
//        return 3
//    }
//
//func presentationIndex(for pageViewController: UIPageViewController) -> Int {
//        return 0
//    }
    
    
    // MARK: delegate
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        
        print("willTransitionTo, \(pendingViewControllers.count)")
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        print("didFinishAnimating, \(previousViewControllers.count)")
        // 切换switch button
        let dicVC: DictionaryViewController = pageViewController.parent as! DictionaryViewController
        let index = (pageViewController.viewControllers?[0] as! TableViewController).pageIndex
        dicVC.updateIndexButton(of: index)
    }
    
    
    // MARK: helper
    func loadVC(withPage page: Int) -> UIViewController {
        let listVC: TableViewController = storyboard?.instantiateViewController(withIdentifier: "ListVC") as! TableViewController
        listVC.pageIndex = page
        return listVC
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
