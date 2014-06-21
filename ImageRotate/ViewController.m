//
//  ViewController.m
//  ImageRotate
//
//  Created by mingchen on 6/19/14.
//  Copyright (c) 2014 sencloudx. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Rotate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    UIImage* source = [UIImage imageNamed:@"abc.jpg"];

    UIImageView* sourceShow = [[UIImageView alloc] initWithImage:source];

    [self.view addSubview:sourceShow];

    UIImage* rotate90 = [source rotateDegree:M_PI_2];

    UIImageView* rotate90Show = [[UIImageView alloc] initWithImage:rotate90];

    [self.view addSubview:rotate90Show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
