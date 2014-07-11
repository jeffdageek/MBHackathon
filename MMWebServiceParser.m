//
//  MMWebServiceParser.m
//  MBHackathon
//
//  Created by James Trousdale, Jeff Wilson and Nick Olmsted on 18/06/2014.
//

// This should be a singleton...  Doens't make much of a difference since we're not using it to actually store any
// info.  Instead, just using class variables

#import "MMWebServiceParser.h"

@implementation MMWebServiceParser

/*
 
 This class is meant to be a singleton and would get information from webservices and pass them back to
 the calling class.
 
*/

+(NSString *)getValueFromElement:(NSString *)element withWebServiceURL:(NSString *)url withUsername:(NSString *)username
{
    return @"DATA!";
}


@end

