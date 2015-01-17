//
//  SpaceUnitTest.m
//  Strings
//
//  Created by Aleksandra Borovytskaya on 1/15/15.
//  Copyright (c) 2015 Aleksandra Borovytskaya. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "SpaceUnit.h"

@interface SpaceUnitTest : XCTestCase

@end

@implementation SpaceUnitTest

- (void)testParseCorrectData {

    NSString *string = @"quest.i502/17@M-22(X)2012#18297236";
    SpaceUnit *unit = [[SpaceUnit alloc] initWithUniqueID: string];

    XCTAssertNotNil(unit, "Correct data %@ should be successfully parsed", string);

    XCTAssertTrue([@"18297236" isEqualToString: unit.id]);
    XCTAssertTrue(unit.year == 2012);
    XCTAssertTrue(unit.type==TypeExperimental);
    XCTAssertTrue([@"M-22" isEqualToString:unit.modelSpecifier]);
    XCTAssertTrue([@(17) isEqualToNumber:unit.groupNumber]);
    XCTAssertTrue([@"i502" isEqualToString:unit.specificationId]);
    XCTAssertTrue([@"quest" isEqualToString:unit.name]);


    string = @"liga.b22/1024@L-01(Rt)2016#18297235";
    unit = [[SpaceUnit alloc] initWithUniqueID: string];

    XCTAssertNotNil(unit, "Correct data %@ should be successfully parsed", string);

    XCTAssertTrue([@"18297235" isEqualToString: unit.id]);
    XCTAssertTrue(unit.year == 2016);
    XCTAssertTrue(unit.type==TypeRealTime);
    XCTAssertTrue([@"L-01" isEqualToString:unit.modelSpecifier]);
    XCTAssertTrue([@(1024) isEqualToNumber:unit.groupNumber]);
    XCTAssertTrue([@"b22" isEqualToString:unit.specificationId]);
    XCTAssertTrue([@"liga" isEqualToString:unit.name]);


    string = @"east.i504/2@ML-26(X)2014#18297232";
    unit = [[SpaceUnit alloc] initWithUniqueID: string];

    XCTAssertNotNil(unit, "Correct data %@ should be successfully parsed", string);

    XCTAssertTrue([@"18297232" isEqualToString: unit.id]);
    XCTAssertTrue(unit.year == 2014);
    XCTAssertTrue(unit.type==TypeExperimental);
    XCTAssertTrue([@"ML-26" isEqualToString:unit.modelSpecifier]);
    XCTAssertTrue([@(2) isEqualToNumber:unit.groupNumber]);
    XCTAssertTrue([@"i504" isEqualToString:unit.specificationId]);
    XCTAssertTrue([@"east" isEqualToString:unit.name]);



    string = @"east.i504|2@ML-26(X)2014#18297232";
    unit = [[SpaceUnit alloc] initWithUniqueID: string];

    XCTAssertNotNil(unit, "Correct data %@ should be successfully parsed", string);

    XCTAssertTrue([@"18297232" isEqualToString: unit.id]);
    XCTAssertTrue(unit.year == 2014);
    XCTAssertTrue(unit.type==TypeModified);
    XCTAssertTrue([@"ML-26" isEqualToString:unit.modelSpecifier]);
    XCTAssertTrue([@(2) isEqualToNumber:unit.groupNumber]);
    XCTAssertTrue([@"i504" isEqualToString:unit.specificationId]);
    XCTAssertTrue([@"east" isEqualToString:unit.name]);

}

@end
