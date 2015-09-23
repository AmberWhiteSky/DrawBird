//
//  ViewController.m
//  DrawBirdProject
//
//  Created by AmberWhiteSky on 15/9/20.
//  Copyright © 2015年 AmberWhiteSky. All rights reserved.
//

#import "ViewController.h"
#import "MyPaintView.h"
#import "UIImage+CatchPictureImageView.h"
@interface ViewController ()
- (IBAction)clear;
- (IBAction)back;
- (IBAction)save;
@property (weak, nonatomic) IBOutlet MyPaintView *paintView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//清空
- (IBAction)clear {
    [self.paintView  clear];
}
//回退
- (IBAction)back {
    [self.paintView back];
}

//保存
- (IBAction)save {
    //截图
    UIImage  *image =[UIImage  catchPicWithView:self.paintView ];
    //保存
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

//保存图片操作结束的时候调用
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    if (error) {
        NSLog(@"保存失败");
    }else  {
        NSLog(@"保存成功");
    }
    
}
@end
