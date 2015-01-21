//
//  GWKSkins.h
//  GW2Kit
//
//  Created by Romain Talleu on 14/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GWKRequest.h"

@interface GWKSkins : NSObject

@property (nonatomic, readwrite) NSArray* skins;

- (id)init;

+ (GWKSkins*)skinsWithJSON:(id)container;

+ (void)allSkinsWithcallback:(GWKRequestCallback)block;

@end
