//
//  GWKMatchs.m
//  GW2Kit
//
//  Created by Romain Talleu on 15/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import "GWKMatches.h"

@implementation GWKMatches

- (id)init
{
    self = [super init];
    if (self) {
        _matches = [NSArray array];
    }
    return self;
}

+ (GWKMatches*)matchesWithJSON:(id)container
{
    GWKMatches* matches = [[GWKMatches alloc] init];
    if (container == nil) return matches;
    
    matches.matches = [container objectForKey:@"wvw_matches"];
    return matches;
}

+ (void)allMatchesWithcallback:(GWKRequestCallback)block
{
    [GWKRequest requestItemAtURI:@"matches" callback:block];
}

@end
