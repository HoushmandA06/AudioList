//
//  ALATableViewCell.m
//  AudioList
//
//  Created by Ali Houshmand on 5/8/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "ALATableViewCell.h"
#import "ALAAudioData.h"  // singleton class

@implementation ALATableViewCell
{
    UILabel * albumName;
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
 
        albumName = [[UILabel alloc] initWithFrame:CGRectMake(100,20,200,30)];
        albumName.font = [UIFont systemFontOfSize:30];
        albumName.textColor = [UIColor orangeColor];
        albumName.backgroundColor = [UIColor blackColor];
        [self.contentView addSubview:albumName];
        
        
        
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

-(void)setIndex:(NSInteger)index
{
    _index = index;
    
    NSDictionary * albumInfo = [[ALAAudioData audioData] allAlbumItems][index];
    
    albumName.text = albumInfo[@"name"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
