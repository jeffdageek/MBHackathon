//
//  MMWebServiceParser.h
//  MBHackathon
//
//  Created by Jeff Wilson on 30/06/2014.
//  Copyright (c) 2014 Marauders. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMWebServiceParser : NSObject

+(NSString *)getValueFromElement:(NSString *)element withWebServiceURL:(NSString *)url withUsername:(NSString *)username;

@end
