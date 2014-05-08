//
//  ALAAudioData.h
//  AudioList
//
//  Created by Ali Houshmand on 5/8/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALAAudioData : NSObject

+(ALAAudioData *)audioData;

@property (nonatomic) NSMutableArray * albumItems;

-(NSArray *)allAlbumItems;


@end
