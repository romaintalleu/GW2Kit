//
//  GWKItems.h
//  GW2Kit
//
//  Created by Romain Talleu on 14/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GWKRequest.h"

@interface GWKItems : NSObject

@property (nonatomic, readwrite) NSArray* items;

- (id)init;

+ (GWKItems*)itemsWithJSON:(id)container;

+ (void)allItemsWithcallback:(GWKRequestCallback)block;

@end
