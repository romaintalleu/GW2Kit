//
//  GWKSkin.m
//  GW2Kit
//
//  Created by Romain Talleu on 12/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import "GWKSkin.h"

#import "GWKConstants.h"
#import "GWKSkins.h"

@implementation GWKSkin

//GWKPartialObject Protocol
@synthesize objectType;
@synthesize objectId;

//GWKIconFile Protocol
@synthesize iconFileId;
@synthesize iconFileSignature;

- (id)init
{
    self = [super init];
    if (self) {
        objectType = @"skin";
        objectId = @"";
        _name = @"";
        _type = @"";
        _flags = [NSArray array];
        _restrictions = [NSArray array];
        iconFileId = 0;
        iconFileSignature = @"";
        _properties = [NSDictionary dictionary];
    }
    return self;
}

+ (Boolean)avaibleSkinId:(NSString*)skinId
{
    __block Boolean flag = false;
    
    [GWKSkins allSkinsWithcallback:^(NSError *error, GWKSkins* object) {
        flag = [object.skins containsObject:skinId];
    }];
#warning TODO
    return flag;
}

+ (GWKSkin*)skinWithJSON:(id)container
{
    GWKSkin* skin = [[GWKSkin alloc] init];
    if (container == nil) return skin;
    
    NSDictionary* results = container;
    skin.objectId = [results objectForKey:@"skin_id"];
    skin.name = [results objectForKey:@"name"];
    skin.type = [NSString stringWithFormat:@"GWKSkinType%@", [results objectForKey:@"type"]];
    
    NSArray *flagsTmp = [results objectForKey:@"disciplines"];
    NSMutableArray* flags = [NSMutableArray array];
    for (int i = 0; i < [flagsTmp count]; i++) {
        [flags addObject:[NSString stringWithFormat:@"GWKSkinFlags%@", [flagsTmp objectAtIndex:i]]];
    }
    skin.flags = [flags copy];
    
    NSArray *restrictionsTmp = [results objectForKey:@"restrictions"];
    NSMutableArray* restrictions = [NSMutableArray array];
    for (int i = 0; i < [restrictionsTmp count]; i++) {
        [restrictions addObject:[NSString stringWithFormat:@"GWKRestriction%@", [restrictionsTmp objectAtIndex:i]]];
    }
    skin.restrictions = [restrictions copy];
    
    skin.iconFileId = [[results objectForKey:@"icon_file_id"] integerValue];
    skin.iconFileSignature = [results objectForKey:@"icon_file_signature"];
    skin.properties = [results objectForKey:[[results objectForKey:@"type"] lowercaseString]];
    
    return skin;
}

+ (void)skinWithSkinId:(NSString*)skinId callback:(GWKRequestCallback)block
{
    [self skinWithSkinId:skinId withLanguage:(NSString*)GWKLanguageEnglish callback:block];
}

+ (void)skinWithSkinId:(NSString*)skinId withLanguage:(NSString*)lang callback:(GWKRequestCallback)block
{
    [GWKRequest requestItemAtURI:[NSString stringWithFormat:@"item:%@", skinId] withLanguage:lang callback:block];
}

@end
