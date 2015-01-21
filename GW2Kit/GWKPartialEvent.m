//
//  GWKPartialEvent.m
//  GW2Kit
//
//  Created by Romain Talleu on 13/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import "GWKPartialEvent.h"

@implementation GWKPartialEvent

@synthesize objectType;
@synthesize objectId;

- (id)init {
    self = [super init];
    if (self) {
        objectType = @"event";
        objectId = @"";
    }
    return self;
}

@end
