//
//  ALAiPadViewController.m
//  AudioList
//
//  Created by Ali Houshmand on 5/8/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "ALAiPadViewController.h"

@interface ALAiPadViewController ()

@end

@implementation ALAiPadViewController
{
    
    UILabel * albumName;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        self.view.backgroundColor = [UIColor blackColor];
    
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    albumName = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 300, 50)];
    albumName.text = @"name";
    albumName.textColor = [UIColor orangeColor];
    [self.view addSubview:albumName];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
