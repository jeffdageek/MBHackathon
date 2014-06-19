//
//  MMActivityViewController.m
//  MBHackathon
//
//  Created by Jeff Wilson on 19/06/2014.
//  Copyright (c) 2014 Marauders. All rights reserved.
//

#import "MMActivityViewController.h"

@interface MMActivityViewController ()

@end

@implementation MMActivityViewController

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
    [mainActivityIndicator startAnimating];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [mainActivityIndicator stopAnimating];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
