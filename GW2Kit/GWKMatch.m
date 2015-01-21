//
//  GWKMatch.m
//  GW2Kit
//
//  Created by Romain Talleu on 12/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import "GWKMatch.h"
#import "GWKConstants.h"
#import "GWKObjectives.h"

@implementation GWKMatch

//GWKPartialObject Protocol
@synthesize objectType;
@synthesize objectId;

- (id)init
{
    self = [super init];
    if (self) {
        objectType = @"match";
        objectId = @"";
        _scores = [NSArray array];
        _redMap = [[GWKWvwMap alloc] init];
        _blueMap = [[GWKWvwMap alloc] init];
        _greenMap = [[GWKWvwMap alloc] init];
        _centerMap = [[GWKWvwMap alloc] init];
    }
    return self;
}

+ (GWKMatch*)matchWithJSON:(id)container
{
    GWKMatch* match = [[GWKMatch alloc] init];
    if (container == nil) return match;
    
    NSDictionary* results = container;
    match.objectId = [results objectForKey:@"match_id"];
    match.scores = [results objectForKey:@"scores"];
    NSArray* mapsTmp = [results objectForKey:@"maps"];
    for (int i = 0; i < [mapsTmp count]; i++) {
        NSDictionary* mapTmp = [mapsTmp objectAtIndex:i];
        if ([[mapTmp objectForKey:@"type"] isEqualToString:@"RedHome"]) {
            match.redMap = [GWKWvwMap wvwMapWithJSON:mapTmp];
        } else if ([[mapTmp objectForKey:@"type"] isEqualToString:@"BlueHome"]) {
            match.blueMap = [GWKWvwMap wvwMapWithJSON:mapTmp];
        } else if ([[mapTmp objectForKey:@"type"] isEqualToString:@"GreenHome"]) {
            match.greenMap = [GWKWvwMap wvwMapWithJSON:mapTmp];
        } else if ([[mapTmp objectForKey:@"type"] isEqualToString:@"Center"]) {
            match.centerMap = [GWKWvwMap wvwMapWithJSON:mapTmp];
        }
    }
    return match;
}

+ (void)matchWithMatchId:(NSString*)matchId callback:(GWKRequestCallback)block
{
    [GWKRequest requestItemAtURI:[NSString stringWithFormat:@"match:%@", matchId] callback:block];
}

- (NSDictionary*)structuresDetailsAllMap;
{
    NSDictionary* redDetails = [_redMap structuresDetails];
    NSDictionary* blueDetails = [_blueMap structuresDetails];
    NSDictionary* greenDetails = [_greenMap structuresDetails];
    NSDictionary* centerDetails = [_centerMap structuresDetails];
    
    NSInteger redCamp = [[redDetails objectForKey:@"red_camp"] integerValue] + [[blueDetails objectForKey:@"red_camp"] integerValue] + [[greenDetails objectForKey:@"red_camp"] integerValue] + [[centerDetails objectForKey:@"red_camp"] integerValue];
    NSInteger blueCamp = [[redDetails objectForKey:@"blue_camp"] integerValue] + [[blueDetails objectForKey:@"blue_camp"] integerValue] + [[greenDetails objectForKey:@"blue_camp"] integerValue] + [[centerDetails objectForKey:@"blue_camp"] integerValue];
    NSInteger greenCamp = [[redDetails objectForKey:@"green_camp"] integerValue] + [[blueDetails objectForKey:@"green_camp"] integerValue] + [[greenDetails objectForKey:@"green_camp"] integerValue] + [[centerDetails objectForKey:@"green_camp"] integerValue];
    
    NSInteger redTower = [[redDetails objectForKey:@"red_tower"] integerValue] + [[blueDetails objectForKey:@"red_tower"] integerValue] + [[greenDetails objectForKey:@"red_tower"] integerValue] + [[centerDetails objectForKey:@"red_tower"] integerValue];
    NSInteger blueTower =[[redDetails objectForKey:@"blue_tower"] integerValue] + [[blueDetails objectForKey:@"blue_tower"] integerValue] + [[greenDetails objectForKey:@"blue_tower"] integerValue] + [[centerDetails objectForKey:@"blue_tower"] integerValue];
    NSInteger greenTower = [[redDetails objectForKey:@"green_tower"] integerValue] + [[blueDetails objectForKey:@"green_tower"] integerValue] + [[greenDetails objectForKey:@"green_tower"] integerValue] + [[centerDetails objectForKey:@"green_tower"] integerValue];

    
    NSInteger redKeep = [[redDetails objectForKey:@"red_keep"] integerValue] + [[blueDetails objectForKey:@"red_keep"] integerValue] + [[greenDetails objectForKey:@"red_keep"] integerValue] + [[centerDetails objectForKey:@"red_keep"] integerValue];
    NSInteger blueKeep = [[redDetails objectForKey:@"blue_keep"] integerValue] + [[blueDetails objectForKey:@"blue_keep"] integerValue] + [[greenDetails objectForKey:@"blue_keep"] integerValue] + [[centerDetails objectForKey:@"blue_keep"] integerValue];
    NSInteger greenKeep = [[redDetails objectForKey:@"green_keep"] integerValue] + [[blueDetails objectForKey:@"green_keep"] integerValue] + [[greenDetails objectForKey:@"green_keep"] integerValue] + [[centerDetails objectForKey:@"green_keep"] integerValue];
    
    NSInteger redCastle = [[centerDetails objectForKey:@"red_castle"] integerValue];
    NSInteger blueCastle = [[centerDetails objectForKey:@"blue_castle"] integerValue];
    NSInteger greenCastle = [[centerDetails objectForKey:@"green_castle"] integerValue];
    
    
    NSMutableDictionary* structures = [NSMutableDictionary dictionary];

    [structures setObject:[NSNumber numberWithLong:redCamp] forKey:@"red_camp"];
    [structures setObject:[NSNumber numberWithLong:blueCamp] forKey:@"blue_camp"];
    [structures setObject:[NSNumber numberWithLong:greenCamp] forKey:@"green_camp"];
    
    [structures setObject:[NSNumber numberWithLong:redTower] forKey:@"red_tower"];
    [structures setObject:[NSNumber numberWithLong:blueTower] forKey:@"blue_tower"];
    [structures setObject:[NSNumber numberWithLong:greenTower] forKey:@"green_tower"];
    
    [structures setObject:[NSNumber numberWithLong:redKeep] forKey:@"red_keep"];
    [structures setObject:[NSNumber numberWithLong:blueKeep] forKey:@"blue_keep"];
    [structures setObject:[NSNumber numberWithLong:greenKeep] forKey:@"green_keep"];
    
    [structures setObject:[NSNumber numberWithLong:redCastle] forKey:@"red_castle"];
    [structures setObject:[NSNumber numberWithLong:blueCastle] forKey:@"blue_castle"];
    [structures setObject:[NSNumber numberWithLong:greenCastle] forKey:@"green_castle"];
    
    return [structures copy];
}

@end
