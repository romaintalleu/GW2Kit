//
//  GWKPartialRecipe.m
//  GW2Kit
//
//  Created by Romain TALLEU on 08/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import "GWKPartialRecipe.h"
#import "GWKRequest.h"

@implementation GWKPartialRecipe

@synthesize objectType;
@synthesize objectId;

- (id)init {
    self = [super init];
    if (self) {
        objectType = @"recipe";
        objectId = @"";
    }
    return self;
}

@end
