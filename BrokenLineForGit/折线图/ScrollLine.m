//
//  ScrollLine.m
//  折线图
//
//  Created by 何钰堂 on 17/3/30.
//  Copyright © 2017年 heXin. All rights reserved.
//

#import "ScrollLine.h"
#import "BrokenPoint.h"

#define BTN_TAG 300

@interface ScrollLine (){
    float _lineWidth;   //线条宽度
    UIColor *_lineColor;   //线条颜色
    float _pointHeigh;  //坐标点长度
    float _pointMargin;
    float _height;  //当前视图高度
    float _width;   //当前视图宽度
    float _xHeight; //x轴高度
    float _pointCount;  //坐标点个数
    float _pointRadius; //坐标系上圆点的半径
}
@property (strong,nonatomic) NSMutableArray *points;
@end

@implementation ScrollLine
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        _height = frame.size.height;
        _width = frame.size.width;
        _lineWidth = 1;
        _pointHeigh = 3;
        _xHeight = _height - _pointHeigh;
        _pointMargin = _width / 30;
        _lineColor = [UIColor redColor];
        _pointRadius = 3;
        
        self.points = [NSMutableArray arrayWithCapacity:100];
        for (int i = 0; i<30; i++) {
            BrokenPoint *point = [[BrokenPoint alloc] init];
            point.x = _pointMargin * i;
            point.y = (double)(arc4random() % 100) / 100 * _height;
            [self.points addObject:point];
        }
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, 0, _xHeight); //原点
    CGContextAddLineToPoint(context, _width * 3, _xHeight); //画x轴
//    CGContextClosePath(context);
    CGContextSetLineWidth(context, _lineWidth);
    
    for (int i=0; i<30; i++) {
        CGContextMoveToPoint(context, _pointMargin * i, _xHeight);
        CGContextAddLineToPoint(context, _pointMargin * i, _height);
    }
    
    BrokenPoint *firstPoint = self.points[0];
    [self drawPointInPoint:firstPoint];
    CGContextMoveToPoint(context, firstPoint.x, _xHeight);
    CGContextAddLineToPoint(context, firstPoint.x, firstPoint.y);
    for (int i = 1; i < self.points.count; i++) {
        BrokenPoint *point = self.points[i];
        CGContextAddLineToPoint(context, point.x, point.y);
        [self drawPointInPoint:point];
    }
    BrokenPoint *endPoint = self.points.lastObject;
    [self drawPointInPoint:endPoint];
    CGContextAddLineToPoint(context, endPoint.x, _xHeight);
    CGContextClosePath(context);
    
    [_lineColor setStroke];
    [[UIColor yellowColor] setFill];
    CGContextDrawPath(context, kCGPathFillStroke);
}
- (void)drawPointInPoint:(BrokenPoint *)point{
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(point.x - _pointRadius,
                                                               point.y - _pointRadius,
                                                               _pointRadius * 2,
                                                               _pointRadius * 2)];
    btn.layer.cornerRadius = _pointRadius;
    btn.clipsToBounds = YES;
    btn.backgroundColor = [UIColor purpleColor];
    [self addSubview:btn];
}
@end
