//
//  MyPaintView.m
//  DrawBirdProject
//
//  Created by AmberWhiteSky on 15/9/20.
//  Copyright © 2015年 AmberWhiteSky. All rights reserved.
//

#import "MyPaintView.h"

@interface MyPaintView()
@property(nonatomic,strong)  NSMutableArray * points;

@end

@implementation MyPaintView



//确定起点
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesBegan");
    UITouch *touch =[touches  anyObject];
    CGPoint  startPoint =  [touch  locationInView:touch.view];
    [self.points addObject:[NSValue valueWithCGPoint:startPoint]];
    //需要重绘
    [self setNeedsDisplay];
}


//连线
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesMoved");

    UITouch  *touch =[touches  anyObject];
    CGPoint currentPoint =[touch locationInView:touch.view];
    [self.points addObject:[NSValue valueWithCGPoint:currentPoint]];
    //需要重绘
    [self setNeedsDisplay];


}

//连线
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesEnded");

    UITouch  *touch =[touches  anyObject];
    CGPoint endPoint =[touch locationInView:touch.view];
    [self.points addObject:[NSValue valueWithCGPoint:endPoint]];
    //需要重绘
    [self setNeedsDisplay];

}
-(void)drawRect:(CGRect)rect
{
    NSLog(@"drawRect");
 CGContextRef context =   UIGraphicsGetCurrentContext();
    
    for (int  i=0; i<self.points.count; i++) {
        
        CGPoint  pos =[self.points[i] CGPointValue];
        
        if (i==0) {
            CGContextMoveToPoint(context, pos.x, pos.y);

        }else{
            CGContextAddLineToPoint(context, pos.x, pos.y);
        }
    }
    //直线转弯处设置圆角
    CGContextSetLineCap(context, kCGLineCapRound);
    //设置线宽
    CGContextSetLineWidth(context, 3);
    //绘制
    CGContextStrokePath(context);


}
@end
