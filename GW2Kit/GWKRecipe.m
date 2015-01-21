//
//  GWKRecipe.m
//  GW2Kit
//
//  Created by Romain TALLEU on 08/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import "GWKRecipe.h"
#import "GWKRequest.h"
#import "GWKConstants.h"

@implementation GWKRecipe

@synthesize objectType;
@synthesize objectId;

- (id)init
{
	self = [super init];
	if (self) {
        objectType = @"recipe";
        objectId = @"";
		_type = @"";
		_outputItemId = 0;
		_outputItemCount = 0;
		_minRating = @"";
		_timeToCraftMs = 0;
		_vendorValue = 0;
		_disciplines = [NSArray array];
		_flags = [NSArray array];
		_ingredients = [NSArray array];
	}
	return self;
}

+ (GWKRecipe*)recipeWithJSON:(id)container
{
    GWKRecipe* recipe = [[GWKRecipe alloc] init];
    if (container == nil) return recipe;
    
    NSDictionary* results = container;
    
    recipe.objectType = @"recipe";
    recipe.objectId = [results objectForKey:@"recipe_id"];
    recipe.type = [NSString stringWithFormat:@"GWKRecipeType%@", [results objectForKey:@"type"]];
    recipe.outputItemId = [[results objectForKey:@"output_item_id"] integerValue];
    recipe.outputItemCount = [[results objectForKey:@"output_item_count"] integerValue];
    recipe.minRating = [results objectForKey:@"min_rating"];
    recipe.timeToCraftMs = [[results objectForKey:@"time_to_craft_ms"] integerValue];
    recipe.vendorValue = [[results objectForKey:@"vendor_value"] integerValue];
    
    NSArray *disciplinesTmp = [results objectForKey:@"disciplines"];
    NSMutableArray* disciplines = [NSMutableArray array];
    for (int i = 0; i < [disciplinesTmp count]; i++) {
        [disciplines addObject:[NSString stringWithFormat:@"GWKRecipeDescipline%@", [disciplinesTmp objectAtIndex:i]]];
    }
    recipe.disciplines = [disciplines copy];
    
    NSArray *flagsTmp = [results objectForKey:@"flags"];
    NSMutableArray* flags = [NSMutableArray array];
    for (int i = 0; i < [flagsTmp count]; i++) {
        [flags addObject:[NSString stringWithFormat:@"GWKRecipeFlag%@", [flagsTmp objectAtIndex:i]]];
    }
    recipe.flags = [flags copy];
    recipe.ingredients = [results objectForKey:@"ingredients"];
    
    return recipe;
}

+ (void)recipeWithRecipeId:(NSString*)recipeId callback:(GWKRequestCallback)block
{
    [self recipeWithRecipeId:recipeId withLanguage:(NSString *)GWKLanguageEnglish callback:block];
}

+ (void)recipeWithRecipeId:(NSString*)recipeId withLanguage:(NSString*)lang callback:(GWKRequestCallback)block
{
    [GWKRequest requestItemAtURI:[NSString stringWithFormat:@"recipe:%@", recipeId] withLanguage:lang callback:block];
}

@end
