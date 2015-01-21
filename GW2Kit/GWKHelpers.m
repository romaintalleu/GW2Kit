//
//  GWKWvwHelpers.m
//  GW2Kit
//
//  Created by Romain Talleu on 16/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import "GWKHelpers.h"
#import "GWKMatches.h"
#import "GWKConstants.h"

@implementation GWKHelpers

+ (NSString*)fetchMatchIdWithServerId:(NSString*)serverId
{
    __block NSString* matchId;
    
    [GWKMatches allMatchesWithcallback:^(NSError *error, GWKMatches* object) {
        for (int i = 0; i < [object.matches count]; i++) {
            if ([[NSString stringWithFormat:@"%@",[[object.matches objectAtIndex:i] objectForKey:@"red_world_id"]] isEqualToString:serverId] || [[NSString stringWithFormat:@"%@",[[object.matches objectAtIndex:i] objectForKey:@"blue_world_id"]] isEqualToString:serverId] || [[NSString stringWithFormat:@"%@",[[object.matches objectAtIndex:i] objectForKey:@"green_world_id"]] isEqualToString:serverId]) {
                matchId = [[object.matches objectAtIndex:i] objectForKey:@"wvw_match_id"];
                break;
            }
        }
    }];
    
    return matchId;
}

+ (NSDictionary*)potentialPointsWithStructuresDetail:(NSDictionary*)structuresDetail
{
    NSInteger potentialRed = [[structuresDetail objectForKey:@"red_camp"] integerValue] * GWKCampPoints;
    NSInteger potentialBlue = [[structuresDetail objectForKey:@"blue_camp"] integerValue] * GWKCampPoints;
    NSInteger potentialGreen = [[structuresDetail objectForKey:@"green_camp"] integerValue] * GWKCampPoints;
    
    potentialRed += [[structuresDetail objectForKey:@"red_tower"] integerValue] * GWKTowerPoints;
    potentialBlue += [[structuresDetail objectForKey:@"blue_tower"] integerValue] * GWKTowerPoints;
    potentialGreen += [[structuresDetail objectForKey:@"green_tower"] integerValue] * GWKTowerPoints;
    
    potentialRed += [[structuresDetail objectForKey:@"red_keep"] integerValue] * GWKKeepPoints;
    potentialBlue += [[structuresDetail objectForKey:@"blue_keep"] integerValue] * GWKKeepPoints;
    potentialGreen += [[structuresDetail objectForKey:@"green_keep"] integerValue] * GWKKeepPoints;
    
    potentialRed += [[structuresDetail objectForKey:@"red_castle"] integerValue] * GWKCastlePoints;
    potentialBlue += [[structuresDetail objectForKey:@"blue_castle"] integerValue] * GWKCastlePoints;
    potentialGreen += [[structuresDetail objectForKey:@"green_castle"] integerValue] * GWKCastlePoints;
    
    NSMutableDictionary* potentialPoints = [NSMutableDictionary dictionary];
    [potentialPoints setObject:[NSNumber numberWithLong:potentialRed] forKey:@"red"];
    [potentialPoints setObject:[NSNumber numberWithLong:potentialBlue] forKey:@"blue"];
    [potentialPoints setObject:[NSNumber numberWithLong:potentialGreen] forKey:@"green"];
    
    return [potentialPoints copy];
}

@end
