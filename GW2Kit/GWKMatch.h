//
//  GWKMatch.h
//  GW2Kit
//
//  Created by Romain Talleu on 12/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import "GWKPartialMatch.h"
#import "GWKRequest.h"
#import "GWKWvwMap.h"

@interface GWKMatch : GWKPartialMatch

@property (nonatomic, readwrite) NSArray* scores;

@property (nonatomic, readwrite) GWKWvwMap* redMap;
@property (nonatomic, readwrite) GWKWvwMap* blueMap;
@property (nonatomic, readwrite) GWKWvwMap* greenMap;
@property (nonatomic, readwrite) GWKWvwMap* centerMap;

- (id)init;

+ (GWKMatch*)matchWithJSON:(id)container;

+ (void)matchWithMatchId:(NSString*)matchId callback:(GWKRequestCallback)block;

- (NSDictionary*)structuresDetailsAllMap;

@end
