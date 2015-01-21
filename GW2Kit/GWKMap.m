//
//  GWKMap.m
//  GW2Kit
//
//  Created by Romain Talleu on 13/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import "GWKMap.h"
#import "GWKConstants.h"

@implementation GWKMap

//GWKPartialObject Protocol
@synthesize objectType;
@synthesize objectId;

- (id)init
{
    self = [super init];
    if (self) {
        objectType = @"map";
        objectId = @"";
        _name = @"";
        _minLevel = 0;
        _maxLevel = 0;
        _defaultFloor = 0;
        _floors = [NSArray array];
        _regionId = 0;
        _regionName = @"";
        _continentId = 0;
        _continentName = @"";
        _mapRect = [NSArray array];
        _continentRect = [NSArray array];
    }
    return self;
}

+ (GWKMap*)mapWithJSON:(id)container
{
    GWKMap* map = [[GWKMap alloc] init];
    if (container == nil) return map;
    
    NSDictionary* maps = [container objectForKey:@"maps"];
    map.objectId = [[maps allKeys] objectAtIndex:0];
    
    NSDictionary* results = [maps objectForKey:map.objectId];
    map.name = [results objectForKey:@"map_name"];
    map.minLevel = [[results objectForKey:@"min_level"] integerValue];
    map.maxLevel = [[results objectForKey:@"max_level"] integerValue];
    map.defaultFloor = [[results objectForKey:@"default_floor"] integerValue];
    map.floors = [results objectForKey:@"floors"];
    map.regionId = [[results objectForKey:@"region_id"] integerValue];
    map.regionName = [results objectForKey:@"region_name"];
    map.continentId = [[results objectForKey:@"continent_id"] integerValue];
    map.continentName = [results objectForKey:@"continent_name"];
    map.mapRect = [results objectForKey:@"map_rect"];
    map.continentRect = [results objectForKey:@"continent_rect"];
    
    return map;
}

+ (void)mapWithMapId:(NSString*)mapId callback:(GWKRequestCallback)block
{
    [self mapWithMapId:mapId withLanguage:(NSString *)GWKLanguageEnglish callback:block];
}

+ (void)mapWithMapId:(NSString *)mapId withLanguage:(NSString*)lang callback:(GWKRequestCallback)block
{
    [GWKRequest requestItemAtURI:[NSString stringWithFormat:@"map:%@", mapId] withLanguage:lang callback:block];
}

@end
