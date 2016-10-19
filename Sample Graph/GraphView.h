//
//  GraphView.h
//  Sample Graph
//
//  Created by Rock My World 5 on 9/16/16.
//  Copyright © 2016 Rock My World Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GraphView : UIView

@property(strong, nonatomic) NSMutableArray *graphPoints;
@property(nonatomic) float duration;

- (id)initWithGraphPoints:(NSArray*)array WithFrame:(CGRect)frame;
- (void)doGraph;

@end
