//
//  MtViewController.m
//  Calculator
//
//  Created by Dwayne Park on 2016. 6. 16..
//  Copyright © 2016년 Dwayne Park. All rights reserved.
//

#import "MtViewController.h"

@interface MtViewController ()

@end

@implementation MtViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)changeColor:(id)sender {
    NSLog(@"MtView changeColor..");
    changeMainBackColor([UIColor blueColor]);
}

- (void)changeColorFunc:(void (^)(UIColor *))myFunc {
    changeMainBackColor = myFunc;
}

- (IBAction)goHome:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES
                                                      completion:nil];
}
@end
