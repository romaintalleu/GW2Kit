//
//  GWKMap.h
//  GW2Kit
//
//  Created by Romain Talleu on 13/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GWKPartialMap.h"
#import "GWKRequest.h"

@interface GWKMap : GWKPartialMap

@property (nonatomic, readwrite) NSString* name;
@property (nonatomic, readwrite) NSInteger minLevel;
@property (nonatomic, readwrite) NSInteger maxLevel;
@property (nonatomic, readwrite) NSInteger defaultFloor;
@property (nonatomic, readwrite) NSArray* floors;
@property (nonatomic, readwrite) NSInteger regionId;
@property (nonatomic, readwrite) NSString* regionName;
@property (nonatomic, readwrite) NSInteger continentId;
@property (nonatomic, readwrite) NSString* continentName;
@property (nonatomic, readwrite) NSArray* mapRect;
@property (nonatomic, readwrite) NSArray* continentRect;

- (id)init;

+ (GWKMap*)mapWithJSON:(id)container;

+ (void)mapWithMapId:(NSString*)mapId callback:(GWKRequestCallback)block;

+ (void)mapWithMapId:(NSString *)mapId withLanguage:(NSString*)lang callback:(GWKRequestCallback)block;

@end
