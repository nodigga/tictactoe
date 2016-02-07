//
//  Model.m
//  tic tac toe
//
//  Created by Nicholas Cardinal on 1/30/16.
//  Copyright © 2016 nodigga. All rights reserved.
//

#import "Model.h"

@implementation Model
{

}

-(instancetype)init
{
    self = [super init];
    if(self)
    {
        self.playerOne = [NSMutableArray array];
        self.playerTwo = [NSMutableArray array];
        self.winner = FALSE;
    }
    return self;
}



-(void)determineWinner:(NSInteger)buttonSelected:(int)player

{
    if(player==1){
    
    [self.playerOne addObject:[NSNumber numberWithInteger:buttonSelected]];
    NSLog(@"check to see winner:");
    }
    else
    {
    [self.playerTwo addObject:[NSNumber numberWithInteger:buttonSelected]];
    
    }
    
    if(([self.playerOne containsObject:[NSNumber numberWithInteger:1]]&& [self.playerOne containsObject:[NSNumber numberWithInteger:2]]&& [self.playerOne containsObject:[NSNumber numberWithInteger:3]]) || ([self.playerOne containsObject:[NSNumber numberWithInteger:4]]&& [self.playerOne containsObject:[NSNumber numberWithInteger:5]]&& [self.playerOne containsObject:[NSNumber numberWithInteger:6]]) || ([self.playerOne containsObject:[NSNumber numberWithInteger:7]]&& [self.playerOne containsObject:[NSNumber numberWithInteger:8]]&& [self.playerOne containsObject:[NSNumber numberWithInteger:9]]) || ([self.playerOne containsObject:[NSNumber numberWithInteger:1]]&& [self.playerOne containsObject:[NSNumber numberWithInteger:4]]&& [self.playerOne containsObject:[NSNumber numberWithInteger:7]]) || ([self.playerOne containsObject:[NSNumber numberWithInteger:2]]&& [self.playerOne containsObject:[NSNumber numberWithInteger:5]]&& [self.playerOne containsObject:[NSNumber numberWithInteger:8]]) || ([self.playerOne containsObject:[NSNumber numberWithInteger:3]]&& [self.playerOne containsObject:[NSNumber numberWithInteger:6]]&& [self.playerOne containsObject:[NSNumber numberWithInteger:9]])|| ([self.playerOne containsObject:[NSNumber numberWithInteger:1]]&& [self.playerOne containsObject:[NSNumber numberWithInteger:5]]&& [self.playerOne containsObject:[NSNumber numberWithInteger:9]]))
    {
        NSLog(@"player one wins");
        [self.playerOne removeAllObjects];
        [self.playerTwo removeAllObjects];
    
        self.winner = TRUE;
        
    };

    if(([self.playerTwo containsObject:[NSNumber numberWithInteger:1]]&& [self.playerTwo containsObject:[NSNumber numberWithInteger:2]]&& [self.playerTwo containsObject:[NSNumber numberWithInteger:3]]) || ([self.playerTwo containsObject:[NSNumber numberWithInteger:4]]&& [self.playerTwo containsObject:[NSNumber numberWithInteger:5]]&& [self.playerTwo containsObject:[NSNumber numberWithInteger:6]]) || ([self.playerTwo containsObject:[NSNumber numberWithInteger:7]]&& [self.playerTwo containsObject:[NSNumber numberWithInteger:8]]&& [self.playerTwo containsObject:[NSNumber numberWithInteger:9]]) || ([self.playerTwo containsObject:[NSNumber numberWithInteger:1]]&& [self.playerTwo containsObject:[NSNumber numberWithInteger:4]]&& [self.playerTwo containsObject:[NSNumber numberWithInteger:7]]) || ([self.playerTwo containsObject:[NSNumber numberWithInteger:2]]&& [self.playerTwo containsObject:[NSNumber numberWithInteger:5]]&& [self.playerTwo containsObject:[NSNumber numberWithInteger:8]]) || ([self.playerTwo containsObject:[NSNumber numberWithInteger:3]]&& [self.playerTwo containsObject:[NSNumber numberWithInteger:6]]&& [self.playerTwo containsObject:[NSNumber numberWithInteger:9]])|| ([self.playerTwo containsObject:[NSNumber numberWithInteger:1]]&& [self.playerTwo containsObject:[NSNumber numberWithInteger:5]]&& [self.playerTwo containsObject:[NSNumber numberWithInteger:9]]))
    {
        NSLog(@"player two wins");
        [self.playerOne removeAllObjects];
        [self.playerTwo removeAllObjects];
        
        self.winner = TRUE;
        
};

}


-(void)resetPlayers
{
    [self.playerOne removeAllObjects];
    [self.playerTwo removeAllObjects];
    self.winner =FALSE;

}

@end
