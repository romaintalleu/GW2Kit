//
//  GWKJSONDecoding.h
//  GW2Kit
//
//  Created by Romain Talleu on 11/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GWKJSONDecoding : NSObject

+ (id)JSONFromURL:(NSString*)url error:(id)error;

@end
