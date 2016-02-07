//
//  ViewController.m
//  tic tac toe
//
//  Created by Nicholas Cardinal on 1/27/16.
//  Copyright © 2016 nodigga. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"

@interface ViewController ()
{
    Model *model;

}

@property (nonatomic)  UIButton *button, *reset;
@property (nonatomic,strong) UILabel *winnerLabel;
@property (nonatomic,strong)UIImage *imageToCheck;

@property (nonatomic, strong) UIView *drawView;

@property int player;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];


    self.imageToCheck = [UIImage imageNamed:@"testbutton.png"];
    
    model = [[Model alloc]init];

    self.player = 0;
    
    CGRect labelFrame = CGRectMake(50, 100, 200, 50);
    self.winnerLabel = [[UILabel alloc]initWithFrame:labelFrame];
    [self.winnerLabel setText:@"in progress"];
    
    [self.view addSubview:self.winnerLabel];
    
    CGRect resetFrame = CGRectMake(10, 50, 30, 30);
    UIButton *reset = [[UIButton alloc]initWithFrame:resetFrame];
    [reset addTarget:self action:@selector(resetButtons) forControlEvents:UIControlEventTouchUpInside];
    [reset setImage:self.imageToCheck forState:UIControlStateNormal];
    
    [self.view addSubview:reset];

    int tag = 1;
    
    for (int i = 0; i < 3; i++)  //this will be the rows
    {
        for(int j = 0; j < 3; j++)  // this will be the columns
        {
            self.button = [UIButton buttonWithType:UIButtonTypeCustom];
            self.button.frame = CGRectMake(75 + (j*75), 200+(i*75), 50, 50);
            [self.view addSubview:self.button];
            [self.button setImage:self.imageToCheck forState:UIControlStateNormal];
            [self.button setTag:tag];
            [self.button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
            tag++;
        }
    }
}

-(void)drawLine:(int)startX:(int)startY:(int)endX :(int)endY;
{

    //drawing a clear view that's the tic tac toe board
    
    CGRect drawFame = CGRectMake(75, 200, 200, 200);
    self.drawView = [[UIView alloc]initWithFrame:drawFame];
    [self.drawView setBackgroundColor:[UIColor clearColor]];
    
    [self.view addSubview:self.drawView];
    [self.view bringSubviewToFront:self.drawView];
    
    [self.drawView drawRect:drawFame];
    
    //drawing line on top of button's view
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(startX,startY)];
    [path addLineToPoint:CGPointMake(endX, endY)];
    
    
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.frame = self.drawView.bounds;
    pathLayer.path = path.CGPath;
    pathLayer.strokeColor = [[UIColor redColor] CGColor];
    pathLayer.fillColor = nil;
    pathLayer.lineWidth = 5.0f;
    pathLayer.lineJoin = kCALineJoinBevel;
    
    [self.drawView.layer addSublayer:pathLayer];
    
    //how fast it animates
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    // total time it takes to animate
    pathAnimation.duration = 2.0;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    //speed at which it animates
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    [pathLayer addAnimation:pathAnimation forKey:@"strokeEnd"];
}


-(void)buttonPressed:(UIButton *)sender
{
   // UIImage *newImage = [sender imageForState:UIControlStateNormal];
    
    if(self.player%2==0 && ([sender imageForState:UIControlStateNormal] == self.imageToCheck))
    {
    self.player++;
    [sender setImage:[UIImage imageNamed:@"circle.png"] forState:UIControlStateNormal];
    [model determineWinner:(NSInteger)sender.tag:2];
        
        
        if(model.winner)
        {
            self.winnerLabel.text = @"Player O Wins";
            [self drawLine:200:0:0:200];
          //  [self resetButtons];
        }
        
    }
    else
    {
        
        if ([sender imageForState:UIControlStateNormal] == self.imageToCheck)
        {
            self.player++;
            [sender setImage:[UIImage imageNamed:@"cross.png"] forState:UIControlStateNormal];
    
            [model determineWinner:(NSInteger)sender.tag:1];
    
            if(model.winner)
            {
                self.winnerLabel.text = @"Player X Wins";
                [self drawLine:0:0:100:200];
                
           // [self resetButtons];
            }
        }
    }
}


//diagonal left to bottom right (0,0,200, 200)
//diagonal right to bottom left(200, 0, 0, 200)

//top row horizontal (0, 25, 200, 25)
//second row horizontal (0, 100, 200, 100)
//third row horizontal (0, 175, 200, 175)

//first column (25, 0, 25, 200)
//second column(100, 0, 100, 200)
//third column (175, 0, 175, 200)


-(void)resetButtons
{
    NSLog(@"reset selected");
    for(int x=1; x<10; x++)
    {
    UIButton *change = (UIButton*)[self.view viewWithTag:x];
    [change setImage:[UIImage imageNamed:@"testbutton.png"] forState:UIControlStateNormal];
    }
    
    self.player = 0;
    self.winnerLabel.text = @"";
    
    [model resetPlayers];
  
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
void MyDrawColoredPattern (void *info, CGContextRef context) {
    
    CGColorRef dotColor = [UIColor colorWithHue:0 saturation:0 brightness:0.07 alpha:1.0].CGColor;
    CGColorRef shadowColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.1].CGColor;
    
    CGContextSetFillColorWithColor(context, dotColor);
    CGContextSetShadowWithColor(context, CGSizeMake(0, 1), 1, shadowColor);
    
    CGContextAddArc(context, 3, 3, 4, 0, 360, 0);
    CGContextFillPath(context);
    
    CGContextAddArc(context, 16, 16, 4, 0, 360, 0);
    CGContextFillPath(context);
    
}


@end
