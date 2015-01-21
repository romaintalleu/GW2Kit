//
//  GWKJSONDecoding.m
//  GW2Kit
//
//  Created by Romain Talleu on 11/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import "GWKJSONDecoding.h"

@implementation GWKJSONDecoding

+ (id)JSONFromURL:(NSString*)url error:(id)error
{
    NSData* returnedData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    
    if (returnedData == nil) {
        NSError* err = [NSError errorWithDomain:NSCocoaErrorDomain code:1 userInfo:nil];
        NSDictionary *errorDictionary = @{ NSLocalizedDescriptionKey: @"The specified JSON is invalid",
                                           NSUnderlyingErrorKey: err};
        error = [[NSError alloc] initWithDomain:NSCocoaErrorDomain code:1 userInfo:errorDictionary];
        return nil;
    }
    
    return [NSJSONSerialization JSONObjectWithData:returnedData options:0 error:&error];
}

@end
