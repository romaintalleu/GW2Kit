//
//  GWKColor.m
//  GW2Kit
//
//  Created by Romain Talleu on 14/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import "GWKColor.h"
#import "GWKConstants.h"

@implementation GWKColor

@synthesize objectType;
@synthesize objectId;

- (id)init
{
    self = [super init];
    if (self) {
        objectType = @"color";
        objectId = @"";
        _name = @"";
        _baseRgb = [NSArray array];
        _cloth = [NSDictionary dictionary];
        _leather = [NSDictionary dictionary];
        _metal = [NSDictionary dictionary];
    }
    return self;
}

+ (GWKColor*)colorWithJSON:(id)container
{
    GWKColor* color = [[GWKColor alloc] init];
    if (container == nil) return color;
    
    NSDictionary* results = container;
    color.objectId = [results objectForKey:@"color_id"];
    color.name = [results objectForKey:@"name"];
    color.baseRgb = [results objectForKey:@"base_rgb"];
    color.cloth = [results objectForKey:@"cloth"];
    color.leather = [results objectForKey:@"leather"];
    color.metal = [results objectForKey:@"metal"];
    return color;
}

+ (void)colorWithColorId:(NSString*)colorId callback:(GWKRequestCallback)block
{
    [self colorWithColorId:colorId withLanguage:(NSString*)GWKLanguageEnglish callback:block];
}

+ (void)colorWithColorId:(NSString*)colorId withLanguage:(NSString*)lang callback:(GWKRequestCallback)block
{
    [GWKRequest requestItemAtURI:[NSString stringWithFormat:@"color:%@", colorId] withLanguage:lang callback:block];
}

@end
