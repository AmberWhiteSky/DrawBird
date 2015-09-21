//
//  MyPaintView.m
//  DrawBirdProject
//
//  Created by AmberWhiteSky on 15/9/20.
//  Copyright © 2015年 AmberWhiteSky. All rights reserved.
//

#import "MyPaintView.h"

@interface MyPaintView()

@property (nonatomic,strong) NSMutableArray *totalPahtPoints;




@end

@implementation MyPaintView

-(NSMutableArray *)totalPahtPoints {
    if (_totalPahtPoints==nil) {
        _totalPahtPoints =[NSMutableArray   array];
    }
    return _totalPahtPoints;
}

//确定起点
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesBegan");
    UITouch *touch =[touches  anyObject];
    CGPoint  startPoint =  [touch  locationInView:touch.view];
    
    
    //每次一开始触摸，就新建一个数组来存放这次触摸过程的所有点(这次触摸过程的路径)
    NSMutableArray *pathPoints =[ NSMutableArray array];
    [pathPoints addObject:[NSValue valueWithCGPoint:startPoint]];
    //添加这次路径的所有点到大数组中
    [self.totalPahtPoints addObject:pathPoints];
    //需要重绘
    [self setNeedsDisplay];
}


//连线
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesMoved");

    UITouch  *touch =[touches  anyObject];
    CGPoint currentPoint =[touch locationInView:touch.view];
    
    //取出这次路径对应的数组
    NSMutableArray *pathPoints =[self.totalPahtPoints lastObject];
    [pathPoints  addObject:[NSValue valueWithCGPoint:currentPoint]];
    //需要重绘
    [self setNeedsDisplay];


}

//连线
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesEnded");

    UITouch  *touch =[touches  anyObject];
    CGPoint endPoint =[touch locationInView:touch.view];
    
    //取出这次路径对应的数组
    NSMutableArray *pathPoints =[self.totalPahtPoints lastObject];
    [pathPoints  addObject:[NSValue valueWithCGPoint:endPoint]];
    //需要重绘
    [self setNeedsDisplay];

}
-(void)drawRect:(CGRect)rect
{
  
 CGContextRef context =   UIGraphicsGetCurrentContext();
    
    for (NSMutableArray  *pathPoints  in self.totalPahtPoints) {
        for (int i=0; i<pathPoints.count; i++) {
            CGPoint  pos =[pathPoints[i]  CGPointValue];
            if (i==0) {
                CGContextMoveToPoint(context, pos.x, pos.y);
            }else{
                CGContextAddLineToPoint(context, pos.x, pos.y);
            }
        }
    }

    //直线转弯处设置圆角
    CGContextSetLineCap(context, kCGLineCapRound);
    
    CGContextSetLineJoin(context, kCGLineJoinRound);
    //设置线宽
    CGContextSetLineWidth(context, 5);
    //绘制
    CGContextStrokePath(context);


}
@end
