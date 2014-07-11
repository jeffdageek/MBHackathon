//
//  MMViewController.m
//  MBHackathon
//
//  Created by James Trousdale, Jeff Wilson and Nick Olmsted on 18/06/2014.
//

#import "MMViewController.h"
#import "MMUrlErrorViewController.h"
#import "MMUsernamePromptViewController.h"

/*
 
 Many of these variables would ideally be set my the MDM server deploying the app and prompting the 
 user if not present.  Time ran out before this was implemented, so they're statically set here.
 Also, once obtained, the variables should be stored within the app, so subsequent launches do not require
 information to be re-provided.  Also, in event of connection error, the information should be cleared and
 cause a re-prompt.
 
*/

NSString *jssURL = @"http://jamfsoftware.com";
NSString *crashplanURL = @"https://crashplan.com";
NSString *jssUserName = @"username";
NSString *jssPassword = @"password";
NSString *jssPass = @"abc123";
NSString *crashPlanPass = @"abc123";


// Note:  Do not change these...  These are used to prevent errors when reading/writing to variables dictionary
NSString *jSSEndUsernameKey = @"JSSEndUsername";
NSString *crashPlanEndUserNameKey = @"CrashPlanEndUserName";
NSString *allJSSComptuersKey = @"allJSSComputers";
NSString *allCrashPlanComptuersKey = @"allCrashPlanComputers";


// Debugging variables:
int backupValue = 100;
int encryptionValue = 100;
int softwareValues = 100;

@interface MMViewController ()

@end


@implementation MMViewController

@synthesize jssUser, crashPlanUser, crashPlanPass;

- (void)viewDidLoad
{
    [super viewDidLoad];
}

/*
 
 All logic kicks off from this point.
 
 Logic goes as follows:
 1. If we don't yet have a username, prsent a viewcontroller to get the information.
 2. If we have it (or if this view re-appears due to dismissing of previous viewcontroller), load websites into Array
 3. Attempt to connect to the sites, present error viewcontroller if not successful
 4. Load variables into a dictionary (this would call webservces to get actual data if that portion was completed)
 5. Update UI
 
*/

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (jssUser == nil && crashPlanUser == nil) {
        MMUsernamePromptViewController *usernamePrompt = [[MMUsernamePromptViewController alloc] init];
        [self presentViewController:usernamePrompt animated:YES completion:nil];
    }
    else {
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

#pragma mark - Helper Methods

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
    int backupPercent = [[[self backupPercentage] text] intValue];
    int encryptionPercent = [[[self encryptionPercentage] text] intValue];
    int softWarePercent = [[[self softwareUpToDate] text] intValue];
    if (backupPercent == 100 && encryptionPercent == 100  && softWarePercent == 100) {
        [[self statusView] setImage:[UIImage imageNamed:@"1.png"]];
    }
    else if(backupPercent >= 75 && encryptionPercent >= 75  && softWarePercent >= 75){
        [[self statusView] setImage:[UIImage imageNamed:@"2.png"]];
    }
    else if(backupPercent >= 50 && encryptionPercent >= 50  && softWarePercent >= 50) {
        [[self statusView] setImage:[UIImage imageNamed:@"3.png"]];
    }
    else {
        [[self statusView] setImage:[UIImage imageNamed:@"4.png"]];
    }
    int average = (backupPercent + encryptionPercent + softWarePercent)/3;
    [[self overallHealth] setText:[NSString stringWithFormat:@"%i%%",average]];
}

- (void)setJSSUsername:(NSString *)jamfUserName andCrashPlanUsername:(NSString *)code42Username andCrashPlanPassword:(NSString *)crashplanPass{
    [self setJssUser:jamfUserName];
    [self setCrashPlanUser:code42Username];
    [self setCrashPlanPass:crashPlanPass];
}

- (IBAction)reportStolenButtonPressed:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Report Stolen"
                                                    message:@"Click OK to notify IT and wipe all data"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"Ok", nil];
    [alert show];
}


#pragma mark UITextFieldDelegate methods

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self checkAndDisplayComplianceStatus:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

// pragma mark UIAlertViewDelegate methods

/*
 
 This method is untested.  The idea was orginally to display a mail sheet, but started experementing with 
 sending directly without having to present a mail sheet.
 
*/

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        NSString *emailLink = [NSString stringWithFormat:@"mailto:email@pretendco.com?subject=LostDevice&body=Help"];
        NSURL *url = [[NSURL alloc] initWithString:emailLink];
        [[UIApplication sharedApplication] openURL:url];
    }
}

@end
