//
//  ViewController.h
//  Calculator
//
//  Created by Dwayne Park on 2016. 6. 16..
//  Copyright © 2016년 Dwayne Park. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *display;

- (IBAction)clickDigit:(UIButton *)sender;

- (void)processDigit:(int)digit;
- (void)processOp:(char)theOp;
- (void)storeFracPart;

// 산술연산키
- (IBAction)clickPlus:(id)sender;
- (IBAction)clickMultiply:(id)sender;
- (IBAction)clickMinus:(id)sender;
- (IBAction)clickDivide:(id)sender;

// 기타키
- (IBAction)clickOver:(id)sender;
- (IBAction)clickInit:(id)sender;
- (IBAction)clickEqual:(id)sender;

@end

