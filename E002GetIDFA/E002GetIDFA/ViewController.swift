//
//  ViewController.swift
//  E002GetIDFA
//
//  Created by plter on 9/3/14.
//  Copyright (c) 2014 plter. All rights reserved.
//

import UIKit
import AdSupport

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Get IDFA
        var idfa = ASIdentifierManager.sharedManager().advertisingIdentifier.UUIDString
        
        println(idfa)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

