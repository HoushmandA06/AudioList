//
//  ALAAudioData.m
//  AudioList
//
//  Created by Ali Houshmand on 5/8/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "ALAAudioData.h"

@interface ALAAudioData ()

@end

@implementation ALAAudioData

+(ALAAudioData *)audioData;
{
    static dispatch_once_t create;
    static ALAAudioData * singleton = nil;
    
    dispatch_once(&create,^ {
        singleton = [[ALAAudioData alloc] init];
    });
    return singleton;
}

-(NSMutableArray *)albumItems
{
    if(_albumItems == nil)
    {
        _albumItems = [@[
                            @{@"name" : @"Radiohead",
                              @"image" : @"image",
                              @"audio file" : @"audio file",
                              @"times played" : @"10",
                              @"like" : @"like"},
                            
                            @{@"name" : @"Smashing Pumpkins",
                              @"image" : @"image",
                              @"audio file" : @"audio file",
                              @"times played" : @"21",
                              @"like" : @"like"},
            
                           ]mutableCopy];
        
        
    }
    return _albumItems;
}

-(NSArray *)allAlbumItems
{
    return [self.albumItems copy];
}


@end
