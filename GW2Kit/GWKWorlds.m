//
//  GWKWorlds.m
//  GW2Kit
//
//  Created by Romain Talleu on 15/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import "GWKWorlds.h"
#import "GWKConstants.h"

@implementation GWKWorlds

- (id)init
{
    self = [super init];
    if (self) {
        _worlds = [NSArray array];
    }
    return self;
}

+ (GWKWorlds*)worldsWithJSON:(id)container
{
    GWKWorlds* worlds = [[GWKWorlds alloc] init];
    if (container == nil) return worlds;
    
    worlds.worlds = container;
    return worlds;
}

+ (void)allWorldsWithcallback:(GWKRequestCallback)block
{
    [self allWorldsWithLanguage:(NSString *)GWKLanguageEnglish withcallback:block];
}

+ (void)allWorldsWithLanguage:(NSString*)lang withcallback:(GWKRequestCallback)block
{
    [GWKRequest requestItemAtURI:@"worlds" withLanguage:lang callback:block];
}

@end
