//
//  GWKSkins.m
//  GW2Kit
//
//  Created by Romain Talleu on 14/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import "GWKSkins.h"
#import "GWKConstants.h"

@implementation GWKSkins

- (id)init
{
    self = [super init];
    if (self) {
        _skins = [NSArray array];
    }
    return self;
}

+ (GWKSkins*)skinsWithJSON:(id)container
{
    GWKSkins* skins = [[GWKSkins alloc] init];
    if (container == nil) return skins;
    
    skins.skins = [container objectForKey:@"skins"];
    return skins;
}

+ (void)allSkinsWithcallback:(GWKRequestCallback)block
{
    [GWKRequest requestItemAtURI:@"skins" withLanguage:(NSString *)GWKLanguageEnglish callback:block];
}

@end
