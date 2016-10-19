//
//  SimpleViewController.m
//  Sample Graph
//
//  Created by Rock My World 5 on 9/16/16.
//  Copyright © 2016 Rock My World Inc. All rights reserved.
//

#import "SimpleViewController.h"
#import "GraphView.h"

@interface SimpleViewController (){   
    GraphView *graphView;
}

@end

@implementation SimpleViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //Pretend these values are being pulled in from some external source
    float duration = 45.0f;
    NSArray *graphPoints = @[@135, @153, @168, @177, @172, @173, @168, @171, @155, @140, @143, @140, @135, @133, @131];
    
    
    //Render the graph programmatically onto the screen with some points
    
 }


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
