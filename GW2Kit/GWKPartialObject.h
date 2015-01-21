//
//  GWKPartialObject.h
//  GW2Kit
//
//  Created by Romain TALLEU on 08/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GWKPartialObject <NSObject>

@required
@property (nonatomic, readwrite) NSString* objectType;
@property (nonatomic, readwrite) NSString* objectId;

@end
