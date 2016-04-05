//
//  Card.swift
//  DragImage
//
//  Created by plter on 3/28/16.
//  Copyright © 2016 jikexueyuan. All rights reserved.
//

import SpriteKit


protocol CardDelegate {
    
    func onDragEnded(target:DragableCard)
}


class DragableCard: Card {

    var startPoint:CGPoint!
    var touchStartPoint:CGPoint!
    var dragEnabled:Bool = false
    var delegate:CardDelegate?
    var relatedCard:Card?
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if dragEnabled {
            startPoint = position
            touchStartPoint = touches.first?.locationInNode(scene!)
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if dragEnabled {
            let currentTouchPoint = touches.first?.locationInNode(scene!)
            
            position.x = startPoint.x + (currentTouchPoint?.x)! - touchStartPoint.x
            position.y = startPoint.y + (currentTouchPoint?.y)! - touchStartPoint.y
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        delegate?.onDragEnded(self)
    }
}
