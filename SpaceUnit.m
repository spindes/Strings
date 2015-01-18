//
// Created by Aleksandra Borovytskaya on 1/15/15.
// Copyright (c) 2015 Aleksandra Borovytskaya. All rights reserved.
//

#import "SpaceUnit.h"


@implementation SpaceUnit {

}

 -(instancetype)initWithUniqueID: (NSString*)AnyString {

     self = [super init];
     if (self){
         self = [[self class] parseUniqueId:AnyString];
         if(self)
             return self;
     }
     return nil;

  }

+(SpaceUnit *)parseUniqueId:(NSString *)AnyString2 {

    // format: name.specificationId/groupNumber@modelSpecifier(type)year#id
    // quest.i502/17@M-22(X)2012#18297236

    NSUInteger noPlaceIndex;
    NSRange range;
    SpaceUnit *result = [[SpaceUnit alloc] init];


    noPlaceIndex = [AnyString2 rangeOfString:@"."].location;
    if(noPlaceIndex!=NSNotFound) {
        result.name = [AnyString2 substringToIndex:noPlaceIndex];
    }
    else return nil;

    range.location = noPlaceIndex + 1;
    noPlaceIndex = [AnyString2 rangeOfString:@"/"].location;
    if (noPlaceIndex!=NSNotFound) {
        range.length = noPlaceIndex - range.location;
        result.specificationId = [AnyString2 substringWithRange:range];
    }
    else return nil;

    range.location = noPlaceIndex + 1;
    noPlaceIndex = [AnyString2 rangeOfString:@"@"].location;
    if (noPlaceIndex!=NSNotFound && noPlaceIndex > range.location) {
        range.length = noPlaceIndex - range.location;
        result.groupNumber = [NSNumber numberWithFloat:[[AnyString2 substringWithRange:range] floatValue]];
    }
    else return nil;

    range.location = noPlaceIndex + 1;
    noPlaceIndex = [AnyString2 rangeOfString:@"("].location;
    if (noPlaceIndex!=NSNotFound) {
        range.length = noPlaceIndex - range.location;
        result.modelSpecifier = [AnyString2 substringWithRange:range];
    }
    else return nil;

    range.location = noPlaceIndex + 1;
    noPlaceIndex = [AnyString2 rangeOfString:@")"].location;
    if (noPlaceIndex!=NSNotFound) {
        range.length = noPlaceIndex - range.location;
        NSString *type = [AnyString2 substringWithRange:range];
        if ([type isEqualToString:@"X"])
          result.type = TypeExperimental;
        if ([type isEqualToString:@"Rt"])
            result.type = TypeRealTime;
        if ([type isEqualToString:@"M"])
            result.type = TypeModified;
    }
    else return nil;

    range.location = noPlaceIndex + 1;
    noPlaceIndex = [AnyString2 rangeOfString:@"#"].location;
    if (noPlaceIndex!=NSNotFound) {
        range.length = noPlaceIndex - range.location;
        result.year = (NSUInteger) [[AnyString2 substringWithRange:range] integerValue];
    }
    else return nil;

    if(noPlaceIndex!=NSNotFound) {
        result.id = [AnyString2 substringFromIndex:noPlaceIndex + 1];
    }
    else return nil;

    return result;
}

@end