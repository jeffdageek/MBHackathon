//
//  MMWebServiceParser.h
//  MBHackathon
//
//  Created by James Trousdale, Jeff Wilson and Nick Olmsted on 18/06/2014.
//
/*
 
 This is a placeholder class that would ultimately be created into a singleton and manage the pulling of webservice data.
 
 As of the creation of this app, the information that would be desired are provided via the Casper Suite and CrashPlan
 server.  The API's called are:
 
 JSS:
 Get /users/name/ (gets list of Devices for a given user)
 Get /computers/id/{id} (returns information about the computer(s) including FV status and Update status
 
 Crashplan:
 Get /api/Computers?incBackupUsage=true (provides backup completion status)
 
*/

#import <Foundation/Foundation.h>

@interface MMWebServiceParser : NSObject

+(NSString *)getValueFromElement:(NSString *)element withWebServiceURL:(NSString *)url withUsername:(NSString *)username;

@end
