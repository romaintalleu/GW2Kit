//
//  GWKEvent.m
//  GW2Kit
//
//  Created by Romain Talleu on 13/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import "GWKEvent.h"
#import "GWKConstants.h"

@implementation GWKEvent

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

+ (GWKEvent*)eventWithJSON:(id)container
{
    GWKEvent* event = [[GWKEvent alloc] init];
    if (container == nil) return event;
    
    NSDictionary* events = [container objectForKey:@"events"];
    event.objectId = [[events allKeys] objectAtIndex:0];
    
    NSDictionary* results = [events objectForKey:event.objectId];
    event.name = [results objectForKey:@"name"];
    event.level = [[results objectForKey:@"level"] integerValue];
    event.mapId = [[results objectForKey:@"map_id"] integerValue];
    event.flags = [results objectForKey:@"flags"];
    event.location = [results objectForKey:@"location"];
    
    return event;
}

+ (void)eventWithEventId:(NSString*)eventId callback:(GWKRequestCallback)block
{
    [self eventWithEventId:eventId withLanguage:(NSString *)GWKLanguageEnglish callback:block];
}

+ (void)eventWithEventId:(NSString *)eventId withLanguage:(NSString*)lang callback:(GWKRequestCallback)block
{
    [GWKRequest requestItemAtURI:[NSString stringWithFormat:@"event:%@", eventId] withLanguage:lang callback:block];
}


@end
