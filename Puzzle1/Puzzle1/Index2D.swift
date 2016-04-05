//
//  Index2D.swift
//  Puzzle1
//
//  Created by plter on 4/5/16.
//  Copyright © 2016 jikexueyuan. All rights reserved.
//

import SpriteKit

class Index2D: NSObject {

    var x:Int = 0
    var y:Int = 0
    
    func equals(index:Index2D) -> Bool? {
        return index.x == x && index.y == y
    }
}
