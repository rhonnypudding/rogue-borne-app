//
//  CharacterDetailsPopup.swift
//  Robue-Borne-App
//
//  Created by Joshua Wright on 4/16/16.
//  Copyright © 2016 nblogn.com. All rights reserved.
//

import Foundation
import SpriteKit

class CharacterDetailsPopup: SKNode {
    
    //-------------------------------------------------------------------------------------------//
    //
    // DETAILS -- Draw/hide the details modal popup window
    //
    //-------------------------------------------------------------------------------------------//
    func showDetailsModalForNode (nodeToDetail: SKNode, parent: SKNode) {
        
        self.moveToParent(parent)
        
        let detailsModal = SKShapeNode()
        detailsModal.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 500, height: 500), cornerRadius: 8).CGPath
        detailsModal.position = CGPoint(x: CGRectGetMidX(frame), y: CGRectGetMidY(frame))
        detailsModal.fillColor = UIColor(red: 0.2, green: 0.1, blue: 0.3, alpha: 0.7)
        detailsModal.strokeColor = UIColor(red: 0.4, green: 0.2, blue: 0.1, alpha: 0.7)
        detailsModal.lineWidth = 10
        detailsModal.glowWidth = 5
        detailsModal.zPosition = 99
        detailsModal.position = CGPoint(x: 400, y:100)
        addChild(detailsModal)
        
        self.zPosition = 99
        
        //TODO: lookup the details nodeToDetail and print out details!
        
        
    }
    
    func hideDetailsModal () {
        //remove details window
        self.removeFromParent()
    }

    
    
}