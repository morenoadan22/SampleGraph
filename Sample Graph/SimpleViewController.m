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
    UIView *containerView;
    GraphView *gv_Graph;
    UITextField *valuesTF;
    NSMutableArray *graphPoints;
}

@end

@implementation SimpleViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Sample Graph";
    
    float duration = 45.0f;
    
    [self.view setBackgroundColor:[UIColor darkGrayColor]];
    
    //Initial Values that was in the project
    graphPoints = [[NSMutableArray alloc] initWithArray:@[@135, @153, @168, @177, @155, @166, @171, @173, @150, @140, @130]];
    
    //This is where we want to draw the graph.
    //Fix initialization later.
    gv_Graph = [[GraphView alloc] initWithGraphPoints:graphPoints WithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    gv_Graph.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:gv_Graph];
    
    valuesTF = [[UITextField alloc] initWithFrame:CGRectMake(self.view.superview.center.x + 40, self.view.frame.size.height - 350, 300, 30)];
    [valuesTF setBorderStyle:UITextBorderStyleRoundedRect];
    [valuesTF setKeyboardType:UIKeyboardTypePhonePad];
    [self.view addSubview:valuesTF];
    
    UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [submitButton setFrame:CGRectMake(self.view.superview.center.x + 40, self.view.frame.size.height - 300, 300, 40)];
    [submitButton setTitle:@"Submit" forState:UIControlStateNormal];
    [submitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [submitButton setBackgroundColor:[UIColor redColor]];
    [submitButton addTarget:self action:@selector(displayNewValues) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:submitButton];
}

- (void)displayNewValues {
    [self.view endEditing:true];
    NSString *currentText = valuesTF.text;
    NSString *error = @"";
    
    if([currentText isEqualToString:@""]) {
        error = @"Please enter comma separated values. i.e. (123*456*431*123)";
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error bro!"
                                                        message:error
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    } else {
        unsigned int len = [currentText length];
        char buffer[len];
        
        //This way:
        strcpy(buffer, [currentText UTF8String]);
        
        //Or this way (preferred):
        
        [currentText getCharacters:buffer range:NSMakeRange(0, len)];
        
        NSString *tempHolder = @"";
        
        for(int i = 0; i < len; ++i) {
            char current = buffer[i];
            
            if (current == '*') {
                [graphPoints addObject:[NSNumber numberWithInt:[tempHolder intValue]]];
                tempHolder = @"";
            } else {
                tempHolder = [tempHolder stringByAppendingFormat:@"%c", current];
            }
        }
        
        gv_Graph = nil;
        [gv_Graph removeFromSuperview];
        
        gv_Graph = [[GraphView alloc] initWithGraphPoints:graphPoints WithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
        gv_Graph.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:gv_Graph];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
