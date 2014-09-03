//
//  ViewController.swift
//  HelloAudio
//
//  Created by plter on 8/19/14.
//  Copyright (c) 2014 jikexueyuan. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,AVAudioRecorderDelegate {
    
    
    var a:AVAudioRecorder!
    var p:AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        
        a = AVAudioRecorder(URL: NSURL(fileURLWithPath: "\(paths[0])/sound.wav"), settings: nil, error: nil)
        a.delegate = self
        println("\(a.prepareToRecord())")
    }
    
    @IBAction func play(sender: AnyObject) {
        p = AVAudioPlayer(contentsOfURL: a.url, error: nil)
        p.prepareToPlay()
        p.play()
        println("play")
    }
    
    @IBAction func stopRecord(sender: AnyObject) {
        a.stop()
        println("stop")
    }
    
    @IBAction func startRecord(sender: AnyObject) {
        println("\(a.record())");
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

