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
        self.setViewControllers([loadVC(withPage: 0)], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentPageVC = pageViewController
        guard let vcIndex = viewControllers?.index(of: currentPageVC) else {
            return nil
        }
        if vcIndex < (viewControllers?.count)! - 1 {
            return self.loadVC(withPage: vcIndex+1)
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
    
    //
    func loadVC(withPage page: Int) -> UITableViewController {
        let listVC: TableViewController = storyboard?.instantiateViewController(withIdentifier: "ListVC") as! TableViewController
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
