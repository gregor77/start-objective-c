//
//  Fraction.m
//  ObjC
//
//  Created by Dwayne Park on 2016. 6. 13..
//  Copyright © 2016년 Dwayne Park. All rights reserved.
//

#import "Fraction.h"

@implementation Fraction

@synthesize numertor, denominator;

- (void) setTo:(int)n over:(int)d
{
    numertor = n;
    denominator = d;
}

- (void) print
{
    NSLog(@"%i/%i", numertor, denominator);
}

- (double) convertToNum
{
    if (denominator != 0)
        return (double) numertor / denominator;
    else
        return NAN;
}

- (NSString *) convertToString
{
    if (numertor == denominator)
        if (numertor == 0)
            return @"0";
        else
            return @"1";
    else if (denominator == 1)
        return [NSString stringWithFormat: @"%i", numertor];
    else
        return [NSString stringWithFormat: @"%i/%i", numertor, denominator];
}

- (Fraction *) add:(Fraction *)f
{
    // a/b + c/d = ((a*d) + (b*c)) / (b*d)
    Fraction *result = [[Fraction alloc] init];
    
    result.numertor = numertor * f.denominator + denominator * f.numertor;
    result.denominator = denominator * f.denominator;
    
    [result reduce];
    return result;
}


- (Fraction *) substract:(Fraction *)f
{
    // a/b - c/d = ((a*d) - (b*c))/(b*d)
    Fraction *result = [[Fraction alloc] init];
    
    result.numertor = numertor * f.denominator - denominator * f.numertor;
    result.denominator = denominator * f.denominator;
    
    [result reduce];
    return result;
}

- (Fraction *) multiply:(Fraction *)f
{
    Fraction *result = [[Fraction alloc] init];
    
    result.numertor = numertor * f.numertor;
    result.denominator = denominator * f.denominator;
    
    [result reduce];
    return result;
}

- (Fraction *) divide:(Fraction *)f
{
    Fraction *result = [[Fraction alloc] init];
    
    result.numertor = numertor * f.denominator;
    result.denominator = denominator * f.numertor;
    
    [result reduce];
    return result;
}

- (void)reduce
{
    int u = numertor;
    int v = denominator;
    int temp;
    
    if (u == 0)
        return;
    else if (u < 0)
        u = -u;
    
    while (v != 0)
    {
        temp = u % v;
        u = v;
        v = temp;
    }
    
    numertor /= u;
    denominator /= u;
}
@end
