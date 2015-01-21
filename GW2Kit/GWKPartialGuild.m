//
//  GWKPartialGuild.m
//  GW2Kit
//
//  Created by Romain Talleu on 13/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import "GWKPartialGuild.h"

@implementation GWKPartialGuild

@synthesize objectType;
@synthesize objectId;

- (id)init {
    self = [super init];
    if (self) {
        objectType = @"guild";
        objectId = @"";
        _guildName = @"";
    }
    return self;
}

@end
