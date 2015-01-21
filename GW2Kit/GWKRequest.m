//
//  GWKRequest.m
//  GW2Kit
//
//  Created by Romain TALLEU on 08/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import "GWKRequest.h"

#import "GWKColor.h"
#import "GWKConstants.h"
#import "GWKEvent.h"
#import "GWKGuild.h"
#import "GWKItem.h"
#import "GWKItems.h"
#import "GWKJSONDecoding.h"
#import "GWKMap.h"
#import "GWKMatch.h"
#import "GWKMatches.h"
#import "GWKObjectives.h"
#import "GWKRecipe.h"
#import "GWKRecipes.h"
#import "GWKSkin.h"
#import "GWKSkins.h"
#import "GWKWorlds.h"

#define GWKAPIBaseUrl @"https://api.guildwars2.com/"

@implementation GWKRequest

+ (void)requestItemAtURI:(NSString*)uri callback:(GWKRequestCallback)block
{
    [self requestItemAtURI:uri withLanguage:(NSString*)GWKLanguageEnglish callback:block];
}

+ (void)requestItemAtURI:(NSString*)uri withLanguage:(NSString*)lang callback:(GWKRequestCallback)block
{
	NSArray* uriDetail = [uri componentsSeparatedByString:@":"];
    NSString* objectType = [uriDetail objectAtIndex:0];
    NSError* error = nil;
    
	if ([objectType isEqualToString:@"recipe"]) {
		NSString* urlString;
        [NSString stringWithFormat:@"%@v1/recipe_details.json?recipe_id=%@&lang=%@", GWKAPIBaseUrl, [uriDetail objectAtIndex:1], lang];
        GWKRecipe* recipe = [GWKRecipe recipeWithJSON:[GWKJSONDecoding JSONFromURL:urlString error:error]];
		block(error, recipe);
    } else if ([objectType isEqualToString:@"recipes"]) {
        NSString* urlString = [NSString stringWithFormat:@"%@v1/recipes.json", GWKAPIBaseUrl];
        GWKRecipes* recipes = [GWKRecipes recipesWithJSON:[GWKJSONDecoding JSONFromURL:urlString error:error]];
        block(error, recipes);
    } else if ([objectType isEqualToString:@"item"]) {
        NSString* urlString = [NSString stringWithFormat:@"%@v1/item_details.json?item_id=%@&lang=%@", GWKAPIBaseUrl, [uriDetail objectAtIndex:1], lang];
        GWKItem* item = [GWKItem itemWithJSON:[GWKJSONDecoding JSONFromURL:urlString error:error]];
        block(error, item);
    } else if ([objectType isEqualToString:@"items"]) {
        NSString* urlString = [NSString stringWithFormat:@"%@v1/items.json", GWKAPIBaseUrl];
        GWKItems* items = [GWKItems itemsWithJSON:[GWKJSONDecoding JSONFromURL:urlString error:error]];
        block(error, items);
    } else if ([objectType isEqualToString:@"skin"]) {
        NSString* urlString = [NSString stringWithFormat:@"%@v1/skin_details.json?skin_id=%@&lang=%@", GWKAPIBaseUrl, [uriDetail objectAtIndex:1], lang];
        GWKSkin* skin = [GWKSkin skinWithJSON:[GWKJSONDecoding JSONFromURL:urlString error:error]];
        block(error, skin);
    } else if ([objectType isEqualToString:@"skins"]) {
        NSString* urlString = [NSString stringWithFormat:@"%@v1/skins.json", GWKAPIBaseUrl];
        GWKSkins* skins = [GWKSkins skinsWithJSON:[GWKJSONDecoding JSONFromURL:urlString error:error]];
        block(error, skins);
    } else if ([objectType isEqualToString:@"match"]) {
        NSString* urlString = [NSString stringWithFormat:@"%@v1/wvw/match_details.json?match_id=%@", GWKAPIBaseUrl, [uriDetail objectAtIndex:1]];
        GWKMatch* match = [GWKMatch matchWithJSON:[GWKJSONDecoding JSONFromURL:urlString error:error]];
        block(error, match);
    } else if ([objectType isEqualToString:@"matches"]) {
        NSString* urlString = [NSString stringWithFormat:@"%@v1/wvw/matches.json", GWKAPIBaseUrl];
        GWKMatches* matches = [GWKMatches matchesWithJSON:[GWKJSONDecoding JSONFromURL:urlString error:error]];
        block(error, matches);
    } else if ([objectType isEqualToString:@"guild"]) {
        NSString* urlString = [NSString stringWithFormat:@"%@v1/guild_details.json?guild_id=%@", GWKAPIBaseUrl, [uriDetail objectAtIndex:1]];
        GWKGuild* guild = [GWKGuild guildWithJSON:[GWKJSONDecoding JSONFromURL:urlString error:error]];
        block(error, guild);
    } else if ([objectType isEqualToString:@"event"]) {
        NSString* urlString = [NSString stringWithFormat:@"%@v1/event_details.json?event_id=%@", GWKAPIBaseUrl, [uriDetail objectAtIndex:1]];
        GWKEvent* event = [GWKEvent eventWithJSON:[GWKJSONDecoding JSONFromURL:urlString error:error]];
        block(error, event);
    } else if ([objectType isEqualToString:@"map"]) {
        NSString* urlString = [NSString stringWithFormat:@"%@v1/maps.json?map_id=%@", GWKAPIBaseUrl, [uriDetail objectAtIndex:1]];
        GWKMap* map = [GWKMap mapWithJSON:[GWKJSONDecoding JSONFromURL:urlString error:error]];
        block(error, map);
    } else if ([objectType isEqualToString:@"color"]) {
        NSString* urlString = [NSString stringWithFormat:@"%@v1/colors.json", GWKAPIBaseUrl];
        NSDictionary* colorDict = [[GWKJSONDecoding JSONFromURL:urlString error:error] objectForKey:@"colors"];
        NSMutableDictionary* colorTmp = [[colorDict objectForKey:[uriDetail objectAtIndex:1]] mutableCopy];
        [colorTmp setObject:[uriDetail objectAtIndex:1] forKey:@"color_id"];
        GWKColor* color = [GWKColor colorWithJSON:colorTmp];
        block(error, color);
    } else if ([objectType isEqualToString:@"objectives"]) {
        NSString* urlString = [NSString stringWithFormat:@"%@v1/wvw/objective_names.json?lang=%@", GWKAPIBaseUrl, lang];
        GWKObjectives* objs = [GWKObjectives objectivesWithJSON:[GWKJSONDecoding JSONFromURL:urlString error:error]];
        block(error, objs);
    } else if ([objectType isEqualToString:@"worlds"]) {
        NSString* urlString = [NSString stringWithFormat:@"%@v1/world_names.json?lang=%@", GWKAPIBaseUrl, lang];
        GWKWorlds* worlds = [GWKWorlds worldsWithJSON:[GWKJSONDecoding JSONFromURL:urlString error:error]];
        block(error, worlds);
    } else {
		NSError* err = [NSError errorWithDomain:NSCocoaErrorDomain code:1 userInfo:nil];
		NSDictionary *errorDictionary = @{ NSLocalizedDescriptionKey: @"The specified URI is invalid",
										   NSUnderlyingErrorKey: err};
		block([[NSError alloc] initWithDomain:NSCocoaErrorDomain code:1 userInfo:errorDictionary], nil);
    }
}

+ (void)requestItemFromPartialObject:(id)partialObject callback:(GWKRequestCallback)block
{
    [self requestItemFromPartialObject:partialObject withLanguage:(NSString *)GWKLanguageEnglish callback:block];
}

+ (void)requestItemFromPartialObject:(id)partialObject withLanguage:(NSString*)lang callback:(GWKRequestCallback)block
{
    [self requestItemAtURI:[NSString stringWithFormat:@"%@:%@", [partialObject objectType], [partialObject objectId]] withLanguage:lang callback:block];
}

@end
