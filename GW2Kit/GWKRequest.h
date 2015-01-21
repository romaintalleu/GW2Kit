//
//  GWKRequest.h
//  GW2Kit
//
//  Created by Romain TALLEU on 08/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GWKRequestCallback.h"
#import "GWKPartialObject.h"

@interface GWKRequest : NSObject

+ (void)requestItemAtURI:(NSString*)uri callback:(GWKRequestCallback)block;

+ (void)requestItemAtURI:(NSString*)uri withLanguage:(NSString*)lang callback:(GWKRequestCallback)block;

+ (void)requestItemFromPartialObject:(id)partialObject callback:(GWKRequestCallback)block;

+ (void)requestItemFromPartialObject:(id)partialObject withLanguage:(NSString*)lang callback:(GWKRequestCallback)block;

@end
