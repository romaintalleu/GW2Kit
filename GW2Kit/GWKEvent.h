//
//  GWKEvent.h
//  GW2Kit
//
//  Created by Romain Talleu on 13/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GWKPartialEvent.h"
#import "GWKRequest.h"

@interface GWKEvent : GWKPartialEvent

@property (nonatomic, readwrite) NSString* name;
@property (nonatomic, readwrite) NSInteger level;
@property (nonatomic, readwrite) NSInteger mapId;
@property (nonatomic, readwrite) NSArray* flags;
@property (nonatomic, readwrite) NSDictionary* location;

- (id)init;

+ (GWKEvent*)eventWithJSON:(id)container;

+ (void)eventWithEventId:(NSString*)eventId callback:(GWKRequestCallback)block;

+ (void)eventWithEventId:(NSString *)eventId withLanguage:(NSString*)lang callback:(GWKRequestCallback)block;

@end
