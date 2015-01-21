//
//  GWKTileService.h
//  GW2Kit
//
//  Created by Romain Talleu on 12/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GWKTileService : NSObject

+ (UIImage*)imageFromContinentId:(NSString*)continentId atFloor:(NSString*)floor withZoom:(NSString*)zoom atX:(NSString*)x atY:(NSString*)y;

@end
