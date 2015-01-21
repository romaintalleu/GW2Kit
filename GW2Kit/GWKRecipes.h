//
//  GWKRecipes.h
//  GW2Kit
//
//  Created by Romain Talleu on 14/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GWKRequest.h"

@interface GWKRecipes : NSObject

@property (nonatomic, readwrite) NSArray* recipes;

- (id)init;

+ (GWKRecipes*)recipesWithJSON:(id)container;

+ (void)allRecipesWithcallback:(GWKRequestCallback)block;

@end
