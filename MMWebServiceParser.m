//
//  MMWebServiceParser.m
//  MBHackathon
//
//  Created by Jeff Wilson on 30/06/2014.
//  Copyright (c) 2014 Marauders. All rights reserved.
//

// This should be a singleton...  Doens't make much of a difference since we're not using it to actually store any
// info.  Instead, just using class variables

#import "MMWebServiceParser.h"

@implementation MMWebServiceParser

+(NSString *)getValueFromElement:(NSString *)element withWebServiceURL:(NSString *)url withUsername:(NSString *)username
{
    return @"DATA!";
}


@end

