//
//  ViewController.h
//  tic tac toe
//
//  Created by Nicholas Cardinal on 1/27/16.
//  Copyright © 2016 nodigga. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController


-(void)buttonPressed:(UIButton *)sender;
-(void)drawLine:(int)startX:(int)startY:(int)endX :(int)endY;


@end

