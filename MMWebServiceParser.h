//
//  MMWebServiceParser.h
//  MBHackathon
//
//  Created by James Trousdale, Jeff Wilson and Nick Olmsted on 18/06/2014.
//

#import <Foundation/Foundation.h>

@interface MMWebServiceParser : NSObject

+(NSString *)getValueFromElement:(NSString *)element withWebServiceURL:(NSString *)url withUsername:(NSString *)username;

@end
