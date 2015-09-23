//
//  MyPaintView.m
//  DrawBirdProject
//
//  Created by AmberWhiteSky on 15/9/20.
//  Copyright © 2015年 AmberWhiteSky. All rights reserved.
//

#import "MyPaintView.h"

@interface MyPaintView()

//@property (nonatomic,strong) NSMutableArray *totalPahtPoints;
@property(nonatomic,strong)  NSMutableArray  *paths;




@end

@implementation MyPaintView


//路径懒加载
-(NSMutableArray *)paths {
    if (_paths==nil) {
        _paths =[NSMutableArray  array];
    }
    return  _paths;
}

//清空
-(void)clear {
        [self.paths  removeAllObjects];
    [self setNeedsDisplay];
}
//回退
-(void)back{
        [self.paths  removeLastObject];
    [self setNeedsDisplay];
}
//
//-(NSMutableArray *)totalPahtPoints {
//    if (_totalPahtPoints==nil) {
//        _totalPahtPoints =[NSMutableArray   array];
//    }
//    return _totalPahtPoints;
//}

//确定起点
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesBegan");
    //获得当前的触摸点
    UITouch *touch =[touches  anyObject];
    CGPoint  startPoint =  [touch  locationInView:touch.view];
    
    //1创建一个新的路径
    UIBezierPath *currentPath =[UIBezierPath  bezierPath];
    currentPath.lineWidth =10;
    currentPath.lineCapStyle =kCGLineCapRound;
    currentPath.lineJoinStyle =kCGLineJoinRound;
    //2设置起点
    [currentPath  moveToPoint:startPoint];
    //3 添加路径到数组中
    [self.paths  addObject:currentPath];
    //刷新
    [self setNeedsDisplay];
    
    
    //    //每次一开始触摸，就新建一个数组来存放这次触摸过程的所有点(这次触摸过程的路径)
    //    NSMutableArray *pathPoints =[ NSMutableArray array];
    //    [pathPoints addObject:[NSValue valueWithCGPoint:startPoint]];
    //    //添加这次路径的所有点到大数组中
    //    [self.totalPahtPoints addObject:pathPoints];
    //    //需要重绘
}


//连线
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesMoved");
    
    UITouch  *touch =[touches  anyObject];
    CGPoint pos =[touch locationInView:touch.view];
    
    
    UIBezierPath  *currentPath =[self.paths  lastObject];
    [currentPath  addLineToPoint:pos];
    [self setNeedsDisplay];
    
    //    //取出这次路径对应的数组
    //    NSMutableArray *pathPoints =[self.totalPahtPoints lastObject];
    //    [pathPoints  addObject:[NSValue valueWithCGPoint:pos]];
    //    //需要重绘
    //    [self setNeedsDisplay];
    
    
}


-(void)  touchCustom{
    //    UITouch  *touch =[touches  anyObject];
    //    CGPoint pos =[touch locationInView:touch.view];
    //
    //    //取出这次路径对应的数组
    //    NSMutableArray *pathPoints =[self.totalPahtPoints lastObject];
    //    [pathPoints  addObject:[NSValue valueWithCGPoint:pos]];
    //    //需要重绘
    //    [self setNeedsDisplay];
    
}

//连线
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesEnded");
    
    //    UITouch  *touch =[touches  anyObject];
    //    CGPoint pos =[touch locationInView:touch.view];
    //
    //    //取出这次路径对应的数组
    //    NSMutableArray *pathPoints =[self.totalPahtPoints lastObject];
    //    [pathPoints  addObject:[NSValue valueWithCGPoint:pos]];
    //    //需要重绘
    //    [self setNeedsDisplay];
    
    [self touchesMoved:touches withEvent:event];
    //
}
//-(void)drawRect:(CGRect)rect
//{

// CGContextRef context =   UIGraphicsGetCurrentContext();
//
//    for (NSMutableArray  *pathPoints  in self.totalPahtPoints) {
//        for (int i=0; i<pathPoints.count; i++) {
//            CGPoint  pos =[pathPoints[i]  CGPointValue];
//            if (i==0) {
//                CGContextMoveToPoint(context, pos.x, pos.y);
//            }else{
//                CGContextAddLineToPoint(context, pos.x, pos.y);
//            }
//        }
//    }
//
//    //直线转弯处设置圆角
//    CGContextSetLineCap(context, kCGLineCapRound);
//
//    CGContextSetLineJoin(context, kCGLineJoinRound);
//    //设置线宽
//    CGContextSetLineWidth(context, 5);
//    //绘制
//    CGContextStrokePath(context);
//
//}

//-(void)drawRect:(CGRect)rect {
//    CGContextRef  context =UIGraphicsGetCurrentContext();
////    CGContextMoveToPoint(context, 0, 0);
////    CGContextAddLineToPoint(context, 100, 100 );
////    CGContextStrokePath(context);
//    CGMutablePathRef  path = CGPathCreateMutable();
//    CGPathMoveToPoint(path, NULL, 0, 0);
//    CGPathAddLineToPoint(path, NULL, 100, 100 );
//    CGContextAddPath(context, path);
//
//
//    CGMutablePathRef  path2 = CGPathCreateMutable();
//    CGPathMoveToPoint(path2, NULL, 250, 250);
//    CGPathAddLineToPoint(path2, NULL, 110, 100 );
//    CGContextAddPath(context, path2);
//
//    CGContextStrokePath(context);
//    CGPathRelease(path);
//}

//-(void)drawRect:(CGRect)rect {
//    UIBezierPath  *path =[UIBezierPath  bezierPath];
//    [path  moveToPoint:CGPointZero];
//    [path  addLineToPoint:CGPointMake(122, 22)];
//    [path  stroke];
//    
//    UIBezierPath  *path2 =[UIBezierPath  bezierPath];
//    [path2 moveToPoint:CGPointZero];
//    [path2 addLineToPoint:CGPointMake(12, 212)];
//    [path2 stroke];
//    
//    
//}


//绘制
-(void)drawRect:(CGRect)rect {
    //设置路径颜色
    [[UIColor  greenColor]set];
    for (UIBezierPath  *path in  self.paths ) {
        [path stroke];
    }

}

-(void)  testPath {
    
    
}
@end
