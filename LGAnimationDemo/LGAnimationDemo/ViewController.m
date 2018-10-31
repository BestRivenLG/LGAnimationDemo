//
//  ViewController.m
//  LGAnimationDemo
//
//  Created by shuangwuxu on 2018/10/31.
//  Copyright © 2018年 shuangwuxu. All rights reserved.
//

#import "ViewController.h"
#import "PurchaseCarAnimationTool.h"

@interface ViewController ()
@property (nonatomic,strong)UIImageView *imgView;
@property (nonatomic,strong)UIImageView *imgView2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imgView= [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    imgView.image = [UIImage imageNamed:@"commodity_2"];
    [self.view addSubview:imgView];
    self.imgView = imgView;

    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 100, 30)];
    [btn addTarget:self action:@selector(addAction:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"加入购物车" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    UIImageView *imgView2= [[UIImageView alloc] initWithFrame:CGRectMake(size.width - 80, size.height - 80, 40, 40)];
    imgView2.image = [UIImage imageNamed:@"shoppingCar_sel"];

    [self.view addSubview:imgView2];
    self.imgView2 = imgView2;
}
- (void)addAction:(UIButton *)sender {
    
//    [[PurchaseCarAnimationTool shareTool] startAnimationandView:self.imgView rect:self.imgView.frame finisnPoint:self.imgView2.center finishBlock:^(BOOL finish) {
//        
//    }];
    
    [PurchaseCarAnimationTool shakeAnimation:self.imgView];
    __weak  typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[PurchaseCarAnimationTool shareTool] startAnimationandView:weakSelf.imgView rect:weakSelf.imgView.frame finisnPoint:weakSelf.imgView2.center finishBlock:^(BOOL finish) {
    
        }];
    });
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
