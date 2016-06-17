//
//  InfoViewController.h
//  Calculator
//
//  Created by Dwayne Park on 2016. 6. 16..
//  Copyright © 2016년 Dwayne Park. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol InfoViewProtocol <NSObject>
- (void)changeColor:(UIColor *)newColor;
@end

@interface InfoViewController : UIViewController

@property (nonatomic, weak) NSString *myString;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;

// main 화면의 color를 변경하기 위한 용도
@property (nonatomic, strong) id<InfoViewProtocol> delegate;

- (IBAction)close:(id)sender;

- (IBAction)changeColor:(id)sender;

@end
