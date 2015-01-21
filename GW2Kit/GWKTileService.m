//
//  GWKTileService.m
//  GW2Kit
//
//  Created by Romain Talleu on 12/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import "GWKTileService.h"

@implementation GWKTileService

+ (UIImage*)imageFromContinentId:(NSString*)continentId atFloor:(NSString*)floor withZoom:(NSString*)zoom atX:(NSString*)x atY:(NSString*)y
{
    return [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString  stringWithFormat:@"https://tiles.guildwars2.com/%@/%@/%@/%@/%@.jpg", continentId, floor, zoom, x, y]]]];
}

@end
