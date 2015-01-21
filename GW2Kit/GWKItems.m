//
//  GWKItems.m
//  GW2Kit
//
//  Created by Romain Talleu on 14/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import "GWKItems.h"

@implementation GWKItems

- (id)init
{
    self = [super init];
    if (self) {
        _items = [NSArray array];
    }
    return self;
}

+ (GWKItems*)itemsWithJSON:(id)container
{
    GWKItems* items = [[GWKItems alloc] init];
    if (container == nil) return items;
    
    items.items = [container objectForKey:@"items"];
    return items;
}

+ (void)allItemsWithcallback:(GWKRequestCallback)block
{
    [GWKRequest requestItemAtURI:@"items" callback:block];
}

@end
