//
//  Util.swift
//  MiniBlog
//
//  Created by raph on 10/6/15.
//  Copyright © 2015 Seer Technologies, Inc. All rights reserved.
//

import Foundation

func readFromPlist(keyName: String) -> String?{
    
    var myDict: NSDictionary?
    if let path = NSBundle.mainBundle().pathForResource("Info", ofType: "plist") {
        myDict = NSDictionary(contentsOfFile: path)
    }
    if let dict = myDict {
        
        return dict[keyName] as? String
    }
    
    return nil

}
