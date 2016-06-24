//
//  MyRobot.swift
//  RobotWarsOSX
//
//  Created by Gonzalo Caballero on 6/23/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import Foundation

class MyRobot: Robot {
    
    enum Estados {
        case Buscando, Escaneando, Disparando
    }
    
    var gunAngle = CGFloat(2.0)
    var estadoActual = Estados.Buscando
    
    override func run() {
        while true {
            switch estadoActual {
            case .Buscando:
                randomMovement()
                
            default:
                break
                
            }
        }
    }
    
    override func scannedRobot(robot: Robot!, atPosition position: CGPoint) {
        turnToEnemyPosition(position)
        shoot()
    }
    
    override func hitWall(hitDirection: RobotWallHitDirection, hitAngle angle: CGFloat) {
        
        
        // Aqui ve cual es la forma mas rapida de doblar
        
        if angle >= 0 {
            turnRobotLeft(Int(abs(angle)))
        }
        else {
            turnRobotRight(Int(abs(angle)))
        }
        
}
    func turnToEnemyPosition(position: CGPoint) {
        
        cancelActiveAction()
        estadoActual = Estados.Escaneando
        
        //Angulo entre tu y tu enemigo
        let anguloHaciaEnemigo = angleBetweenGunHeadingDirectionAndWorldPosition(position)
        
        if anguloHaciaEnemigo > gunAngle {
            turnGunRight(Int(abs(anguloHaciaEnemigo)))
        }
        else if anguloHaciaEnemigo < gunAngle {
            turnGunLeft(Int(abs(anguloHaciaEnemigo)))
        }
    }
    
    
    
    
    
    
    
    
    
    //---------------Funciones para numeros al azar--------------------------------
    
    func randomNumber() -> Int {
        let random = Int(arc4random_uniform(50))
        return random
    }
    
    func randomMovement() {
        let randomOption = Int(arc4random_uniform(3))
        
        switch randomOption {
        case 0:
            moveAhead(100)
        case 1:
            turnRobotRight(randomNumber())
        case 2:
            turnRobotLeft(randomNumber())
        default:
            print("Hay un problema 😁")
        }
    }
    
    //-----------------------------------------------------------------------------
}
