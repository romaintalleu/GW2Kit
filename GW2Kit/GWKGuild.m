//
//  GWKGuild.m
//  GW2Kit
//
//  Created by Romain Talleu on 13/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import "GWKGuild.h"

@implementation GWKGuild

@synthesize objectType;
@synthesize objectId;
@synthesize guildName;

- (id)init
{
    self = [super init];
    if (self) {
        objectType = @"guild";
        objectId = @"";
        guildName = @"";
        _tag = @"";
        _backgroundId = 0;
        _foregroundId = 0;
        _flags = [NSArray array];
        _backgroundColorId = 0;
        _foregroundPrimaryColorId = 0;
        _foregroundSecondayColorId = 0;
    }
    return self;
}

+ (GWKGuild*)guildWithJSON:(id)container
{
    GWKGuild* guild = [[GWKGuild alloc] init];
    if (container == nil) return guild;
    
    NSDictionary* results = container;
    guild.objectId = [results objectForKey:@"guild_id"];
    guild.guildName = [results objectForKey:@"guild_name"];
    guild.tag = [results objectForKey:@"tag"];
    
    NSDictionary* emblem = [results objectForKey:@"emblem"];
    guild.backgroundId = [[emblem objectForKey:@"background_id"] integerValue];
    guild.foregroundId = [[emblem objectForKey:@"foreground_id"] integerValue];
    guild.flags = [emblem objectForKey:@"flags"];
    guild.backgroundColorId = [[emblem objectForKey:@"background_color_id"] integerValue];
    guild.foregroundPrimaryColorId = [[emblem objectForKey:@"foreground_primary_color_id"] integerValue];
    guild.foregroundSecondayColorId = [[emblem objectForKey:@"foreground_secondary_color_id"] integerValue];
    return guild;
}

+ (void)guildWithGuildId:(NSString*)guildId callback:(GWKRequestCallback)block
{
    [GWKRequest requestItemAtURI:[NSString stringWithFormat:@"guild:%@", guildId] callback:block];
}

@end
