//
//  ALAiPadViewController.m
//  AudioList
//
//  Created by Ali Houshmand on 5/8/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "ALAiPadSplitViewController.h"   // THE SPLIT VC
#import "ALASoundCloudRequest.h"
#import "ALAiPadTableViewController.h"

@interface ALAiPadSplitViewController () <UISplitViewControllerDelegate>

@end

@implementation ALAiPadSplitViewController
{
    ALAiPadTableViewController * listVC;
    UIViewController * detailVC;
    UINavigationController * nc;
    UITabBarController * tabBar;
     
}

//////// iPAD SPLIT VC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

      
        UITableViewController * playlistVC = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
        
        // add play stop button to play music from stream URL
        detailVC = [[UIViewController alloc] initWithNibName:nil bundle:nil];
        
        nc = [[UINavigationController alloc] initWithRootViewController:detailVC];

        // listVC tab bar "tracks" or "playlists" buttons, click on it and listVC should pop with selected tab
        listVC = [[ALAiPadTableViewController alloc] initWithStyle:UITableViewStylePlain];
        
        tabBar = [[UITabBarController alloc] init];
        [tabBar setViewControllers:@[listVC,playlistVC]];
        
        listVC.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemDownloads tag:0];
        playlistVC.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFeatured tag:1];
        
        self.viewControllers = @[tabBar,nc];
        
        self.delegate = self;
        
        [ALASoundCloudRequest updateData];
        
    }
    return self;
}


-(void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc
{
    barButtonItem.title = @"Button";
    detailVC.navigationItem.leftBarButtonItem = barButtonItem;
    // detailVC.navigationController.navigationBarHidden = NO;
    nc.navigationBarHidden = NO;
 }

-(void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    nc.navigationBarHidden = YES;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
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
