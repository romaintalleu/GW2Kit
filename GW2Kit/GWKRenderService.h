//
//  GWKRenderService.h
//  GW2Kit
//
//  Created by Romain Talleu on 12/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

static const NSString* GWKRenderServiceFormatPNG = @"png";
static const NSString* GWKRenderServiceFormatJPG = @"jpg";

@interface GWKRenderService : NSObject

+ (UIImage*) imageFromSignature:(NSString*)signature fileId:(NSString*)fileId withFormat:(const NSString*)format;

@end
