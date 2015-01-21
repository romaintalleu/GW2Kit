//
//  GWKPartialGuild.h
//  GW2Kit
//
//  Created by Romain Talleu on 13/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GWKPartialObject.h"

@interface GWKPartialGuild : NSObject <GWKPartialObject>

@property (nonatomic, readwrite) NSString* guildName;

- (id)init;

@end
