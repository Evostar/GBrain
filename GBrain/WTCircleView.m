//
//  WTCircleView.m
//  GreatBrain
//
//  Created by Yorke on 14/12/13.
//  Copyright (c) 2014年 Yorke. All rights reserved.
//

#import "WTCircleView.h"



@implementation WTCircleView

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super initWithCoder:aDecoder]){
        self.colorName = @"蓝";
        self.color = [UIColor blueColor];
    }
    return self;
}

-(instancetype)init{
    if(self = [super init]){
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    float r = rect.size.width;
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(context, rect);
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextFillPath(context);
    CGContextSetShouldAntialias(context, YES);
    CGContextSetShouldSmoothFonts(context, YES);
    [self.colorName drawInRect:CGRectMake(r / 4, r / 4, r, r) withAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:r / 2],NSForegroundColorAttributeName:self.color}];
    
}


@end
