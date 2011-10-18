//
//  Game.m
//  BowlingGameLib
//
//  Created by Ray on 10/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Game.h"

@implementation Game

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

-(void) rollWithPinCount:(int) pins {
    score += pins;
}

-(int) score {
    return score;
}

@end
