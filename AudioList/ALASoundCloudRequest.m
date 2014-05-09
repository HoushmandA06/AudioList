//
//  ALASoundCloudRequest.m
//  AudioList
//
//  Created by Ali Houshmand on 5/9/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#define CLIENT_ID @".json?client_id=17553011b6a14573af971ad9fe71c035"

#import "ALASoundCloudRequest.h"

@implementation ALASoundCloudRequest


+ (NSDictionary *)getUserWithUsername:(NSString *)username
{
    
    NSMutableDictionary * userInfo = [@{} mutableCopy];
    
    NSString * soundCloud = [NSString stringWithFormat:@"http://api.soundcloud.com/playlists/4252210%@",CLIENT_ID];
    
    NSURL * url = [NSURL URLWithString:soundCloud];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSData * responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSError * jsonError = nil;
    NSDictionary * soundCloudProfile = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&jsonError];
    
    NSLog(@"%@",soundCloudProfile);
  
//    for (NSString * key in [soundCloudProfile allKeys]) {
//        userInfo[key] = [ALASoundCloudRequest ...]
//    }
    
    return userInfo;
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
