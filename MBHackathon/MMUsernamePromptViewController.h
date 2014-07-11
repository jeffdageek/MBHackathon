//
//  MMUsernamePromptViewController.h
//  MBHackathon
//
//  Created by James Trousdale, Jeff Wilson and Nick Olmsted on 18/06/2014.
//

/*
 
 MMUsernamePromptViewController is displayed on first launch to capture the user's login creditionals. 
 
 This information is needed for the webservices to determine username and authorization to access user information
 This information is currently staticly passed back to the presenting view controller because it assumes that the
 MMViewController is viewController passing it in.  Further versions should create a protocol for passing back variables
 and use notifications to remain presented until the webServices have had a chance to complete and update the UI.  When
 this is implemented, an activity indicator is recommended.
 
 
 
*/

#import <UIKit/UIKit.h>

@interface MMUsernamePromptViewController : UIViewController <UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UITextField *jamfUsernameBox;
@property (weak, nonatomic) IBOutlet UITextField *crashPlanUsernameBox;
@property (weak, nonatomic) IBOutlet UITextField *crashPlanPassBox;

@end
