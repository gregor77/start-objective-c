//
//  MtViewController.h
//  Calculator
//
//  Created by Dwayne Park on 2016. 6. 16..
//  Copyright © 2016년 Dwayne Park. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MtViewController : UIViewController {
    void(^changeMainBackColor)(UIColor*);
}

@property void(^newChangeMainBackColor)(UIColor*);

- (IBAction)changeColor:(id)sender;

- (void)changeColorFunc:(void(^)(UIColor*))myFunc;

- (IBAction)goHome:(id)sender;
@end
