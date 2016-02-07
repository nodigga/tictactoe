//
//  Model.h
//  tic tac toe
//
//  Created by Nicholas Cardinal on 1/30/16.
//  Copyright © 2016 nodigga. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property(nonatomic,strong) NSMutableArray *playerOne, *playerTwo;
@property BOOL winner;

-(void)determineWinner:(NSInteger)buttonSelected:(int)player;



-(void)resetPlayers;


@end
