//
//  MMViewController.h
//  MBHackathon
//
//  Created by James Trousdale, Jeff Wilson and Nick Olmsted on 18/06/2014.
//
//  This is the main view of the app.  Workflow is initiated on viewDidAppear and is as follows:
/*
 
 1. Check for existing username and password (To do: Read/Write to file so not prompted on each launch)
 2. If not known, create a view controller to prompt for info and display it to collect.
 3. If set, check for internet connection and display error view controller if not connected
 4. Check values and change UI based on current status (To Do: Pull this from Web Services instead of static assigned)
 
 Basic Model-View-Controller-Store practices were attempted.  MMWebServiceParser is intended to be the store that would
 brocker the model (external web services).  At the time of submission for the Mac Hackathon, the web services portion 
 were not yet developed.
 
*/

#import <UIKit/UIKit.h>

@interface MMViewController : UIViewController <UITextFieldDelegate, UIAlertViewDelegate>
{
    NSString *jssUser;
    NSString *crashPlanUser;
    NSString *crashPlanPass;
}

- (void)setJSSUsername:(NSString *)jamfUserName andCrashPlanUsername:(NSString *)code42Username andCrashPlanPassword:(NSString *)crashplanPass;

@property (readwrite, nonatomic) NSString *jssUser;
@property (readwrite, nonatomic) NSString *crashPlanUser;
@property (readwrite, nonatomic) NSString *crashPlanPass;
@property (weak, nonatomic) IBOutlet UIImageView *statusView;
@property (weak, nonatomic) IBOutlet UITextField *backupPercentage;
@property (weak, nonatomic) IBOutlet UITextField *encryptionPercentage;
@property (weak, nonatomic) IBOutlet UITextField *softwareUpToDate;
@property (weak, nonatomic) IBOutlet UILabel *overallHealth;


@end
