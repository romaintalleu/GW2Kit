//
//  GWKPartialColor.m
//  GW2Kit
//
//  Created by Romain Talleu on 14/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import "GWKPartialColor.h"

@implementation GWKPartialColor

@synthesize objectType;
@synthesize objectId;

- (id)init {
    self = [super init];
    if (self) {
        objectType = @"color";
        objectId = @"";
    }
    return self;
}

@end
