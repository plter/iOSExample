//
//  ViewController.swift
//  SimpleBrowser
//
//  Created by plter on 10/8/14.
//  Copyright (c) 2014 jikexueyuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIWebViewDelegate {

    @IBOutlet weak var wv: UIWebView!
    @IBOutlet weak var tfInput: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        wv.delegate = self
        wv.loadRequest(NSURLRequest(URL: NSURL(string: "http://jikexueyuan.com")))
    }

    @IBAction func btnGoClicked(sender: AnyObject) {
        if ((tfInput.text as NSString).substringToIndex(7) as NSString).isEqualToString("http://") {
            
            wv.loadRequest(NSURLRequest(URL: NSURL(string: tfInput.text)))
        }else{
            wv.loadRequest(NSURLRequest(URL: NSURL(string: "http://\(tfInput.text)")))
        }
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        tfInput.text = request.URL.description
        
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

