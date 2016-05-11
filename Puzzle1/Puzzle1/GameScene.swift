//
//  GameScene.swift
//  Puzzle1
//
//  Created by plter on 4/5/16.
//  Copyright (c) 2016 jikexueyuan. All rights reserved.
//

import SpriteKit

class GameScene: SKScene , CardDelegate{
    
    let columns = 2
    let rows = 2
    var targets = [DragableCard]()
    var cards = [DragableCard]()
    let offsetX:CGFloat = 200
    let offsetY:CGFloat = 200
    var cardWidthInPixels:CGFloat = 0
    var cardHeightInPixels:CGFloat = 0
    
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        let texture = SKTexture(imageNamed: "Image")
        cardWidthInPixels = texture.size().width / CGFloat(columns)
        cardHeightInPixels = texture.size().height / CGFloat(rows)
        
        let cardWidth:CGFloat = 1.0 / CGFloat(columns)
        let cardHeight:CGFloat = 1.0 / CGFloat(rows)
        
        //cut image
        var card:DragableCard
        var target:DragableCard
        for i in 0..<columns{
            for j in 0..<rows{
                //sources
                card = DragableCard(texture: SKTexture(rect: CGRectMake(CGFloat(i)*cardWidth, CGFloat(j)*cardHeight, cardWidth, cardHeight), inTexture: texture))
                card.index.x = i
                card.index.y = j
                card.userInteractionEnabled = true
                card.dragEnabled = true
                
                card.position.x = CGFloat(arc4random() % UInt32((scene?.size.width)! - 100)) + 50
                card.position.y = CGFloat(arc4random() % UInt32((scene?.size.height)! - 100)) + 50
                card.delegate = self
                cards.append(card)
                addChild(card)
                
                //targets
                target = DragableCard(color: UIColor.grayColor(), size: CGSizeMake(cardWidthInPixels, cardHeightInPixels))
                target.index.x = i
                target.index.y = j
                target.position.x = (cardWidthInPixels+1) * CGFloat(i) + offsetX
                target.position.y = (cardHeightInPixels+1) * CGFloat(j) + offsetY
                targets.append(target)
                insertChild(target, atIndex: 0)
            }
        }
    }
    
    func onDragEnded(card: DragableCard) {
        for t in targets{
            if CGRectContainsPoint(t.frame, card.position) {
                card.position.x = cardWidthInPixels*CGFloat(t.index.x) + offsetX
                card.position.y = cardHeightInPixels*CGFloat(t.index.y) + offsetY
                
                card.relatedCard = t
                break
            }else{
                card.relatedCard = nil
            }
        }
        
        //check
        var suc = true
        for c in cards {
            if c.relatedCard?.index.x != c.index.x ||
            c.relatedCard?.index.y != c.index.y{
                suc = false
                break
            }
        }
        if suc {
            print("成功")
        }
        
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
