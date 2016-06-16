//
//  Fraction.h
//  ObjC
//
//  Created by Dwayne Park on 2016. 6. 13..
//  Copyright © 2016년 Dwayne Park. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fraction : NSObject

@property int numertor, denominator;

- (void) print;
- (void) setTo:(int)n over:(int)d;
- (Fraction *) add:(Fraction *)f;
- (Fraction *) substract:(Fraction *)f;
- (Fraction *) multiply:(Fraction *)f;
- (Fraction *) divide:(Fraction *)f;
- (void) reduce;
- (double) convertToNum;
- (NSString *) convertToString;

@end
