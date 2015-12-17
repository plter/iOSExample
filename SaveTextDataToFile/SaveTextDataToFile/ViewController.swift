//
//  ViewController.swift
//  SaveTextDataToFile
//
//  Created by plter on 12/17/15.
//  Copyright © 2015 plter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tvContent: UITextView!
    let fm = NSFileManager.defaultManager()
    var docUrl:NSURL!
    var dataFileUrl:NSURL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        docUrl = fm.URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask)[0]
        dataFileUrl = NSURL(string: "TextData", relativeToURL: docUrl)
        
        tvContent.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnReadDataClickedHandler(sender: AnyObject) {
        if fm.fileExistsAtPath(dataFileUrl.path!){
            let data = fm.contentsAtPath(dataFileUrl.path!)
            let contentStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
            tvContent.text = contentStr?.description
        }
    }

    @IBAction func btnSaveDataClickedHandler(sender: AnyObject) {
        
        fm.createFileAtPath(dataFileUrl.path!, contents:NSString(string: tvContent.text).dataUsingEncoding(NSUTF8StringEncoding), attributes: nil)
        
    }
    
    
    
}

