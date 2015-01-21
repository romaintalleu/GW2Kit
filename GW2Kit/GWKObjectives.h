//
//  GWKObjectives.h
//  GW2Kit
//
//  Created by Romain Talleu on 15/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GWKRequest.h"

@interface GWKObjectives : NSObject

@property (nonatomic, readwrite) NSArray* objectives;

- (id)init;

+ (GWKObjectives*)objectivesWithJSON:(id)container;

+ (void)allObjectivesWithcallback:(GWKRequestCallback)block;

+ (void)allObjectivesWithLanguage:(NSString*)lang withcallback:(GWKRequestCallback)block;

- (NSString*)structureType:(NSString*)structureId;

@end
