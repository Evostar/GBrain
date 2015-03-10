//
//  WTArrowView.m
//  GreatBrain
//
//  Created by Yorke on 14/12/13.
//  Copyright (c) 2014年 Yorke. All rights reserved.
//

#import "WTArrowView.h"

@implementation WTArrowView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    if(self.tag == LeftTag){
        UIBezierPath* ovalPath;
        for(int i = 0; i < 2; i++){
            ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(27, i * 34, 6, 6)];
            [UIColor.grayColor setFill];
            [ovalPath fill];
        }
        
        for(int i = 0; i < 2; i++){
            for(int j = 0; j < 2; j++){
                ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(27 + i * 9, 8 + j * 18, 6, 6)];
                [UIColor.grayColor setFill];
                [ovalPath fill];
            }
        }
        //center line
        for(int i = 0; i < 6; i++){
            ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(i * 9, 17, 6, 6)];
            [UIColor.grayColor setFill];
            [ovalPath fill];
        }
    }else if (self.tag == RightTag){
        UIBezierPath* ovalPath;
        for(int i = 0; i < 2; i++){
            ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(18, i * 34, 6, 6)];
            [UIColor.grayColor setFill];
            [ovalPath fill];
        }
        
        for(int i = 0; i < 2; i++){
            for(int j = 0; j < 2; j++){
                ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(9 + i * 9, 8 + j * 18, 6, 6)];
                [UIColor.grayColor setFill];
                [ovalPath fill];
            }
        }
        //center line
        for(int i = 0; i < 6; i++){
            ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(i * 9, 17, 6, 6)];
            [UIColor.grayColor setFill];
            [ovalPath fill];
        }
    }
    
    
}


@end
