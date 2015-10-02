//
//  MatrixMenuPageViewController.swift
//  matrix
//
//  Created by Joao Aguiar on 01/10/15.
//  Copyright © 2015 Joao Aguiar. All rights reserved.
//

import UIKit

class MatrixMenuViewController: UIViewController, UIPageViewControllerDataSource {
    //var pageViewController:MatrixViewController?
    var pageViewController:UIPageViewController?
    
    var matrixCards:[Int] = []
    override func viewDidLoad() {
        super.viewDidLoad()
         matrixCards = [1,2,3,4]
        
        initPageViewController()
    }

    
    func initPageViewController(){
        self.pageViewController = self.storyboard!.instantiateViewControllerWithIdentifier("pageViewController") as? UIPageViewController
        self.pageViewController?.dataSource=self
        
        let array = [createMatrixViewControllerAtIndex(0)!]
        self.pageViewController?.setViewControllers(array, direction: .Forward, animated: false, completion: nil)


        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["pageView"] =  self.pageViewController
        
       // self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[pageView]|", options: [], metrics: nil, views: viewBindingsDict))

        self.addChildViewController(self.pageViewController!)
        self.view.addSubview(self.pageViewController!.view)
        self.pageViewController?.didMoveToParentViewController(self)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let matrixViewController = viewController as? MatrixViewController
        if (matrixViewController?.index == nil || matrixViewController!.index! + 1 >= matrixCards.count) {
            return nil
        }
        return createMatrixViewControllerAtIndex(matrixViewController!.index!+1)
        
    }
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
      
        let matrixViewController = viewController as? MatrixViewController
        if (matrixViewController?.index == nil || matrixViewController?.index==0) {
            return nil
        }
        return createMatrixViewControllerAtIndex(matrixViewController!.index!-1)
        
    }
    
    func createMatrixViewControllerAtIndex(index:Int) -> UIViewController?{
        if (index < 0 || index >= matrixCards.count){
            return nil
        }
        let pageViewController = self.storyboard!.instantiateViewControllerWithIdentifier("matrixViewController") as? MatrixViewController
        
        pageViewController?.index = index
        return pageViewController!
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return matrixCards.count
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
}
