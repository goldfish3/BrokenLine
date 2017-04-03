//
//  BrokenLine.m
//  折线图
//
//  Created by 何钰堂 on 17/3/30.
//  Copyright © 2017年 heXin. All rights reserved.
//

#import "BrokenLine.h"
#import "BrokenLineScroll.h"

@interface BrokenLine (){
    float _scrollPosition;
    float _margin;
    float _height;
    float _width;
    float _pointLength;
}

@end

@implementation BrokenLine
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        _scrollPosition = 20;
        _pointLength = 3;
        _margin = frame.size.height / 5;
        _height = frame.size.height;
        _width = frame.size.width;
        BrokenLineScroll *scroll = [[BrokenLineScroll alloc] initWithFrame:CGRectMake(_scrollPosition,
                                                                                      0,
                                                                                      frame.size.width-40,
                                                                                      frame.size.height)];
        [self addSubview:scroll];
    }
    return self;
}
- (void)drawRect:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, _scrollPosition, _height);
    CGContextAddLineToPoint(context, _scrollPosition, 0);
    
    for (int i=1; i<=5; i++) {
        int pointHeight = _height - _margin * i;
        CGContextMoveToPoint(context, _scrollPosition, pointHeight);
        CGContextAddLineToPoint(context, _scrollPosition - _pointLength, pointHeight);
    }
    
    [[UIColor redColor] setStroke];
    CGContextDrawPath(context, kCGPathFillStroke);
}
@end
