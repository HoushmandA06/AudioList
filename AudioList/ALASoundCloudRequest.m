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
        
        for (NSDictionary * playlist in scInfo)
        {
            
         
            
            
            // create a new playlist and set things like playlist title
            
            for (NSDictionary * trackInfo in playlist[@"tracks"])
            {
                if(!trackInfo[@"streamable"]) continue;
                
                ALATrack * track = [ALATrack newTrack];
                
                track[@"title"] = trackInfo[@"title"];
                
                track[@"url"] = trackInfo[@"stream_url"];
                
                [[ALAData mainData] addNewTrack:track];
            }
        }
        

        NSLog(@"%@", [[ALAData mainData] allTracks]);
        
      
        
        
        NSNotificationCenter * nCenter = [NSNotificationCenter defaultCenter]; // singleton
        
        [nCenter postNotificationName:@"dataUpdated" object:nil];
        
       // [nCenter postNotificationCenter:@"dataUpdated" object:nil];
    
    }];
                              
}

@end
