//
//  GWKItem.m
//  GW2Kit
//
//  Created by Romain TALLEU on 09/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import "GWKItem.h"
#import "GWKConstants.h"

@implementation GWKItem

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
        objectType = @"item";
        objectId = @"";
        _name = @"";
        _descriptionItem = @"";
        _type = @"";
        _level = 0;
        _rarity = @"";
        _vendorValue = 0;
        iconFileId = 0;
        iconFileSignature = @"";
        _defaultSkin = 0;
        _gameTypes = [NSArray array];
        _flags = [NSArray array];
        _restrictions = [NSArray array];
        _properties = [NSDictionary dictionary];
    }
    return self;
}

+ (GWKItem*)itemWithJSON:(id)container
{
    GWKItem* item = [[GWKItem alloc] init];
    if (container == nil) return item;
    
    NSDictionary* results = container;
    item.objectId = [results objectForKey:@"item_id"];
    item.name = [results objectForKey:@"name"];
    item.descriptionItem = [results objectForKey:@"description"];
    item.type = [NSString stringWithFormat:@"GWKItemType%@", [results objectForKey:@"type"]];
    item.level = [[results objectForKey:@"level"] integerValue];
    item.rarity = [NSString stringWithFormat:@"GWKItemRarity%@", [results objectForKey:@"rarity"]];
    item.vendorValue = [[results objectForKey:@"vendor_value"] integerValue];
    item.iconFileId = [[results objectForKey:@"icon_file_id"] integerValue];
    item.iconFileSignature = [results objectForKey:@"icon_file_signature"];
    item.defaultSkin = [[results objectForKey:@"default_skin"] integerValue];
    
    NSArray *gameTypeTmp = [results objectForKey:@"game_types"];
    NSMutableArray* gameType = [NSMutableArray array];
    for (int i = 0; i < [gameTypeTmp count]; i++) {
        [gameType addObject:[NSString stringWithFormat:@"GWKItemGameType%@", [gameTypeTmp objectAtIndex:i]]];
    }
    item.gameTypes = [gameType copy];
    
    NSArray *flagTmp = [results objectForKey:@"flags"];
    NSMutableArray* flags = [NSMutableArray array];
    for (int i = 0; i < [flagTmp count]; i++) {
        [flags addObject:[NSString stringWithFormat:@"GWKItemFlag%@", [flagTmp objectAtIndex:i]]];
    }
    item.flags = [flags copy];
    
    NSArray *restrictionsTmp = [results objectForKey:@"restrictions"];
    NSMutableArray* restrictions = [NSMutableArray array];
    for (int i = 0; i < [restrictionsTmp count]; i++) {
        [restrictions addObject:[NSString stringWithFormat:@"GWKRestriction%@", [restrictionsTmp objectAtIndex:i]]];
    }
    item.restrictions = [restrictions copy];
    
    item.properties = [results objectForKey:[[results objectForKey:@"type"] lowercaseString]];
    return item;
}

+ (void)itemWithItemId:(NSString*)itemId callback:(GWKRequestCallback)block
{
    [self itemWithItemId:itemId withLanguage:(NSString *)GWKLanguageEnglish callback:block];
}

+ (void)itemWithItemId:(NSString *)itemId withLanguage:(NSString*)lang callback:(GWKRequestCallback)block
{
    [GWKRequest requestItemAtURI:[NSString stringWithFormat:@"item:%@", itemId] withLanguage:lang callback:block];
}

@end
