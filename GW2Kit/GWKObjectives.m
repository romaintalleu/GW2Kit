//
//  GWKObjectives.m
//  GW2Kit
//
//  Created by Romain Talleu on 15/12/2014.
//  Copyright (c) 2014 Bolt Studio. All rights reserved.
//

#import "GWKObjectives.h"
#import "GWKConstants.h"

@implementation GWKObjectives

- (id)init
{
    self = [super init];
    if (self) {
        _objectives = [NSArray array];
    }
    return self;
}

+ (GWKObjectives*)objectivesWithJSON:(id)container
{
    GWKObjectives* objectives = [[GWKObjectives alloc] init];
    if (container == nil) return objectives;
    objectives.objectives = container;
    
    return objectives;
}

+ (void)allObjectivesWithLanguage:(NSString*)lang withcallback:(GWKRequestCallback)block
{
    [GWKRequest requestItemAtURI:@"objectives" withLanguage:lang callback:block];
}

+ (void)allObjectivesWithcallback:(GWKRequestCallback)block
{
    [self allObjectivesWithLanguage:(NSString *)GWKLanguageEnglish withcallback:block];
}

- (NSString*)structureType:(NSString*)structureId
{
    if ([structureId integerValue] > 61) {
        return @"Ruine";
    }
    for (int i = 0; i < [_objectives count]; i++) {
        NSDictionary* element = [_objectives objectAtIndex:i];
        if ([[element objectForKey:@"id"] integerValue] == [structureId integerValue]) {
            NSString*name = [element objectForKey:@"name"];
            if ([name isEqualToString:@"Tower"] == false && [name isEqualToString:@"Keep"] == false && [name isEqualToString:@"Castle"] == false) {
                name = @"Camp";
            }
            return name;
        }
    }
    return @"None";
}

@end
