//
//  SecondRobot.swift
//  RobotWarsOSX
//
//  Created by Gonzalo Caballero on 6/23/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import Foundation

class SecondRobot: Robot {
    
    var angleBetweenTurretAndEnemy = 0
    let gunToleranceAngle = CGFloat(2.0)
    var runs = true
    
    override func run() {
        while runs == true {
            randomMovement()
        }
        
    
    }
    
    override func scannedRobot(robot: Robot!, atPosition position: CGPoint) {
        turnToEnemyPosition(position)
        shoot()
        print("Escaneado")
    }
    
    override func hitWall(hitDirection: RobotWallHitDirection, hitAngle angle: CGFloat) {
        
        if angle >= 0 {
            turnRobotLeft(Int(abs(angle)))
        } else {
            turnRobotRight(Int(abs(angle)))
        }
        
        moveAhead(20)
        
    }
    
    func randomNumber() -> Int {
        let random = Int(arc4random_uniform(50))
        return random
    }
    
    func randomMovement() {
        let random = Int(arc4random_uniform(3))
        
        switch random {
            
        case 0:
            moveAhead(100)
        case 1:
            turnRobotLeft(randomNumber())
        case 2:
            turnRobotRight(randomNumber())
        default:
            print("Not working")
        }
    }
    
    func turnToEnemyPosition(position: CGPoint) {
        cancelActiveAction()
        
        // calculate angle between turret and enemey
        let angleBetweenTurretAndEnemy = angleBetweenGunHeadingDirectionAndWorldPosition(position)
        
        // turn if necessary
        if angleBetweenTurretAndEnemy > gunToleranceAngle {
            turnGunRight(Int(abs(angleBetweenTurretAndEnemy)))
        } else if angleBetweenTurretAndEnemy < -gunToleranceAngle {
            turnGunLeft(Int(abs(angleBetweenTurretAndEnemy)))
        }
    }
    
}




























