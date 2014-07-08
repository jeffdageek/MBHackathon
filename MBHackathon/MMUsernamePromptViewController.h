//
//  MMUsernamePromptViewController.h
//  MBHackathon
//
//  Created by Jeff Wilson on 24/06/2014.
//  Copyright (c) 2014 Marauders. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMUsernamePromptViewController : UIViewController <UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UITextField *jamfUsernameBox;

@property (weak, nonatomic) IBOutlet UITextField *crashPlanUsernameBox;

@property (weak, nonatomic) IBOutlet UITextField *crashPlanPassBox;

@end
