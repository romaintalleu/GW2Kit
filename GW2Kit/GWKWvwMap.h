//
//  GWKWvwMap.h
//  GW2Kit
//
//  Created by Romain Talleu on 12/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GWKWvwMap : NSObject

@property (nonatomic, readwrite) NSString* type;
@property (nonatomic, readwrite) NSArray* scores;
@property (nonatomic, readwrite) NSArray* objectives;
@property (nonatomic, readwrite) NSArray* bonuses;
@property (nonatomic, readwrite) NSDictionary* structuresDetails;

- (id)init;

+ (GWKWvwMap*)wvwMapWithJSON:(id)container;

- (NSDictionary*)structuresDetails;

@end
