//
// Created by Aleksandra Borovytskaya on 1/15/15.
// Copyright (c) 2015 Aleksandra Borovytskaya. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, SpaceUinitType) {TypeExperimental, TypeRealTime, TypeModified};


@interface SpaceUnit : NSObject

    @property NSString *id;
    @property NSString *name;
    @property NSString *specificationId;
    @property NSNumber *groupNumber;
    @property NSString *modelSpecifier;
    @property SpaceUinitType type;
    @property NSUInteger year;



- (instancetype)initWithUniqueID:(NSString *)AnyString;



@end