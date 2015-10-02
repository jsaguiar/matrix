
//
//  showHowCameraWorksViewController.swift
//  matrix
//
//  Created by Joao Aguiar on 02/10/15.
//  Copyright © 2015 Joao Aguiar. All rights reserved.
//

import UIKit

class ShowHowCameraWorksViewController: UIViewController {
    @IBOutlet weak var iphoneIV: UIImageView!
    @IBOutlet weak var handIV: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        startAnimation()
    }
    
    func startAnimation(){
        var handContraint:NSLayoutConstraint?
        for (index, value) in self.view.constraints.enumerate() {
            let constraint = value as NSLayoutConstraint
            if (constraint.firstItem as? NSObject == iphoneIV && constraint.firstAttribute == NSLayoutAttribute.Top){
                constraint.constant = -142
            }else if (constraint.firstItem as? NSObject == handIV && constraint.firstAttribute == NSLayoutAttribute.Leading){
                    handContraint = constraint
                    constraint.constant = UIScreen.mainScreen().bounds.width
                    constraint.constant = 500
                }
            }
        
        UIView.animateWithDuration(0.5, animations: {
            self.view.layoutIfNeeded()

            })
            {(completed) -> Void in
    
                self.handIV.alpha=1
                if (handContraint != nil){
                    handContraint!.constant = 232
                }
                UIView.animateWithDuration(1, animations:{
                    self.view.layoutIfNeeded()
                    }
                )
        }
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
