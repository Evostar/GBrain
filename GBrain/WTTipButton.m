//
//  WTTipButton.m
//  GreatBrain
//
//  Created by Yorke on 14/12/13.
//  Copyright (c) 2014年 Yorke. All rights reserved.
//

#import "WTTipButton.h"
#import "WTTipView.h"

@implementation WTTipButton

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super initWithCoder:aDecoder]){
        WTTipView *view = [[WTTipView alloc]initWithFrame:CGRectMake(5, 5, 40, 40)];
        view.tag = self.tag;
        view.backgroundColor = [UIColor clearColor];
        [self addSubview:view];
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
