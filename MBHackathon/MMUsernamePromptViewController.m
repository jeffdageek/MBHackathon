//
//  MMUsernamePromptViewController.m
//  MBHackathon
//
//  Created by Jeff Wilson on 24/06/2014.
//  Copyright (c) 2014 Marauders. All rights reserved.
//

#import "MMUsernamePromptViewController.h"
#import "MMViewController.h"

@interface MMUsernamePromptViewController ()

@end

@implementation MMUsernamePromptViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendUsername:(id)sender {
    NSString *jssUsername = [[self jamfUsernameBox] text];
    NSString *crashPlanUsername = [[self crashPlanUsernameBox] text];
    NSString *crashPlanPassword = [[self crashPlanPassBox] text];
    // TODO: Make an actual protocol for this... as this is really sloppy.  Stupid agressive deadlines :(
    if ([[self presentingViewController] isKindOfClass:[MMViewController class]]) {
        [(MMViewController *)[self presentingViewController]setJSSUsername:jssUsername andCrashPlanUsername:crashPlanUsername andCrashPlanPassword:crashPlanPassword];
    }
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}

@end
