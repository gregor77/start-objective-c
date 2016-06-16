//
//  ViewController.m
//  Calculator
//
//  Created by Dwayne Park on 2016. 6. 16..
//  Copyright © 2016년 Dwayne Park. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"

@interface ViewController ()

@end

@implementation ViewController
{
    char op;
    int currentNumber;
    BOOL firstOperand, isNumerator;
    Calculator *myCalculator;
    NSMutableString *displayString;
}

@synthesize display;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    firstOperand = YES;
    isNumerator = YES;
    displayString = [NSMutableString stringWithCapacity: 40];
    myCalculator = [[Calculator alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) processDigit:(int)digit
{
    currentNumber = currentNumber * 10 + digit;
    
    [displayString appendString:
     [NSString stringWithFormat: @"%i", digit]];
    display.text = displayString;
}

- (IBAction)clickDigit:(UIButton *)sender
{
    int digit = (int) sender.tag;
    [self processDigit: digit];
}

- (void) processOp:(char)theOp
{
    NSString *opStr;
    
    op = theOp;
    
    switch (theOp) {
        case '+':
            opStr = @" + ";
            break;
        case '-':
            opStr = @" - ";
            break;
        case '*':
            opStr = @" * ";
            break;
        case '/':
            opStr = @" / ";
            break;
    }
    
    [self storeFracPart];
    firstOperand = NO;
    isNumerator = YES;
    
    [displayString appendString: opStr];
    display.text = displayString;
}

- (void) storeFracPart
{
    if (firstOperand) {
        if (isNumerator) {
            myCalculator.operand1.numertor = currentNumber;
            myCalculator.operand1.denominator = 1;
        }
        else
            myCalculator.operand1.denominator = currentNumber;
    }
    else if (isNumerator) {
        myCalculator.operand2.numertor = currentNumber;
        myCalculator.operand2.denominator = 1;
    }
    else {
        myCalculator.operand2.denominator = currentNumber;
        firstOperand = YES;
    }
    
    currentNumber = 0;
}

- (IBAction)clickPlus:(id)sender {
    [self processOp: '+'];
}

- (IBAction)clickMultiply:(id)sender {
    [self processOp: '*'];
}

- (IBAction)clickMinus:(id)sender {
    [self processOp: '-'];
}

- (IBAction)clickDivide:(id)sender {
    [self processOp: '/'];
}

- (IBAction)clickOver:(id)sender {
    [self storeFracPart];
    isNumerator = NO;
    [displayString appendString: @"/"];
    display.text = displayString;
}

- (IBAction)clickInit:(id)sender {
    isNumerator = YES;
    firstOperand = YES;
    currentNumber = 0;
    [myCalculator clear];
    
    [displayString setString: @""];
    display.text = displayString;
}

- (IBAction)clickEqual:(id)sender {
    if (firstOperand == NO) {
        [self storeFracPart];
        [myCalculator performOperation: op];
        
        [displayString appendString: @" = "];
        [displayString appendString: [myCalculator.accumulator convertToString]];
        display.text = displayString;
        
        currentNumber = 0;
        isNumerator = YES;
        firstOperand = YES;
        [displayString setString: @""];
    }
}

@end
