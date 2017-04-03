//
//  BrokenLineScroll.m
//  折线图
//
//  Created by 何钰堂 on 17/3/30.
//  Copyright © 2017年 heXin. All rights reserved.
//

#import "BrokenLineScroll.h"
#import "ScrollLine.h"

@interface BrokenLineScroll (){
    float _height;  //当前视图高度
    float _width;   //当前视图宽度
}
@end

@implementation BrokenLineScroll
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.contentSize = CGSizeMake(frame.size.width * 3, 0);
        self.bounces = NO;
        _width = frame.size.width;
        _height = frame.size.height;
        ScrollLine *scrollLine = [[ScrollLine alloc] initWithFrame:CGRectMake(0, 0, _width * 3, _height)];
        [self addSubview:scrollLine];
    }
    return self;
}
@end
