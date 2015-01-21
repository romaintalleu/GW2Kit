//
//  GWKWorlds.h
//  GW2Kit
//
//  Created by Romain Talleu on 15/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GWKRequest.h"

@interface GWKWorlds : NSObject

@property (nonatomic, readwrite) NSArray* worlds;

- (id)init;

+ (GWKWorlds*)worldsWithJSON:(id)container;

+ (void)allWorldsWithcallback:(GWKRequestCallback)block;

+ (void)allWorldsWithLanguage:(NSString*)lang withcallback:(GWKRequestCallback)block;

@end
