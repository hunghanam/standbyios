//
//  ViewController.m
//  standbyBackground
//
//  Created by HungLV on 15/01/2015.
//  Copyright (c) Năm 2015 jp.co.enterAsia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIImageView *imageView;
    UILabel *scrollLabel, *jaLabel, *enLabel;
    NSTimer *mytime,*timeChangeBg;
    NSArray *bgStandby;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//     Do any additional setup after loading the view, typically from a nib.
    bgStandby = @[@"bg1.jpg",@"bg2.jpg",@"bg3.jpg",@"bg4.jpg"];
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x,self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:imageView];
    imageView.image = [UIImage imageNamed:@"bg4.jpg"];
    scrollLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.origin.x + self.view.frame.size.width,
                                                        200,
                                                        self.view.frame.size.width,
                                                        30)];
    scrollLabel.text = @"Scroll messages animation";
    scrollLabel.textColor = [UIColor whiteColor];
    scrollLabel.font = [UIFont boldSystemFontOfSize:30.0f];
    scrollLabel.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:scrollLabel];
    
    jaLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.origin.x,
                                                        250,
                                                        self.view.frame.size.width,
                                                        30)];
    jaLabel.text = @"Label messages one";
    jaLabel.textColor = [UIColor whiteColor];
    jaLabel.font = [UIFont systemFontOfSize:14.0f];
    jaLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:jaLabel];
    
    enLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.origin.x,
                                                        270,
                                                        self.view.frame.size.width,
                                                        30)];
    enLabel.text = @"Label messages two";
    enLabel.textColor = [UIColor whiteColor];
    enLabel.font = [UIFont systemFontOfSize:14.0f];
    enLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:enLabel];
    mytime = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(setScrollMessages) userInfo:nil repeats:YES];
    timeChangeBg = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(changeBackground) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setScrollMessages
{
    [mytime invalidate];
    if (scrollLabel.frame.origin.x  > self.view.frame.origin.x) {
            [UIView animateWithDuration:6
                                  delay:0
                                options:UIViewAnimationOptionCurveLinear
                            animations:^{
                                 CGRect frame = scrollLabel.frame;
                                 frame.origin.x = -350.0f;
                                 scrollLabel.frame = frame;
                            }
                            completion:^(BOOL finished)
                            {
                                [scrollLabel setFrame:CGRectMake(self.view.frame.origin.x + self.view.frame.size.width,
                                                                200,
                                                                self.view.frame.size.width,
                                                                30)];
                                [self startTimer];
                            }
             ];
    }
}
- (void) changeBackground
{
    static int i = 0;
    i ++;
    if (i < bgStandby.count) {
        UIImage * toImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@",bgStandby[i]]];
        [UIView transitionWithView:imageView
                          duration:5.0f
                           options:UIViewAnimationOptionTransitionCrossDissolve
                        animations:^{
                            imageView.image = toImage;
                        } completion:nil];
    }
    else
    {
        i = 0;
    }
}
- (void) startTimer
{
    mytime = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(setScrollMessages) userInfo:nil repeats:YES];
}
@end
