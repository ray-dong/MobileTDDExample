//
//  Game.h
//  BowlingGameLib
//
//  Created by Ray on 10/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Game : NSObject{
    int score;
}

-(void) rollWithPinCount:(int) pins; 
-(int) score;
@end
