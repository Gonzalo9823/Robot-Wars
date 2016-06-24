//
//  Robot2.swift
//  RobotWarsOSX
//
//  Created by Gonzalo Caballero on 6/23/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import Foundation


class Robot2: Robot {
    
    var runs = true
    var fire = false
    
    override func run() {
        while runs {
            moveAhead(500)
            runs = false
            fire = true
        }
        while fire {
            checkAreaAndShot()
        }
    }
    
    func checkAreaAndShot() {
        cancelActiveAction()
        
        
        turnGunRight(10)
        shoot()
//        
//        for i in 0...100 {
//            if (i % 1 == 0) {
//                shoot()
//            }
//            else {
//                turnGunRight(10)
//            }
//        }
        
    }
}