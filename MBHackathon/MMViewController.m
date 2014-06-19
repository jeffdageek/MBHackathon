//
//  MMViewController.m
//  MBHackathon
//
//  Created by Jeff Wilson on 18/06/2014.
//  Copyright (c) 2014 Marauders. All rights reserved.
//

#import "MMViewController.h"
#import "MMActivityViewController.h"

// To prevent constant loading of the loading page, define
// a variable to determine if it's been presented already.
BOOL alreadyDisplayedLoadinPage;

// TODO: Fill in with all information and/or move to seperate
// Declarations file.

NSString *jssURL = @"https://www";
NSString *crashplanURL = @"https://";
NSString *jssUserName = @"username";
NSString *jssPassword = @"password";


NSString *jSSEndUsernameKey = @"JSSEndUsername";
NSString *crashPlanEndUserNameKey = @"CrashPlanEndUserName";
NSString *allJSSComptuersKey = @"allJSSComputers";
NSString *allCrashPlanComptuersKey = @"allCrashPlanComputers";

@interface MMViewController ()

@end


@implementation MMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (!alreadyDisplayedLoadinPage) {
        [self displayLoadingPage];
    }
	if ([self isURLsValid]) {
        NSDictionary *allVariables = [self setupVariables];
        [self checkAndDisplayComplianceStatus:allVariables];
    }
    else
        [self urlsNotValid];
    {
    }
    [self dismissLoadingPage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Helper Functions

- (NSDictionary *)setupVariables
{
    NSMutableDictionary *variables = [[NSMutableDictionary alloc] init];
    
    // Get the variables from the end user and set them up in a dictionary
    
    NSString *jssEndUserName = [self getJSSUserName];
    NSString *crashPlanEndUserName = [self getCrashPlanUserName];
    
    [variables setObject:jssEndUserName forKey:jSSEndUsernameKey];
    [variables setObject:crashPlanEndUserName forKey:crashPlanEndUserNameKey];
    [variables setObject:[self getComputerJSSIDsforUser:jssEndUserName] forKey:allJSSComptuersKey];
    [variables setObject:[self getComputerCrashPlanIDsforUser:crashPlanEndUserName] forKey:allCrashPlanComptuersKey];
    
    return variables;
}

- (void)displayLoadingPage
{
    alreadyDisplayedLoadinPage = YES;
    MMActivityViewController *activityView = [[MMActivityViewController alloc] init];
    [self presentViewController:activityView animated:NO completion:nil];
}

- (void)dismissLoadingPage
{
    if ([self presentedViewController]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (BOOL)isURLsValid
{
    return true;
}

- (void)urlsNotValid
{
    // TODO: Exit out or prompt for new URL's
    NSLog(@"URLs are not valid.  Need to handle.  URL's are \njss: %@\ncrashplan: %@", jssURL, crashplanURL);
}

- (NSString *)getJSSUserName
{
    // TODO: Create a model dialog that will prompt the user for their username
    return @"user";
}

- (NSString *)getCrashPlanUserName
{
    // TODO: Create a model dialog that will prompt the user for their username
    return @"user";
}

- (NSMutableArray *)getComputerJSSIDsforUser:(NSString *)username
{
    NSMutableArray *allComputers = [[NSMutableArray alloc] init];
    return allComputers;
}

- (NSMutableArray *)getComputerCrashPlanIDsforUser:(NSString *)username
{
    NSMutableArray *allComputers = [[NSMutableArray alloc] init];
    return allComputers;
}

- (void)checkAndDisplayComplianceStatus:(NSDictionary *)varibles
{
    
}

@end
