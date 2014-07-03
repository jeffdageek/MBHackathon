//
//  MMViewController.h
//  MBHackathon
//
//  Created by Jeff Wilson on 18/06/2014.
//  Copyright (c) 2014 Marauders. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMViewController : UIViewController <UITextFieldDelegate>
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


@end
