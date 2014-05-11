//
//  ALASoundCloudRequest.m
//  AudioList
//
//  Created by Ali Houshmand on 5/9/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#define CLIENT_ID @".json?client_id=17553011b6a14573af971ad9fe71c035"

#import "ALASoundCloudRequest.h"
#import "ALAAudioData.h"

@implementation ALASoundCloudRequest


+(void)getUserWithUsername:(NSString *)username
{
    
//    NSMutableDictionary * userInfo = [@{} mutableCopy];
    
    NSString * soundCloud = [NSString stringWithFormat:@"http://api.soundcloud.com/users/ali-houshmand/playlists%@",CLIENT_ID];
    
    //https://api.soundcloud.com/users/ali-houshmand/playlists.json?client_id=CLIENT_ID
    
    
    NSURL * url = [NSURL URLWithString:soundCloud];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSData * responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSError * jsonError = nil;
    NSArray * soundCloudProfile = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&jsonError];
    
    // NSLog(@"%@",soundCloudProfile);
    
    
    for (NSDictionary * soundCloudItem in soundCloudProfile)
    {
        
       // NSDictionary * user = [soundCloudItem objectForKey:@"user"]; // gets dictionary user
        //username = [user valueForKey:@"username"];  //gets username within user
     
        username = soundCloudItem[@"user"][@"username"];  // does the same thing as lines above
        NSLog(@"%@",username);
        
        NSString * kindTest = soundCloudItem[@"kind"];
        NSLog(@"%@",kindTest);
        
        NSString * title = soundCloudItem[@"tracks"][0][@"title"];
        NSLog(@"%@",title);
        
        
        
    }
    
    
    
//    for (NSString * key in [soundCloudProfile allKeys]) {
//        userInfo[key] = [ALASoundCloudRequest ...]
//    }
    
}

//+(id)checkbadvalue:(id)value
//{
//    if(value != nil && ![value ])
//    {
//        return value;
//    }
//    
//}


// http://api.soundcloud.com/playlists/4252210.json?client_id=65db70dfcdaab4cf033f9a4003a341e1


@end
