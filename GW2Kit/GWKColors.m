//
//  GWKItems.m
//  GW2Kit
//
//  Created by Romain Talleu on 14/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import "GWKColors.h"
#import "GWKColor.h"

@implementation GWKColors

- (id)init
{
	self = [super init];
	if (self) {
		_colors = [NSArray array];
	}
	return self;
}

+ (GWKColors*)colorsWithJSON:(id)container
{
	GWKColors* colors = [[GWKColors alloc] init];
	if (container == nil) return colors;
	
	container = [container objectForKey:@"colors"];
	NSMutableArray *colors_tmp = [NSMutableArray array];
	
	for (id key in container) {
		GWKColor* color = [GWKColor colorWithJSON:[container objectForKey:key]];
		[colors_tmp addObject:color];
	}
	
	colors.colors = [NSArray arrayWithArray:colors_tmp];
	return colors;
}

+ (void)allColorsWithcallback:(GWKRequestCallback)block
{
	[GWKRequest requestItemAtURI:@"colors" callback:block];
}

@end
