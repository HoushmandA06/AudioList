//
//  ALAData.h
//  AudioList
//
//  Created by Ali Houshmand on 5/12/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALATrack.h"

@interface ALAData : NSObject

+(ALAData *)mainData;

-(void)addNewTrack:(ALATrack *)track;

-(NSArray *)allTracks;


@end
