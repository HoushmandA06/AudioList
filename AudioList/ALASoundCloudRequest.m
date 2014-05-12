//
//  ALASoundCloudRequest.m
//  AudioList
//
//  Created by Ali Houshmand on 5/12/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#define CLIENT_ID @"client_id=17553011b6a14573af971ad9fe71c035"

#define USER_NAME @"ali-houshmand"

#define SC_API @"https://api.soundcloud.com"

#import "ALASoundCloudRequest.h"
#import "ALAData.h"


// https://api.soundcloud.com/users/ali-houshmand/playlists.json?client_id=17553011b6a14573af971ad9fe71c035
// users/ali-houshmand/playlists.json?

@implementation ALASoundCloudRequest

+(void)updateData
{
    
    NSURL * requestURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/users/%@/playlists.json?%@",SC_API,USER_NAME,CLIENT_ID]];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:requestURL];
    
    NSOperationQueue * queue = [[NSOperationQueue alloc] init];
    
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        NSArray * scInfo = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        for (NSDictionary * playListInfo in scInfo)
        {
            ALAPlaylist * playlist = [ALAPlaylist newPlaylist];
            playlist[@"title"] = playListInfo[@"title"];
            [[ALAData mainData] addNewPlaylist:playlist];
            
            for (NSDictionary * trackInfo in playListInfo[@"tracks"])
            {
                if(!trackInfo[@"streamable"]) continue;
                ALATrack * track = [ALATrack newTrack];
                track.playlist = playlist;
                track[@"title"] = trackInfo[@"title"];
                track[@"url"] = trackInfo[@"stream_url"];
                
                [playlist.tracks addObject:track];
                
                [[ALAData mainData] addNewTrack:track];
                
                ALAUser * user = [ALAUser newUser];
                user[@"name"] = trackInfo[@"user"][@"username"];
                track.user = user;
                [[ALAData mainData] addNewUser:user];
            }
        }
        
        NSLog(@"%@", [[ALAData mainData] allTracks]);
        NSLog(@"%@", [[ALAData mainData] allPlaylists]);
        NSLog(@"%@", [[ALAData mainData] allUsers]);
    
        
        NSNotificationCenter * nCenter = [NSNotificationCenter defaultCenter]; // singleton
        
        [nCenter postNotificationName:@"dataUpdated" object:nil];
        
       // [nCenter postNotificationCenter:@"dataUpdated" object:nil];
    
    }];
                              
}

@end
