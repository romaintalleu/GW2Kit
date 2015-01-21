//
//  GWKMatch.m
//  GW2Kit
//
//  Created by Romain Talleu on 12/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import "GWKPartialMatch.h"

@implementation GWKPartialMatch

@synthesize objectType;
@synthesize objectId;

- (id)init {
    self = [super init];
    if (self) {
        objectType = @"item";
        objectId = @"";
    }
    return self;
}

@end
