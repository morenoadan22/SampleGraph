//
//  GraphView.m
//  Sample Graph
//
//  Created by Rock My World 5 on 9/16/16.
//  Copyright © 2016 Rock My World Inc. All rights reserved.
//

#import "GraphView.h"

#define kGraphHeight 300
#define kDefaultGraphWidth 900
#define kOffsetX 10
#define kStepX 50
#define kGraphBottom 300
#define kGraphTop 0

#define kCircleRadius 3

@implementation GraphView {
    UIBezierPath *uibp_GroupPath;
    CAShapeLayer *casl_GraphLayout;
}

@synthesize graphPoints;

- (id)init {
    self = [super init];
    if (self) {
        //If we must initialize things here.
    }
    
    return self;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (id)initWithGraphPoints:(NSArray*)array WithFrame:(CGRect)frame {
    self = [super init];
    if (self) {
        graphPoints = [array copy];
        self.frame = frame;
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect {
    [self doGraph];
}

- (void)doGraph {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 0.6);
    CGContextSetStrokeColorWithColor(context, [[UIColor lightGrayColor] CGColor]);
    
    // How many lines?
    int howMany = (kDefaultGraphWidth - kOffsetX) / kStepX;
    
    // Here the lines go
    for (int i = 0; i < howMany; i++)
    {
        CGContextMoveToPoint(context, kOffsetX + i * kStepX, kGraphTop);
        CGContextAddLineToPoint(context, kOffsetX + i * kStepX, kGraphBottom);
    }
    
    CGContextStrokePath(context);
    
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    
    int graphHeight = self.bounds.size.height/2;
    CGContextBeginPath(context);
    
    //Initial
    CGContextMoveToPoint(context, 0, graphHeight);
    
    //Lets loop through the points
    for(int i = 1; i < sizeof(graphPoints); i++) {
        CGContextAddLineToPoint(context, (10 + i * 50), [graphPoints[i] integerValue]);
    }
    
    CGFloat dash[] = {2.0, 2.0};
    CGContextSetLineDash(context, 0.0, dash, 2);
    
    CGContextDrawPath(context, kCGPathStroke);
    
    CGContextSetFillColorWithColor(context, [[UIColor colorWithRed:1.0 green:0.5 blue:0 alpha:1.0] CGColor]);
    
    for (int i = 1; i < sizeof(graphPoints) - 1; i++)
    {
        float x = 10 + i * 50;
        float y = graphHeight *  [graphPoints[i] integerValue];
        CGRect rect = CGRectMake(x - kCircleRadius, y - kCircleRadius, 2 * kCircleRadius, 2 * kCircleRadius);
        CGContextAddEllipseInRect(context, rect);
    }
    
    CGContextDrawPath(context, kCGPathFillStroke);
}

@end
