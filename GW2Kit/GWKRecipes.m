//
//  GWKRecipes.m
//  GW2Kit
//
//  Created by Romain Talleu on 14/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import "GWKRecipes.h"

@implementation GWKRecipes

- (id)init
{
    self = [super init];
    if (self) {
        _recipes = [NSArray array];
    }
    return self;
}

+ (GWKRecipes*)recipesWithJSON:(id)container
{
    GWKRecipes* recipes = [[GWKRecipes alloc] init];
    if (container == nil) return recipes;
    
    recipes.recipes = [container objectForKey:@"recipes"];
    return recipes;
}

+ (void)allRecipesWithcallback:(GWKRequestCallback)block
{
    [GWKRequest  requestItemAtURI:@"recipes" callback:block];
}

@end
