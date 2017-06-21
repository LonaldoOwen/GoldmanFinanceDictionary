//
//  DictionaryPageViewController.swift
//  GoldmanFinanceDictionary
//
//  Created by owen on 17/6/15.
//  Copyright © 2017年 libowen. All rights reserved.
//

import UIKit

class DictionaryPageViewController: UIPageViewController, UIPageViewControllerDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //
        view.backgroundColor = UIColor.orange
        // 设置初始page
        self.setViewControllers([loadVC(withPage: 0)], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
        dataSource = self
        /**
         transitionStyle\navigationOrientation
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
        print("viewControllerAfter")
        let afterPageVC: TableViewController = viewController as! TableViewController
        //let afterPageVC: ViewController = viewController as! ViewController
//        guard let vcIndex = viewControllers?.index(of: afterPageVC) else {
//            return nil
//        }
//        if vcIndex < 3 - 1 {
//            return self.loadVC(withPage: vcIndex+1)
//        }
//        print("after: \(vcIndex)")
//        return nil
        var index = afterPageVC.pageIndex
        if index == NSNotFound || index == 3 {
            return nil
        }
        index += 1
        return self.loadVC(withPage: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let beforePageVC: TableViewController = viewController as! TableViewController
//        guard let vcIndex = viewControllers?.index(of: beforePageVC) else {
//            return nil
//        }
//        if vcIndex > 0 {
//            return self.loadVC(withPage: vcIndex-1)
//        }
//        print("before: \(vcIndex)")
//        return nil
        var index = beforePageVC.pageIndex
        if index == 0 || index == NSNotFound {
            return nil
        }
        index -= 1
        return self.loadVC(withPage: index)
    }
    
    // 实现indicator（小圆点）
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return 3
    }
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    
    //
    func loadVC(withPage page: Int) -> UIViewController {
        let listVC: TableViewController = storyboard?.instantiateViewController(withIdentifier: "ListVC") as! TableViewController
        listVC.pageIndex = page
        return listVC
//        let detailVC: ViewController = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! ViewController
//        if page == 1 { detailVC.view.backgroundColor = UIColor.red}
//        if page == 2 { detailVC.view.backgroundColor = UIColor.blue}
//        return detailVC
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
