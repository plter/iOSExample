//
//  ViewController.swift
//  UsingUIDocumentInteractionController
//
//  Created by plter on 6/26/15.
//  Copyright (c) 2015 plter. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIDocumentInteractionControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var c = UIDocumentInteractionController(URL: NSBundle.mainBundle().URLForResource("doc", withExtension: "pdf")!)
        c.delegate = self
        
        c.presentPreviewAnimated(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func documentInteractionControllerViewControllerForPreview(controller: UIDocumentInteractionController) -> UIViewController {
        return self
    }

}

