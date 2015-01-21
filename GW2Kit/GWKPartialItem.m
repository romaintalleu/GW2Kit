//
//  GWKPartialItem.m
//  GW2Kit
//
//  Created by Romain TALLEU on 09/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import "GWKPartialItem.h"

@implementation GWKPartialItem

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
