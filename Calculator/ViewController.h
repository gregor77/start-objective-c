//
//  ViewController.h
//  Calculator
//
//  Created by Dwayne Park on 2016. 6. 16..
//  Copyright © 2016년 Dwayne Park. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfoViewController.h"

@interface ViewController : UIViewController <InfoViewProtocol>

@property (weak, nonatomic) IBOutlet UILabel *display;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *myButtons;

- (IBAction)openNewView:(id)sender;

- (IBAction)openInfoView:(id)sender;

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

// disable
- (void)setButtonEnabled:(BOOL)val;

// mtView에 goHome을 처리하기 위해서 생성
- (IBAction)unwindToViewController:(UIStoryboardSegue *)sender;

// delegate처리를 위한 메소드
- (void)changeColor:(UIColor *)newColor;

@end

