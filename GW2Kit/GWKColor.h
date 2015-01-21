//
//  GWKColor.h
//  GW2Kit
//
//  Created by Romain Talleu on 14/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GWKPartialColor.h"
#import "GWKRequest.h"

@interface GWKColor : GWKPartialColor

@property (nonatomic, readwrite) NSString* name;
@property (nonatomic, readwrite) NSArray* baseRgb;
@property (nonatomic, readwrite) NSDictionary* cloth;
@property (nonatomic, readwrite) NSDictionary* leather;
@property (nonatomic, readwrite) NSDictionary* metal;

- (id)init;

+ (GWKColor*)colorWithJSON:(id)container;

+ (void)colorWithColorId:(NSString*)colorId callback:(GWKRequestCallback)block;

+ (void)colorWithColorId:(NSString*)colorId withLanguage:(NSString*)lang callback:(GWKRequestCallback)block;


@end
