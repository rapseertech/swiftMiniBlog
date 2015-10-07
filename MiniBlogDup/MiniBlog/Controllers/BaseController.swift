//
//  BaseController.swift
//  MiniBlog
//
//  Created by Allister Alambra on 10/6/15.
//  Copyright © 2015 Seer Technologies, Inc. All rights reserved.
//

import UIKit

class BaseController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Prevent Navigation Bar from overlapping with content
        if self.respondsToSelector(Selector("edgesForExtendedLayout")) {
            self.edgesForExtendedLayout = UIRectEdge.None
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadXibName(xibName: String){
        
        var xibs:Array = NSBundle.mainBundle().loadNibNamed(xibName, owner: self, options: nil)!
        
        if xibs.count > 0{
            self.view = xibs[0] as! UIView
            print("Found at least one xib!");
        }
        else{
            print("No Xibs Found.")
        }
    }

}