//
//  GWKPartialMap.m
//  GW2Kit
//
//  Created by Romain Talleu on 13/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import "GWKPartialMap.h"

@implementation GWKPartialMap

@synthesize objectType;
@synthesize objectId;

- (id)init {
    self = [super init];
    if (self) {
        objectType = @"map";
        objectId = @"";
    }
    return self;
}

@end
