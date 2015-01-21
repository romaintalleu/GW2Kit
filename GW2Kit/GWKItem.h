//
//  GWKItem.h
//  GW2Kit
//
//  Created by Romain TALLEU on 09/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GWKIconFile.h"
#import "GWKPartialItem.h"
#import "GWKRequest.h"

static const NSString* GWKItemTypeArmor = @"GWKItemTypeArmor";
static const NSString* GWKItemTypeBack = @"GWKItemTypeBack";
static const NSString* GWKItemTypeBag = @"GWKItemTypeBag";
static const NSString* GWKItemTypeConsumable = @"GWKItemTypeConsumable";
static const NSString* GWKItemTypeContainer = @"GWKItemTypeContainer";
static const NSString* GWKItemTypeCraftingMaterial = @"GWKItemTypeCraftingMaterial";
static const NSString* GWKItemTypeGathering = @"GWKItemTypeGathering";
static const NSString* GWKItemTypeGizmo = @"GWKItemTypeGizmo";
static const NSString* GWKItemTypeMiniPet = @"GWKItemTypeMiniPet";
static const NSString* GWKItemTypeTool = @"GWKItemTypeTool";
static const NSString* GWKItemTypeTrait = @"GWKItemTypeTrait";
static const NSString* GWKItemTypeTrinket = @"GWKItemTypeTrinket";
static const NSString* GWKItemTypeTrophy = @"GWKItemTypeTrophy";
static const NSString* GWKItemTypeUpgradeComponent = @"GWKItemTypeComponent";
static const NSString* GWKItemTypeWeapon = @"GWKItemTypeWeapon";

static const NSString* GWKItemRarityAscended = @"GWKItemRarityAscended";
static const NSString* GWKItemRarityBasic = @"GWKItemRarityBasic";
static const NSString* GWKItemRarityExotic = @"GWKItemRarityExotic";
static const NSString* GWKItemRarityFine = @"GWKItemRarityFine";
static const NSString* GWKItemRarityJunk = @"GWKItemRarityJunk";
static const NSString* GWKItemRarityLegendary = @"GWKItemRarityLegendary";
static const NSString* GWKItemRarityMasterwork = @"GWKItemRarityMasterwork";
static const NSString* GWKItemRarityRare = @"GWKItemRarityRare";

static const NSString* GWKItemGameTypeActivity = @"GWKItemGameTypeActivity";
static const NSString* GWKItemGameTypeDungeon = @"GWKItemGameTypeGungeon";
static const NSString* GWKItemGameTypePve = @"GWKItemGameTypePve";
static const NSString* GWKItemGameTypePvp = @"GWKItemGameTypePvp";
static const NSString* GWKItemGameTypePvpLobby = @"GWKItemGameTypePvpLobby";
static const NSString* GWKItemGameTypeWvw = @"GWKItemGameTypeWvw";

static const NSString* GWKItemFlagAccountBindOnUse = @"GWKItemFlagAccountBindOnUse";
static const NSString* GWKItemFlagAccountBound = @"GWKItemFlagAccountBound";
static const NSString* GWKItemFlagHideSuffix = @"GWKItemFlagHideSuffix";
static const NSString* GWKItemFlagNoMysticForge = @"GWKItemFlagNoMysticForge";
static const NSString* GWKItemFlagNoSalvage = @"GWKItemFlagSalvage";
static const NSString* GWKItemFlagNoSell = @"GWKItemFlagNoSell";
static const NSString* GWKItemFlagNotUpgradeable = @"GWKItemFlagNotUpgradeable";
static const NSString* GWKItemFlagNoUnderwater = @"GWKItemFlagNoUnderwater";
static const NSString* GWKItemFlagSoulbindOnAcquire = @"GWKItemFlagSoulbindOnAcquire";
static const NSString* GWKItemFlagSoulBindOnUse = @"GWKItemFlagSoulBindOnUse";
static const NSString* GWKItemFlagUnique = @"GWKItemFlagUnique";

@interface GWKItem : GWKPartialItem <GWKIconFile>

@property (nonatomic, readwrite) NSString* name;
@property (nonatomic, readwrite) NSString* descriptionItem;
@property (nonatomic, readwrite) NSString* type;
@property (nonatomic, readwrite) NSInteger level;
@property (nonatomic, readwrite) NSString* rarity;
@property (nonatomic, readwrite) NSInteger vendorValue;
@property (nonatomic, readwrite) NSInteger defaultSkin;
@property (nonatomic, readwrite) NSArray* gameTypes;
@property (nonatomic, readwrite) NSArray* flags;
@property (nonatomic, readwrite) NSArray* restrictions;
@property (nonatomic, readwrite) NSDictionary* properties;

- (id)init;

+ (GWKItem*)itemWithJSON:(id)container;

+ (void)itemWithItemId:(NSString*)itemId callback:(GWKRequestCallback)block;

+ (void)itemWithItemId:(NSString *)itemId withLanguage:(NSString*)lang callback:(GWKRequestCallback)block;

@end
