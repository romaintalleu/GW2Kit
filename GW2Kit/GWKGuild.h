//
//  GWKGuild.h
//  GW2Kit
//
//  Created by Romain Talleu on 13/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GWKPartialGuild.h"
#import "GWKRequest.h"

@interface GWKGuild : GWKPartialGuild

@property (nonatomic, readwrite) NSString* tag;

//Emblem
@property (nonatomic, readwrite) NSInteger backgroundId;
@property (nonatomic, readwrite) NSInteger foregroundId;
@property (nonatomic, readwrite) NSArray* flags;
@property (nonatomic, readwrite) NSInteger backgroundColorId;
@property (nonatomic, readwrite) NSInteger foregroundPrimaryColorId;
@property (nonatomic, readwrite) NSInteger foregroundSecondayColorId;

- (id)init;

+ (GWKGuild*)guildWithJSON:(id)container;

+ (void)guildWithGuildId:(NSString*)guildId callback:(GWKRequestCallback)block;

@end
