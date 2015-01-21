# GW2Kit

GW2Kit is an Objective-C framework for iOS that wraps the Guild Wars 2 API.

- [Guild Wars 2 API documentation](http://wiki.guildwars2.com/wiki/API:Main)
- [Guild Wars 2 API changelog](http://wiki.guildwars2.com/wiki/API:Changelog)

## Requirements
- **iOS**: 6.0+
- **ARC**: Yes

## Installation

1. Compile the framework from the [latest release](https://github.com/romaintalleu/GW2Kit)
2. Drag `GW2Kit.framework` into your project
3. Import the GW2 header `#import <GW2Kit/GW2Kit.h>`

## How does it work?
### Item Example 
```objc
//Find item by id
[GWKItem itemWithItemId:@"28445" callback:^(NSError *error, GWKItem* object) {
	NSLog(@"Name : %@", object.name);
    NSLog(@"Type : %@", object.type);
    NSLog(@"Level : %ld", object.level);
 }];
```
```
Name : Strong Soft Wood Longbow of Fire
Type : GWKItemTypeWeapon
Level : 44
```
### Wvw Match Example
```objc
//Fin match id by a server id, 2103 is Augury rock server
NSString* matchId = [GWKHelpers fetchMatchIdWithServerId:@"2103"];
//GWKMatch from match id
[GWKMatch matchWithMatchId:matchId callback:^(NSError *error, GWKMatch* object) {
	NSLog(@"All structure %@", [object structuresDetailsAllMap]);
    NSLog(@"Structure Red Home : %@", object.redMap.structuresDetails);
}];
```
```
 All structure {
    "blue_camp" = 7;
    "blue_castle" = 1;
    "blue_keep" = 4;
    "blue_tower" = 8;
    "green_camp" = 9;
    "green_castle" = 0;
    "green_keep" = 4;
    "green_tower" = 7;
    "red_camp" = 8;
    "red_castle" = 0;
    "red_keep" = 4;
    "red_tower" = 9;
}
Structure Red Home : {
    "blue_camp" = 1;
    "blue_castle" = 0;
    "blue_keep" = 0;
    "blue_tower" = 0;
    "green_camp" = 2;
    "green_castle" = 0;
    "green_keep" = 0;
    "green_tower" = 0;
    "red_camp" = 3;
    "red_castle" = 0;
    "red_keep" = 3;
    "red_tower" = 4;
}
```
### Use Partial Object
```objc
//Create Partial Item
GWKPartialItem *partialItem = [[GWKPartialItem alloc] init];
partialItem.objectId = @"28445";
//Item from Patial Item
[GWKRequest requestItemFromPartialObject:partialItem callback:^(NSError *error, GWKItem* object) {
	NSLog(@"Name : %@", object.name);
    NSLog(@"Type : %@", object.type);
    NSLog(@"Level : %ld", object.level);
}];
```
```
Name : Strong Soft Wood Longbow of Fire
Type : GWKItemTypeWeapon
Level : 44
```

<hr/>
### Guild Wars 2 API Terms of Use
These APIs are wholly owned by ArenaNet, LLC ("ArenaNet"). Any use of the APIs must comply with the [Website Terms of Use](https://www.guildwars2.com/en/legal/website-terms-of-use/) and [Content Terms of Use](https://www.guildwars2.com/en/legal/guild-wars-2-content-terms-of-use/), however you may use the APIs to make commercial products so long as they are otherwise compliant and do not compete with ArenaNet. ArenaNet may revoke your right
to use the APIs at any time. In addition, ArenaNet may create and/or amend any terms or conditions applicable to the APIs or their use at any time and from time to time. You understand and agree that ArenaNet is in the
process of developing a full license agreement for these APIs and ArenaNet will publish it when it is complete. Your continued use of the APIs constitutes acceptance of the full license agreement and any related terms
or conditions when they are posted.

<hr/>
#### Credits

GW2Kit is create to you by [Romain Talleu](https://github.com/romaintalleu).