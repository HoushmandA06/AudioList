//
//  ALAPlaylist.h
//  AudioList
//
//  Created by Ali Houshmand on 5/12/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "ALADictionary.h"

@class ALAUser;

@interface ALAPlaylist : ALADictionary

+(id)newPlaylist;


@property ALAUser * user;

@property NSArray * track;



@end
