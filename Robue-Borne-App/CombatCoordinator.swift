//
//  CombatCoordinator.swift
//  Robue-Borne-App
//
//  Created by Joshua Wright on 8/2/16.
//  Copyright © 2016 nblogn.com. All rights reserved.
//

import Foundation
import SpriteKit


class CombatCoordinator {

    
    init() {
        
    }
    

    
    func doTurn (heroTurnAction: HeroAction, dungeonLevel: DungeonLevel) -> Void {
        
        //for each monster (within range? And not sleeping?)
            //Can the hero move? If so...
                //Can the hero attack?
                //Can the monsters attach?
        
        //heroTurnAction.move
        
        
        
    }
    
    
    
    private func moveHero(x:Int, y:Int, dungeonLevel: DungeonLevel) {
        
        switch dungeonLevel.myDungeonMap.dungeonMap[dungeonLevel.myHero.location.y + y][dungeonLevel.myHero.location.x + x].tileType {
            
        case .door, .corridorHorizontal, .corridorVertical, .grass, .ground:
            
            //Figure out new hero location/position
            dungeonLevel.myHero.location.x = dungeonLevel.myHero.location.x + x
            dungeonLevel.myHero.location.y = dungeonLevel.myHero.location.y + y
            let xyPointDiff = convertBoardCoordinatetoCGPoint(x: dungeonLevel.myHero.location.x, y:dungeonLevel.myHero.location.y)
            
            //Move the background for parallax effect:
            let newBackgroundX = dungeonLevel.dungeonBackground.position.x + (CGFloat(tileSize.width) * CGFloat(x)*0.5)
            let newBackgroundY = dungeonLevel.dungeonBackground.position.y + (CGFloat(tileSize.height) * CGFloat(y)*0.35)
            let newDungeonBackgroundPosition = CGPoint(x: newBackgroundX, y: newBackgroundY)
            
            //Run the actions; do I need to group these to do in parallel???
            dungeonLevel.dungeonBackground.run(SKAction.move(to: newDungeonBackgroundPosition, duration: 0.1))
            dungeonLevel.myHero.run(SKAction.move(to: xyPointDiff, duration: 0.1))
            
        default: break
        }
        
    }//moveHero()

    
    
    
    private func monsterAttack() -> Void {
        
        
        
    }
    
    
    //COPIED -- NOT BEING USED YET
    private func moveMonster(dungeonLevel: DungeonLevel) -> Void {
        // Let's just move randomly for now.
        // Pick a cardinal direction and check for collision
        // Repeat until a successful move has occurred or
        // the number of tries reaches 5. Dude could be trapped
        // like a Piner in a closet and we don't want to hang
        // JOSH: LOL!
        
        var hasMoved: Bool=false
        var numTries: Int=0
        var direction: Int
        
        
        while ( hasMoved == false ) && ( numTries < 5) {
            
            direction = Int(arc4random_uniform(4))
            
            
            switch direction {
            case 0:
                // Try north
                
                switch dungeonLevel.myDungeonMap.dungeonMap[dungeonLevel.aMonster.getCurrentLocation().y-1][dungeonLevel.aMonster.getCurrentLocation().x].tileType  {
                    
                case .door, .corridorHorizontal, .corridorVertical, .grass, .ground:
                    dungeonLevel.aMonster.setCurrentLocation(dungeonLevel.aMonster.getCurrentLocation().x, Y: dungeonLevel.aMonster.getCurrentLocation().y-1)
                    hasMoved = true
                default:
                    break
                }
                
            case 1:
                // Try south
                
                switch dungeonLevel.myDungeonMap.dungeonMap[dungeonLevel.aMonster.getCurrentLocation().y+1][dungeonLevel.aMonster.getCurrentLocation().x].tileType {
                    
                case .door, .corridorHorizontal, .corridorVertical, .grass, .ground:
                    dungeonLevel.aMonster.setCurrentLocation(dungeonLevel.aMonster.getCurrentLocation().x, Y: dungeonLevel.aMonster.getCurrentLocation().y+1)
                    hasMoved = true
                default:
                    break
                }
                
                
            case 2:
                // Try east
                
                switch dungeonLevel.myDungeonMap.dungeonMap[dungeonLevel.aMonster.getCurrentLocation().y][dungeonLevel.aMonster.getCurrentLocation().x-1].tileType {
                    
                case .door, .corridorHorizontal, .corridorVertical, .grass, .ground:
                    dungeonLevel.aMonster.setCurrentLocation(dungeonLevel.aMonster.getCurrentLocation().x-1, Y: dungeonLevel.aMonster.getCurrentLocation().y)
                    hasMoved = true
                default:
                    break
                }
                
                
            case 3:
                // Try west
                
                switch dungeonLevel.myDungeonMap.dungeonMap[dungeonLevel.aMonster.getCurrentLocation().y][dungeonLevel.aMonster.getCurrentLocation().x+1].tileType {
                    
                case .door, .corridorHorizontal, .corridorVertical, .grass, .ground:
                    dungeonLevel.aMonster.setCurrentLocation(dungeonLevel.aMonster.getCurrentLocation().x+1, Y: dungeonLevel.aMonster.getCurrentLocation().y)
                    hasMoved = true
                default:
                    break
                }
                
                
            default:
                
                print("Fell through monster move switch")
            }
            
            numTries += 1
        }
        
        let xyPointDiff = convertBoardCoordinatetoCGPoint(x: dungeonLevel.aMonster.location.x, y: dungeonLevel.aMonster.location.y)
        
        dungeonLevel.aMonster.run(SKAction.move(to: xyPointDiff, duration: 0.1))
        
    }//moveMonster()

    

    
}
