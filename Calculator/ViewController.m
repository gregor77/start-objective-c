//
//  ViewController.m
//  Calculator
//
//  Created by Dwayne Park on 2016. 6. 16..
//  Copyright © 2016년 Dwayne Park. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"
#import "InfoViewController.h"
#import "MtViewController.h"

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
    
    NSLog(@"viewDidLoad");
    
    // Do any additional setup after loading the view, typically from a nib.
    firstOperand = YES;
    isNumerator = YES;
    displayString = [NSMutableString stringWithCapacity: 40];
    myCalculator = [[Calculator alloc] init];
    
    [self setButtonEnabled:YES];
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
    
    [self setButtonEnabled:NO];
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
    
    [self setButtonEnabled:YES];
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
        
        [self setButtonEnabled:YES];
    }
}

- (void)setButtonEnabled:(BOOL)val
{
    for (int i=0; i<self.myButtons.count; i++) {
        UIButton *btn = [self.myButtons objectAtIndex:i];
        btn.enabled = val;
    }
}

- (IBAction)openNewView:(id)sender {
    NSLog(@"openNewView by segue");
//    [self performSegueWithIdentifier:@"versionview" sender:self];
    [self performSegueWithIdentifier:@"mtview" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSLog(@"Segue ID = %@", segue.identifier);
    
    if ([segue.identifier isEqualToString: @"versionview"]) {
        InfoViewController *infoView = [segue destinationViewController];
        infoView.myString = @"Hello World";
    } else if ([segue.identifier isEqualToString:@"mtview"]) {
        MtViewController *mtView = [segue destinationViewController];
        [mtView changeColorFunc:^(UIColor *newColor) {
            [self.view setBackgroundColor:newColor];
        }];
    }
}

- (IBAction)openInfoView:(id)sender {
    InfoViewController *infoViewController = [self.storyboard
                                              instantiateViewControllerWithIdentifier:@"infoview"];
    
    // ViewCotroller의 인스턴스 주소값을 할당
    infoViewController.delegate = self;
    
    infoViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
//    infoViewController.myString = @"Hello World";
    infoViewController.myString = self.display.text;
    
    // 마지막에 completion은 delegate 역학을 대신한다. InfoViewController에서 첫째화면으로 호출할 블록함수
    [self presentViewController:infoViewController
                       animated:YES
                     completion:nil];
}


- (IBAction)unwindToViewController:(UIStoryboardSegue *)sender {
    NSLog(@"unwindToViewController");
}

- (void) changeColor:(UIColor *)newColor {
    NSLog(@"Change Color !");
    
    [self.view setBackgroundColor: newColor];
}

@end
