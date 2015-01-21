//
//  GWKSkin.h
//  GW2Kit
//
//  Created by Romain Talleu on 12/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GWKIconFile.h"
#import "GWKPartialSkin.h"
#import "GWKRequest.h"

static const NSString* GWKSkinTypeArmor = @"GWKSkinTypeArmor";
static const NSString* GWKSkinTypeBack = @"GWKSkinTypeBack";
static const NSString* GWKSkinTypeWeapon = @"GWKSkinTypeWeapon";

static const NSString* GWKSkinFlagShowInWardrode = @"GWKSkinFlagShowInWardrode";
static const NSString* GWKSkinFlagNoCost = @"GWKSkinFlagNoCost";
static const NSString* GWKSkinFlagHideIfLocked = @"GWKSkinFlagHideIfLocked";

@interface GWKSkin : GWKPartialSkin <GWKIconFile>

@property (nonatomic, readwrite) NSString* name;
@property (nonatomic, readwrite) NSString* type;
@property (nonatomic, readwrite) NSArray* flags;
@property (nonatomic, readwrite) NSArray* restrictions;
@property (nonatomic, readwrite) NSDictionary* properties;

- (id)init;

+ (Boolean)avaibleSkinId:(NSString*)skinId;

+ (GWKSkin*)skinWithJSON:(id)container;

+ (void)skinWithSkinId:(NSString*)skinId callback:(GWKRequestCallback)block;

+ (void)skinWithSkinId:(NSString*)skinId withLanguage:(NSString*)lang callback:(GWKRequestCallback)block;

@end
