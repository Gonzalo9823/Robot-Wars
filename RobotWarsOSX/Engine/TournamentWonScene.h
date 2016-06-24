//
//  TournamentWonScene.h
//  RobotWar
//
//  Created by Daniel Haaser on 7/6/14.
//  Copyright (c) 2014 Make School. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface TournamentWonScene : SKScene

@property (nonatomic, copy) NSString* winningRobot;
@property (nonatomic, assign) int recordWins;
@property (nonatomic, assign) int recordLosses;

@end
