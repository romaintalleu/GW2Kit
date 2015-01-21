//
//  GWKMatchs.h
//  GW2Kit
//
//  Created by Romain Talleu on 15/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GWKRequest.h"

@interface GWKMatches : NSObject

@property (nonatomic, readwrite) NSArray* matches;

- (id)init;

+ (GWKMatches*)matchesWithJSON:(id)container;

+ (void)allMatchesWithcallback:(GWKRequestCallback)block;

@end
