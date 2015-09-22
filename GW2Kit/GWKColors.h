//
//  GWKItems.h
//  GW2Kit
//
//  Created by Romain Talleu on 14/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GWKRequest.h"

@interface GWKColors : NSObject

@property (nonatomic, readwrite) NSArray* colors;

- (id)init;

+ (GWKColors*)colorsWithJSON:(id)container;

+ (void)allColorsWithcallback:(GWKRequestCallback)block;

@end
