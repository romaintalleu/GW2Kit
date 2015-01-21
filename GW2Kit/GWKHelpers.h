//
//  GWKWvwHelpers.h
//  GW2Kit
//
//  Created by Romain Talleu on 16/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GWKHelpers : NSObject


#pragma mark WvW helpers

+ (NSString*)fetchMatchIdWithServerId:(NSString*)serverId;

+ (NSDictionary*)potentialPointsWithStructuresDetail:(NSDictionary*)structuresDetail;

@end
