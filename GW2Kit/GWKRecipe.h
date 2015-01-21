//
//  GWKRecipe.h
//  GW2Kit
//
//  Created by Romain TALLEU on 08/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GWKPartialRecipe.h"
#import "GWKRequestCallback.h"

//GWKRecipeDiscpline
static const NSString* GWKRecipeDisciplineArtificer = @"GWKDisciplineArtificer";
static const NSString* GWKRecipeDisciplineArmorsmith = @"GWKDisciplineArmorsmith";
static const NSString* GWKRecipeDisciplineChef = @"GWKDisciplineChef";
static const NSString* GWKRecipeDisciplineHuntsman = @"GWKDisciplineHuntsman";
static const NSString* GWKRecipeDisciplineJeweler = @"GWKDisciplineJeweler";
static const NSString* GWKRecipeDisciplineLeatherworker = @"GWKDisciplineLeatherworker";
static const NSString* GWKRecipeDisciplineTailor = @"GWKDisciplineTailor";
static const NSString* GWKRecipeDisciplineWeaponsmith = @"GWKDisciplineWeaponsmith";

//GWKRecipeType
static const NSString* GWKRecipeTypeAmulet = @"GWKRecipeTypeAmulet";
static const NSString* GWKRecipeTypeAxe = @"GWKRecipeTypeAxe";
static const NSString* GWKRecipeTypeBackpack = @"GWKRecipeTypeBackpack";
static const NSString* GWKRecipeTypeBag = @"GWKRecipeTypeBag";
static const NSString* GWKRecipeTypeBoots = @"GWKRecipeTypeBoots";
static const NSString* GWKRecipeTypeBulk = @"GWKRecipeTypeBulk";
static const NSString* GWKRecipeTypeCoat = @"GWKRecipeTypeCoat";
static const NSString* GWKRecipeTypeComponent = @"GWKRecipeTypeComponent";
static const NSString* GWKRecipeTypeConsumable = @"GWKRecipeTypeConsumable";
static const NSString* GWKRecipeTypeDagger = @"GWKRecipeTypeDagger";
static const NSString* GWKRecipeTypeDessert = @"GWKRecipeTypeDessert";
static const NSString* GWKRecipeTypeDye = @"GWKRecipeTypeDye";
static const NSString* GWKRecipeTypeEarring = @"GWKRecipeTypeEarring";
static const NSString* GWKRecipeTypeFeast = @"GWKRecipeTypeFeast";
static const NSString* GWKRecipeTypeFocus = @"GWKRecipeTypeFocus";
static const NSString* GWKRecipeTypeGloves = @"GWKRecipeTypeGloves";
static const NSString* GWKRecipeTypeGreatsword = @"GWKRecipeTypeGreatsword";
static const NSString* GWKRecipeTypeHammer = @"GWKRecipeTypeHammer";
static const NSString* GWKRecipeTypeHarpoon = @"GWKRecipeTypeHarpoon";
static const NSString* GWKRecipeTypeHelm = @"GWKRecipeTypeHelm";
static const NSString* GWKRecipeTypeIngredientCooking = @"GWKRecipeTypeIngredientCooking";
static const NSString* GWKRecipeTypeInscription = @"GWKRecipeTypeInscription";
static const NSString* GWKRecipeTypeInsignia = @"GWKRecipeTypeInsignia";
static const NSString* GWKRecipeTypeLeggings = @"GWKRecipeTypeLeggins";
static const NSString* GWKRecipeTypeLongBow = @"GWKRecipeTypeLongBow";
static const NSString* GWKRecipeTypeMace = @"GWKRecipeTypeMace";
static const NSString* GWKRecipeTypeMeal = @"GWKRecipeTypeMeal";
static const NSString* GWKRecipeTypePistol = @"GWKRecipeTypePistol";
static const NSString* GWKRecipeTypePotion = @"GWKRecipeTypePotion";
static const NSString* GWKRecipeTypeRefinement = @"GWKRecipeTypeRefinement";
static const NSString* GWKRecipeTypeRefinementEctoplasm = @"GWKRecipeTypeEctoplasm";
static const NSString* GWKRecipeTypeRefinementObsidian = @"GWKRecipeTypeObsidian";
static const NSString* GWKRecipeTypeRifle = @"GWKRecipeTypeRifle";
static const NSString* GWKRecipeTypeRing = @"GWKRecipeTypeRing";
static const NSString* GWKRecipeTypeScepter = @"GWKRecipeTypeScepter";
static const NSString* GWKRecipeTypeSeasoning = @"GWKRecipeTypeSeasoning";
static const NSString* GWKRecipeTypeShield = @"GWKRecipeTypeShield";
static const NSString* GWKRecipeTypeShortBow = @"GWKRecipeTypeShortBow";
static const NSString* GWKRecipeTypeShoulders = @"GWKRecipeTypeShoulders";
static const NSString* GWKRecipeTypeSnack = @"GWKRecipeTypeSnack";
static const NSString* GWKRecipeTypeSoup = @"GWKRecipeTypeSoup";
static const NSString* GWKRecipeTypeSpeargun = @"GWKRecipeTypeSpeargun";
static const NSString* GWKRecipeTypeStaff = @"GWKRecipeTypeStaff";
static const NSString* GWKRecipeTypeSword = @"GWKRecipeTypeSword";
static const NSString* GWKRecipeTypeTorch = @"GWKRecipeTypeTorch";
static const NSString* GWKRecipeTypeTrident = @"GWKRecipeTypeTrident";
static const NSString* GWKRecipeTypeUpgradeComponent = @"GWKRecipeTypeUpgradeComponent";
static const NSString* GWKRecipeTypeWarhorn = @"GWKRecipeTypeWarhorn";

//GWKRecipeFlag
static const NSString* GWKRecipeFlagAutoLearned = @"GWKRecipeFlagAutoLearned";
static const NSString* GWKRecipeFlagLearnedFromItem = @"GWKRecipeFlagLearnedFromItem";

@interface GWKRecipe : GWKPartialRecipe

@property (nonatomic, readwrite) NSString* type;
@property (nonatomic, readwrite) NSInteger outputItemId;
@property (nonatomic, readwrite) NSInteger outputItemCount;
@property (nonatomic, readwrite) NSString* minRating;
@property (nonatomic, readwrite) NSInteger timeToCraftMs;
@property (nonatomic, readwrite) NSInteger vendorValue;
@property (nonatomic, readwrite) NSArray* disciplines;
@property (nonatomic, readwrite) NSArray* flags;
@property (nonatomic, readwrite) NSArray* ingredients;

- (id)init;

+ (GWKRecipe*)recipeWithJSON:(id)container;

+ (void)recipeWithRecipeId:(NSString*)recipeId callback:(GWKRequestCallback)block;

+ (void)recipeWithRecipeId:(NSString*)recipeId withLanguage:(NSString*)lang callback:(GWKRequestCallback)block;

@end
