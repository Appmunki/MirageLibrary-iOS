//
//  MGViewController.m
//  Mirage
//
//  Created by Diego German Amezquita Mesa on 7/30/13.
//  Copyright (c) 2013 appmunki. All rights reserved.
//

#import "MGViewController.h"

@interface MGViewController ()

@end

@implementation MGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSString *imageFilepath = [[NSBundle mainBundle] pathForResource:@"iron-man-3-poster" ofType:@"jpg"];
    
    MGApi *mirage = [[MGApi alloc] init:@"gy7c9vN3sRbNF5MqpsepGH0xlRMwTSJ9Jmrx5cKY"];
    
    [mirage createPatternWithName:@"library ios test" description:@"description" path:imageFilepath];
    
    [mirage deletePatternWithId:@"24"];
    
    [mirage editPatternWithId:@"23" name:@"library ios test" description:@"description"];
    
    [mirage doMatch:imageFilepath];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
