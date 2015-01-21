//
//  GWKWvwMap.m
//  GW2Kit
//
//  Created by Romain Talleu on 12/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import "GWKWvwMap.h"
#import "GWKObjectives.h"

@implementation GWKWvwMap

- (id)init
{
    self = [super init];
    if (self) {
        _type = @"";
        _scores = [NSArray array];
        _objectives = [NSArray array];
        _bonuses = [NSArray array];
    }
    return self;
}

+ (GWKWvwMap*)wvwMapWithJSON:(id)container
{
    GWKWvwMap* map = [[GWKWvwMap alloc] init];
    if (container == nil) return map;
    
    NSDictionary* results = container;
    map.type = [results objectForKey:@"type"];
    map.scores = [results objectForKey:@"scores"];
    map.objectives = [results objectForKey:@"objectives"];
    map.bonuses = [results objectForKey:@"bonuses"];
    
    __block NSMutableDictionary* structures = [NSMutableDictionary dictionary];
    
    [GWKObjectives allObjectivesWithcallback:^(NSError *error, GWKObjectives* object) {
        NSInteger redCamp = 0;
        NSInteger blueCamp = 0;
        NSInteger greenCamp = 0;
        
        NSInteger redTower = 0;
        NSInteger blueTower = 0;
        NSInteger greenTower = 0;
        
        NSInteger redKeep = 0;
        NSInteger blueKeep = 0;
        NSInteger greenKeep = 0;
        
        NSInteger redCastle = 0;
        NSInteger blueCastle = 0;
        NSInteger greenCastle = 0;
        
        for (int y = 0; y < [map.objectives count]; y++) {
            NSDictionary* dict = [map.objectives objectAtIndex:y];
            NSString* objectiveId = [dict objectForKey:@"id"];
            NSString* owner = [dict objectForKey:@"owner"];
            if ([owner isEqualToString:@"Red"]) {
                NSString* type = [object structureType:objectiveId];
                if ([type isEqualToString:@"Tower"]) {
                    redTower++;
                } else if ([type isEqualToString:@"Keep"]) {
                    redKeep++;
                } else if ([type isEqualToString:@"Castle"]){
                    redCastle++;
                } else if ([type isEqualToString:@"Camp"]) {
                    redCamp++;
                }
            } else if ([owner isEqualToString:@"Blue"]) {
                NSString* type = [object structureType:objectiveId];
                if ([type isEqualToString:@"Tower"]) {
                    blueTower++;
                } else if ([type isEqualToString:@"Keep"]) {
                    blueKeep++;
                } else if ([type isEqualToString:@"Castle"]){
                    blueCastle++;
                } else if ([type isEqualToString:@"Camp"]) {
                    blueCamp++;
                }
            } else if ([owner isEqualToString:@"Green"]) {
                NSString* type = [object structureType:objectiveId];
                if ([type isEqualToString:@"Tower"]) {
                    greenTower++;
                } else if ([type isEqualToString:@"Keep"]) {
                    greenKeep++;
                } else if ([type isEqualToString:@"Castle"]){
                    greenCastle++;
                } else if ([type isEqualToString:@"Camp"]) {
                    greenCamp++;
                }
            }
        }
        
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
        
        map.structuresDetails = [structures copy];
    }];
    
    
    return map;
}

- (NSDictionary*)structuresDetails
{
    return _structuresDetails;
}

@end
