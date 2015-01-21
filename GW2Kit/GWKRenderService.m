//
//  GWKRenderService.m
//  GW2Kit
//
//  Created by Romain Talleu on 12/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import "GWKRenderService.h"

@implementation GWKRenderService

+ (UIImage*) imageFromSignature:(NSString*)signature fileId:(NSString*)fileId withFormat:(const NSString*)format
{
    if ([format isEqualToString:(NSString*)GWKRenderServiceFormatJPG] || [format isEqualToString:(NSString*) GWKRenderServiceFormatPNG])
        return [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://render.guildwars2.com/file/%@/%@.%@", signature, fileId, format]]]];
    return nil;
}

@end
