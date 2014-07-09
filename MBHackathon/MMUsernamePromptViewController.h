//
//  MMUsernamePromptViewController.h
//  MBHackathon
//
//  Created by James Trousdale, Jeff Wilson and Nick Olmsted on 18/06/2014.
//

#import <UIKit/UIKit.h>

@interface MMUsernamePromptViewController : UIViewController <UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UITextField *jamfUsernameBox;

@property (weak, nonatomic) IBOutlet UITextField *crashPlanUsernameBox;

@property (weak, nonatomic) IBOutlet UITextField *crashPlanPassBox;

@end
