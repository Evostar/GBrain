//
//  WTTipView.m
//  GreatBrain
//
//  Created by Yorke on 14/12/13.
//  Copyright (c) 2014年 Yorke. All rights reserved.
//

#import "WTTipView.h"


@implementation WTTipView

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super initWithCoder:aDecoder]){
        self.userInteractionEnabled = NO;
    }
    return self;
}

-(instancetype)init{
    if(self = [super init]){
        self.userInteractionEnabled = NO;
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        self.userInteractionEnabled = NO;
    }
    return self;
}

-(void)drawRect:(CGRect)rect{
    if(self.tag == YesTag){
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(4.5, 29.38)];
        [bezierPath addLineToPoint: CGPointMake(8.86, 24.26)];
        [bezierPath addLineToPoint: CGPointMake(17.59, 34.5)];
        [bezierPath addLineToPoint: CGPointMake(36.5, 5.5)];
        [[UIColor whiteColor] setStroke];
        bezierPath.lineWidth = 2;
        [bezierPath stroke];
    }else if (self.tag == NoTag){
        UIBezierPath* bezierPath = UIBezierPath.bezierPath;
        [bezierPath moveToPoint: CGPointMake(5, 5)];
        [bezierPath addLineToPoint: CGPointMake(35, 35)];
        [[UIColor whiteColor] setStroke];
        bezierPath.lineWidth = 2;
        [bezierPath stroke];
    
        UIBezierPath* bezier2Path = UIBezierPath.bezierPath;
        [bezier2Path moveToPoint: CGPointMake(5, 35)];
        [bezier2Path addLineToPoint: CGPointMake(35, 5)];
        [[UIColor whiteColor] setStroke];
        bezier2Path.lineWidth = 2;
        [bezier2Path stroke];
    }
    
}

@end
