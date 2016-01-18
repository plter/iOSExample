//
//  ViewController.swift
//  GuessNumber
//
//  Created by plter on 1/18/16.
//  Copyright © 2016 jikexueyuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfInput: UITextField!
    var theNum:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        resetGameNumber()
    }
    
    func resetGameNumber(){
        theNum = Int(arc4random()) % 100
    }

    @IBAction func btnSubmitClickedHandler(sender: AnyObject) {
        if let userInputNum = Int(tfInput.text!){
            var theMessage:String
            
            if userInputNum > theNum{
                theMessage = "您输入的数字\(userInputNum)大，请重新输入"
                tfInput.text = ""
            }else if userInputNum < theNum{
                theMessage = "您输入的数字\(userInputNum)小，请重新输入"
                tfInput.text = ""
            }else{
                theMessage = "你输入的数字\(userInputNum)正确"
            }
            
            let alert = UIAlertController(title: "提醒", message: theMessage, preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "关闭", style: UIAlertActionStyle.Cancel, handler: nil))
            presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func btnResetClickedHandler(sender: AnyObject) {
        resetGameNumber()
        tfInput.text = ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

