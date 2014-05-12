//
//  ALAData.h
//  AudioList
//
//  Created by Ali Houshmand on 5/12/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALATrack.h"
#import "ALAUser.h"
#import "ALAPlaylist.h"

@interface ALAData : NSObject

+(ALAData *)mainData;

//// TRACKS
-(void)addNewTrack:(ALATrack *)track;

-(NSArray *)allTracks;

//// USERS
-(void)addNewUser:(ALAUser *)user;

-(NSArray *)allUsers;

//// PLAYLISTS
-(void)addNewPlaylist:(ALAPlaylist *)playlist;

-(NSArray *)allPlaylists;



@end
