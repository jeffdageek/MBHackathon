//
//  MMViewController.m
//  MBHackathon
//
//  Created by Jeff Wilson on 18/06/2014.
//  Copyright (c) 2014 Marauders. All rights reserved.
//

#import "MMViewController.h"
#import "MMActivityViewController.h"
#import "MMUrlErrorViewController.h"

// To prevent constant loading of the loading page, define
// a variable to determine if it's been presented already.
BOOL alreadyDisplayedLoadingPage;

// TODO: Fill in with all information and/or move to seperate
// Declarations file.

NSString *jssURL = @"http://";
NSString *crashplanURL = @"https://crashplan.com";
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
    // On first load, display loading page while we check urls and parse XMLs.
    if (!alreadyDisplayedLoadingPage) {
        [self displayLoadingPage];
        NSArray *urls = [NSArray arrayWithObjects:jssURL, crashplanURL,nil];
        if ([self isURLsValid:urls]) {
            NSDictionary *allVariables = [self setupVariables];
            [self checkAndDisplayComplianceStatus:allVariables];
            [self dismissLoadingPage];
        }
        else
            // If urls are not valid, entire app cannot proceed.  Display error
            // and hold.  Future improvements would allow user to correct URL.
            [self urlsNotValid];
    }
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
    alreadyDisplayedLoadingPage = YES;
    MMActivityViewController *activityView = [[MMActivityViewController alloc] init];
    [self presentViewController:activityView animated:NO completion:nil];
}

- (void)dismissLoadingPage
{
    if ([self presentedViewController]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (BOOL)isURLsValid:(NSArray *)urls
{
    // Ensre we're working with an array of strings.
    // Returns true if all urls are valid, returns false if any is invalid.
    for (NSString *urlPath in urls) {
        if (![urlPath isKindOfClass:[NSString class]]) {
            NSLog(@"Not a valid string passed into URL check.");
            return false;
        }
        
        // Go through each URL to test to see if we can even connect to it.
        NSURL *urlToTest = [NSURL URLWithString:urlPath];
        NSURLRequest *siteRequest = [NSURLRequest requestWithURL:urlToTest];
        NSError *error = nil;
        NSURLResponse *response = nil;
        [NSURLConnection sendSynchronousRequest:siteRequest returningResponse:&response error:&error];
        if (error) {
            return false;
        }
    }
    return true;
}

- (void)urlsNotValid
{
    // Stop all processing and display error.
    // TODO: Gracefully allow users to correct URL in app and re-process
    MMUrlErrorViewController *errorView = [[MMUrlErrorViewController alloc] init];
    [self dismissViewControllerAnimated:NO completion:nil];
    [self presentViewController:errorView animated:YES completion:nil];
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
