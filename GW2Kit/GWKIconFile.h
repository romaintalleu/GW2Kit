//
//  GWKIconFile.h
//  GW2Kit
//
//  Created by Romain Talleu on 12/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GWKIconFile <NSObject>

@required
@property (nonatomic, readwrite) NSInteger iconFileId;
@property (nonatomic, readwrite) NSString* iconFileSignature;

@end
